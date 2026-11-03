/- # Problem 60

(Intermediate 🌟🌟) Construct height-balanced binary trees with a given number of nodes.

Consider a height-balanced binary tree of height `H`. What is the maximum number of nodes it can contain?
Clearly, `MaxN = 2 ^ H - 1`. However, what is the minimum number `MinN`? This question is more difficult.
Try to find a recursive statement and turn it into a function `minNodes` that returns the minimum number of nodes in a height-balanced binary tree of height `H`.

On the other hand, we might ask: what is the maximum height `H` a height-balanced binary tree with `N` nodes can have?
Write a function `maxHeight` that computes this.

Now, we can attack the main problem: construct all the height-balanced binary trees with a given number of nodes.
Find out how many height-balanced trees exist for `N = 15`.
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

namespace ListMonad

/-- monad instance of `List` -/
scoped instance : Monad List where
  pure := List.singleton
  bind xs f := xs.flatMap f
  map := List.map

end ListMonad

open scoped ListMonad

/-- all height-balanced binary trees of the given height (see Problem 59) -/
partial def hbalTrees (a : α) (height : Nat) : List (BinTree α) :=
  match height with
  | 0 => [.empty]
  | 1 => [.leaf a]
  | h + 2 => do
    let (hl, hr) ← [(h, h + 1), (h + 1, h + 1), (h + 1, h)]
    let l ← hbalTrees a hl
    let r ← hbalTrees a hr
    return BinTree.node a l r

/-- the minimum number of nodes in a height-balanced binary tree of height `h` -/
def minNodes (h : Nat) : Nat :=
  -- sorry
  match h with
  | 0 => 0
  | 1 => 1
  | h + 2 => minNodes (h + 1) + minNodes h + 1
  -- sorry

/-- the maximum height of a height-balanced binary tree with `n` nodes -/
def maxHeight (n : Nat) : Nat :=
  -- sorry
  go 0 (n + 1)
where
  /-- the largest `h' ≥ h` such that `minNodes h' ≤ n`, searching at most `fuel` steps -/
  go (h fuel : Nat) : Nat :=
    match fuel with
    | 0 => h
    | fuel + 1 => if minNodes (h + 1) ≤ n then go (h + 1) fuel else h
  -- sorry

/-- all height-balanced binary trees with `n` nodes -/
def hbalTreeNodes (a : α) (n : Nat) : List (BinTree α) :=
  -- sorry
  List.range (maxHeight n + 1)
    |>.flatMap (hbalTrees a)
    |>.filter (·.nodes = n)
  -- sorry

-- The following codes are for test and you should not edit these.

#guard minNodes 1 = 1
#guard minNodes 2 = 2
#guard minNodes 3 = 4
#guard minNodes 4 = 7

#guard maxHeight 0 = 0
#guard maxHeight 1 = 1
#guard maxHeight 2 = 2
#guard maxHeight 3 = 2
#guard maxHeight 4 = 3
#guard maxHeight 7 = 4

#guard hbalTreeNodes 0 1 = [[tree| 0]]
#guard hbalTreeNodes 0 2 = [[tree| 0 * (∅ + 0)], [tree| 0 * (0 + ∅)]]
#guard (hbalTreeNodes 'x' 15).length = 1553
