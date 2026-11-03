/- # Problem 61A

(Easy 🌟) Collect the leaves of a binary tree in a list.

A leaf is a node with no successors. Write a function `leaves` to collect them in a list, from left to right.
-/
/-- binary tree -/
inductive BinTree (α : Type) where
  | empty : BinTree α
  | node : α → BinTree α → BinTree α → BinTree α
deriving DecidableEq, Repr

variable {α : Type}

/-- a node without children -/
def BinTree.leaf (a : α) : BinTree α := .node a .empty .empty

/-- syntax for writing binary trees:
`[tree| 1 * (2 + ∅)]` is the tree whose root is `1`,
whose left child is the leaf `2`, and whose right subtree is empty. -/
declare_syntax_cat bintree
syntax "[tree| " bintree "]" : term
syntax tree_label := num <|> str <|> char
syntax tree_label : bintree
syntax "∅" : bintree
syntax tree_label " * " "(" bintree " + " bintree ")" : bintree

open Lean in
def expandTreeLabel (stx : TSyntax `tree_label) : MacroM (TSyntax `term) :=
  match stx with
  | `(tree_label| $n:num) => `($n)
  | `(tree_label| $s:str) => `($s)
  | `(tree_label| $c:char) => `($c)
  | _ => Macro.throwUnsupported

macro_rules
  | `([tree| ∅]) => `(BinTree.empty)
  | `([tree| $v:tree_label]) => do
    `(BinTree.leaf $(← expandTreeLabel v))
  | `([tree| $v:tree_label * ($l + $r)]) => do
    `(BinTree.node $(← expandTreeLabel v) [tree| $l] [tree| $r])

def leaves (t : BinTree α) : List α :=
  -- sorry
  match t with
  | .empty => []
  | .node v .empty .empty => [v]
  | .node _ left right => leaves left ++ leaves right
  -- sorry

-- The following codes are for test and you should not edit these.

#guard leaves (BinTree.empty : BinTree Nat) = []
#guard leaves [tree| 1] = [1]
#guard leaves [tree| 1 * (2 + 3)] = [2, 3]
#guard leaves [tree| 1 * (2 * (∅ + 4) + ∅)] = [4]
#guard leaves [tree| 1 * (2 * (3 + 4) + 5 * (6 + 7))] = [3, 4, 6, 7]
