/- # Problem 64

(Intermediate 🌟🌟) Layout a binary tree (1).

Given a binary tree as the usual `BinTree`, we want to prepare it for drawing.
Each node is annotated with its position `(x, y)` in a rectangular grid, using the following rule:

* `x` is the position of the node in the in-order sequence of the tree (the leftmost node has `x = 1`),
* `y` is the depth of the node in the tree (the root has `y = 1`).

Write a function `BinTree.layout` that annotates each node of a tree with its position.
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

/-- list the nodes of a binary tree in pre-order -/
def BinTree.toList : BinTree α → List α
  | .empty => []
  | .node a l r => a :: (l.toList ++ r.toList)

/-- annotate each node with its position `(x, y)` -/
def BinTree.layout (t : BinTree α) : BinTree (α × Nat × Nat) :=
  -- sorry
  (go t 1 1).1
where
  /-- lay out `t`, whose leftmost node is placed at column `x` and whose root is at row `y`.
  Also returns the next unused column. -/
  go (t : BinTree α) (x y : Nat) : BinTree (α × Nat × Nat) × Nat :=
    match t with
    | .empty => (.empty, x)
    | .node a l r =>
      let (l', x) := go l x (y + 1)
      let (r', x') := go r (x + 1) (y + 1)
      (.node (a, x, y) l' r', x')
  -- sorry

-- The following codes are for test and you should not edit these.

#guard [tree| 'a'].layout.toList = [('a', 1, 1)]

#guard [tree| 'a' * ('b' + ∅)].layout.toList = [('a', 2, 1), ('b', 1, 2)]

#guard [tree| 'a' * ('b' + 'c')].layout.toList = [('a', 2, 1), ('b', 1, 2), ('c', 3, 2)]

#guard [tree| 'a' * ('b' * (∅ + 'c') + 'd' * ('e' + ∅))].layout.toList =
  [('a', 3, 1), ('b', 1, 2), ('c', 2, 3), ('d', 5, 2), ('e', 4, 3)]

-- the example tree from H-99
#guard
  let tree := [tree| 'n' * ('k' * ('c' * ('a' + 'h' * ('g' * ('e' + ∅) + ∅)) + 'm') + 'u' * ('p' * (∅ + 's' * ('q' + ∅)) + ∅))]
  tree.layout.toList = [
    ('n', 8, 1), ('k', 6, 2), ('c', 2, 3), ('a', 1, 4), ('h', 5, 4), ('g', 4, 5),
    ('e', 3, 6), ('m', 7, 3), ('u', 12, 2), ('p', 9, 3), ('s', 11, 4), ('q', 10, 5)
  ]
