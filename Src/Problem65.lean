/- # Problem 65

(Intermediate 🌟🌟) Layout a binary tree (2).

This is an alternative to the layout method of Problem 64. Each node is again annotated with its position `(x, y)`,
where `y` is the depth of the node (the root has `y = 1`), but `x` is chosen by a different rule:

* on a given level, the horizontal distance between neighboring nodes is constant.
  More precisely, if the tree has height `H`, a node at level `k` and each of its children
  are `2 ^ (H - k - 1)` columns apart (the left child to the left, the right child to the right).
* the leftmost node of the whole tree has `x = 1`.

Write a function `BinTree.layout2` that annotates each node of a tree with its position.
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

/-- the height of a binary tree -/
def BinTree.height : BinTree α → Nat
  | .empty => 0
  | .node _ l r => 1 + max l.height r.height

/-- annotate each node with its position `(x, y)` -/
def BinTree.layout2 (t : BinTree α) : BinTree (α × Nat × Nat) :=
  -- sorry
  go t (1 + leftSpan t 1) 1
where
  /-- the horizontal distance between a node at level `k` and its children -/
  dist (k : Nat) : Nat := 2 ^ (t.height - k - 1)
  /-- how far the leftmost node of `s` (whose root is at level `k`) is to the left of its root -/
  leftSpan (s : BinTree α) (k : Nat) : Nat :=
    match s with
    | .node _ l@(.node ..) _ => dist k + leftSpan l (k + 1)
    | _ => 0
  /-- lay out `s`, whose root is at column `x` and level `k` -/
  go (s : BinTree α) (x k : Nat) : BinTree (α × Nat × Nat) :=
    match s with
    | .empty => .empty
    | .node a l r => .node (a, x, k) (go l (x - dist k) (k + 1)) (go r (x + dist k) (k + 1))
  -- sorry

-- The following codes are for test and you should not edit these.

#guard [tree| 'a'].layout2.toList = [('a', 1, 1)]

#guard [tree| 'a' * ('b' + 'c')].layout2.toList = [('a', 2, 1), ('b', 1, 2), ('c', 3, 2)]

#guard [tree| 'a' * (∅ + 'b' * ('c' + ∅))].layout2.toList = [('a', 1, 1), ('b', 3, 2), ('c', 2, 3)]

#guard [tree| 'a' * ('b' * (∅ + 'c') + 'd')].layout2.toList =
  [('a', 3, 1), ('b', 1, 2), ('c', 2, 3), ('d', 5, 2)]

-- the example tree from H-99
#guard
  let tree := [tree| 'n' * ('k' * ('c' * ('a' + 'e' * ('d' + 'g')) + 'm') + 'u' * ('p' * (∅ + 'q') + ∅))]
  tree.layout2.toList = [
    ('n', 15, 1), ('k', 7, 2), ('c', 3, 3), ('a', 1, 4), ('e', 5, 4), ('d', 4, 5),
    ('g', 6, 5), ('m', 11, 3), ('u', 23, 2), ('p', 19, 3), ('q', 21, 4)
  ]
