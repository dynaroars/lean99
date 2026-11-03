/- # Problem 62B

(Easy 🌟) Collect the nodes at a given level in a list.

A node of a binary tree is at level `n` if the path from the root to the node has length `n - 1`.
The root node is at level 1.
Write a function `atLevel` to collect all nodes at a given level in a list, from left to right.
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

def atLevel (t : BinTree α) (level : Nat) : List α :=
  -- sorry
  match t, level with
  | _, 0 => []
  | .empty, _ => []
  | .node v _ _, 1 => [v]
  | .node _ left right, l + 1 => atLevel left l ++ atLevel right l
  -- sorry

-- The following codes are for test and you should not edit these.

#guard atLevel [tree| 1] 0 = []
#guard atLevel [tree| 1] 1 = [1]
#guard atLevel [tree| 1 * (2 + 3)] 2 = [2, 3]
#guard atLevel [tree| 1 * (2 * (3 + 4) + 5 * (6 + 7))] 2 = [2, 5]
#guard atLevel [tree| 1 * (2 * (3 + 4) + 5 * (6 + 7))] 3 = [3, 4, 6, 7]
#guard atLevel [tree| 1 * (2 * (3 + 4) + 5 * (6 + 7))] 4 = []
