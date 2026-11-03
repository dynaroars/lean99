/- # Problem 62

(Easy 🌟) Collect the internal nodes of a binary tree in a list.

An internal node of a binary tree has either one or two non-empty successors.
Write a function `internals` to collect them in a list (root first, then the left subtree, then the right subtree).
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

def internals (t : BinTree α) : List α :=
  -- sorry
  match t with
  | .empty => []
  | .node _ .empty .empty => []
  | .node v left right => v :: (internals left ++ internals right)
  -- sorry

-- The following codes are for test and you should not edit these.

#guard internals [tree| 1] = []
#guard internals [tree| 1 * (2 + 3)] = [1]
#guard internals [tree| 1 * (2 * (∅ + 4) + ∅)] = [1, 2]
#guard internals [tree| 1 * (2 * (3 + 4) + 5 * (6 + 7))] = [1, 2, 5]
