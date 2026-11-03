/- # Problem 63

(Intermediate 🌟🌟) Construct a complete binary tree.

A complete binary tree with height `H` is defined as follows:
the levels `1, 2, 3, ..., H - 1` contain the maximum number of nodes (i.e. `2 ^ (i - 1)` at level `i`),
and in level `H`, which may contain less than the maximum possible number of nodes,
all the nodes are "left-adjusted". This means that in a level-order tree traversal
all internal nodes come first, the leaves come second, and empty successors
(the empty trees which are not really nodes!) come last.

Particularly, complete binary trees are used as data structures (or addressing schemes) for heaps.

We can assign an address number to each node in a complete binary tree by enumerating the nodes in level-order,
starting at the root with number 1. For every node `X` with address `A` the following property holds:
the addresses of `X`'s left and right successors are `2 * A` and `2 * A + 1`, respectively, if they exist.
This fact can be used to elegantly construct a complete binary tree structure.

Write a function `completeBinaryTree` that constructs a complete binary tree with `n` nodes,
and a function `BinTree.isComplete` that checks whether a given binary tree is complete.
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

/-- the number of nodes of a binary tree -/
def BinTree.nodes : BinTree α → Nat
  | .empty => 0
  | .node _ l r => 1 + l.nodes + r.nodes

/-- a complete binary tree with `n` nodes, all labeled with `x` -/
def completeBinaryTree (x : α) (n : Nat) : BinTree α :=
  -- sorry
  go 0
where
  /-- the subtree rooted at address `i + 1` -/
  go (i : Nat) : BinTree α :=
    if i ≥ n then .empty
    else .node x (go (2 * i + 1)) (go (2 * i + 2))
  termination_by n - i
  -- sorry

/-- whether the binary tree is complete -/
def BinTree.isComplete (t : BinTree α) : Bool :=
  -- sorry
  go t 1
where
  /-- every node, numbered starting from address `addr`, has an address `≤ t.nodes` -/
  go (s : BinTree α) (addr : Nat) : Bool :=
    match s with
    | .empty => true
    | .node _ l r => addr ≤ t.nodes && go l (2 * addr) && go r (2 * addr + 1)
  -- sorry

-- The following codes are for test and you should not edit these.

#guard completeBinaryTree 0 0 = .empty
#guard completeBinaryTree 0 1 = [tree| 0]
#guard completeBinaryTree 0 2 = [tree| 0 * (0 + ∅)]
#guard completeBinaryTree 0 3 = [tree| 0 * (0 + 0)]
#guard completeBinaryTree 0 4 = [tree| 0 * (0 * (0 + ∅) + 0)]
#guard completeBinaryTree 0 6 = [tree| 0 * (0 * (0 + 0) + 0 * (0 + ∅))]
#guard completeBinaryTree 0 7 = [tree| 0 * (0 * (0 + 0) + 0 * (0 + 0))]
#guard (completeBinaryTree 'x' 100).nodes = 100

#guard (BinTree.empty : BinTree Nat).isComplete
#guard [tree| 1].isComplete
#guard [tree| 1 * (2 + ∅)].isComplete
#guard ! [tree| 1 * (∅ + 2)].isComplete
#guard [tree| 1 * (2 * (4 + ∅) + 3)].isComplete
#guard ! [tree| 1 * (2 * (∅ + 5) + 3)].isComplete
#guard ! [tree| 1 * (2 + 3 * (6 + ∅))].isComplete
#guard [tree| 1 * (2 * (4 + 5) + 3 * (6 + 7))].isComplete
#guard (completeBinaryTree 'x' 100).isComplete
