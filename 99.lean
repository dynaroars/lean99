import Lean

/-
# Lean 99: Ninety-Nine Lean Problems

Lean is a theorem prover, but it is also a programming language. Moreover, it is the best functional language ever! Let's learn functional programming with Lean.

These are Lean translations of [Ninety-Nine Haskell Problems](https://wiki.haskell.org/H-99:_Ninety-Nine_Haskell_Problems), which are themselves translations of [Ninety-Nine Lisp Problems](https://www.ic.unicamp.br/~meidanis/courses/mc336/problemas-lisp/L-99_Ninety-Nine_Lisp_Problems.html).

## How to Play

* Every Lean code block in this book has a button to jump to the Lean web playground. Replace the `sorry` with your own code so that the test code passes.

* You can see an answer by clicking on the <i class="fa fa-eye"></i> button in the top right-hand corner of each page.

Good luck!
-/

namespace Problem01
/-
# Problem 1
(Easy) Find the last element of a list.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem01%0A%2F-%0A%23%20Problem%201%0A(Easy)%20Find%20the%20last%20element%20of%20a%20list.%0A-%2F%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%0A%0Adef%20myLast%20(l%20%3A%20List%20%CE%B1)%20%3A%20Option%20%CE%B1%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0Aexample%20%3A%20myLast%20%5B1%2C%202%2C%203%2C%204%5D%20%3D%20some%204%20%3A%3D%20by%20rfl%0A%0Aexample%20%3A%20myLast%20(%5B%5D%20%3A%20List%20%CE%B1)%20%3D%20none%20%3A%3D%20by%20rfl%0A%0Aexample%20%3A%20myLast%20%5B1%5D%20%3D%20some%201%20%3A%3D%20by%20rfl%0A%0Aexample%20%3A%20myLast%20%5B'x'%2C%20'y'%2C%20'z'%5D%20%3D%20some%20'z'%20%3A%3D%20by%20rfl%0A%0Aend%20Problem01%0A
-/
variable {α : Type}

def myLast (l : List α) : Option α :=
  -- sorry
  match l with
  | [] => none
  | [a] => some a
  | _ :: as => myLast as
  -- sorry

-- The following codes are for test and you should not edit these.

example : myLast [1, 2, 3, 4] = some 4 := by rfl

example : myLast ([] : List α) = none := by rfl

example : myLast [1] = some 1 := by rfl

example : myLast ['x', 'y', 'z'] = some 'z' := by rfl

end Problem01

namespace Problem02
/-
# Problem 2
(Easy) Find the last-but-one (or second-last) element of a list.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem02%0A%2F-%0A%23%20Problem%202%0A(Easy)%20Find%20the%20last-but-one%20(or%20second-last)%20element%20of%20a%20list.%0A-%2F%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%0A%0Adef%20myButLast%20(l%20%3A%20List%20%CE%B1)%20%3A%20Option%20%CE%B1%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0Aexample%20%3A%20myButLast%20%5B1%2C%202%2C%203%2C%204%5D%20%3D%20some%203%20%3A%3D%20rfl%0A%0Aexample%20%3A%20myButLast%20%5B'x'%2C%20'y'%2C%20'z'%5D%20%3D%20some%20'y'%20%3A%3D%20rfl%0A%0Aexample%20%3A%20myButLast%20(%5B%5D%20%3A%20List%20%CE%B1)%20%3D%20none%20%3A%3D%20rfl%0A%0Aexample%20%3A%20myButLast%20%5B1%5D%20%3D%20none%20%3A%3D%20rfl%0A%0Aend%20Problem02%0A
-/
variable {α : Type}

def myButLast (l : List α) : Option α :=
  -- sorry
  match l with
  | [] => none
  | [_] => none
  | [x,_] => some x
  | _ :: xs => myButLast xs
  -- sorry

-- The following codes are for test and you should not edit these.

example : myButLast [1, 2, 3, 4] = some 3 := rfl

example : myButLast ['x', 'y', 'z'] = some 'y' := rfl

example : myButLast ([] : List α) = none := rfl

example : myButLast [1] = none := rfl

end Problem02

namespace Problem03
/-
# Problem 3
(Easy) Find the K'th element of a list.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem03%0A%2F-%0A%23%20Problem%203%0A(Easy)%20Find%20the%20K'th%20element%20of%20a%20list.%0A-%2F%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%0A%0Adef%20elementAt%20(l%20%3A%20List%20%CE%B1)%20(k%20%3A%20Nat)%20%3A%20Option%20%CE%B1%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0Aexample%20%3A%20elementAt%20%5B'a'%2C%20'b'%2C%20'c'%2C%20'd'%2C%20'e'%5D%203%20%3D%20some%20'c'%20%3A%3D%20by%20rfl%0A%0Aexample%20%3A%20elementAt%20%5B'a'%2C%20'b'%2C%20'c'%2C%20'd'%2C%20'e'%5D%206%20%3D%20none%20%3A%3D%20by%20rfl%0A%0Aexample%20%3A%20elementAt%20%5B'a'%2C%20'b'%2C%20'c'%2C%20'd'%2C%20'e'%5D%200%20%3D%20none%20%3A%3D%20by%20rfl%0A%0Aexample%20%3A%20elementAt%20(%5B%5D%20%3A%20List%20%CE%B1)%200%20%3D%20none%20%3A%3D%20by%20rfl%0A%0Aexample%20%3A%20elementAt%20%5B1%2C%202%2C%203%5D%202%20%3D%20some%202%20%3A%3D%20by%20rfl%0A%0Aend%20Problem03%0A
-/
variable {α : Type}

def elementAt (l : List α) (k : Nat) : Option α :=
  -- sorry
  match l, k with
  | x :: _, 1 => some x
  | _ :: xs, n + 1 => elementAt xs n
  | _, _ => none
  -- sorry

-- The following codes are for test and you should not edit these.

example : elementAt ['a', 'b', 'c', 'd', 'e'] 3 = some 'c' := by rfl

example : elementAt ['a', 'b', 'c', 'd', 'e'] 6 = none := by rfl

example : elementAt ['a', 'b', 'c', 'd', 'e'] 0 = none := by rfl

example : elementAt ([] : List α) 0 = none := by rfl

example : elementAt [1, 2, 3] 2 = some 2 := by rfl

end Problem03

namespace Problem04
/-
# Problem 4
(Easy) Find the number of elements in a list.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem04%0A%2F-%0A%23%20Problem%204%0A(Easy)%20Find%20the%20number%20of%20elements%20in%20a%20list.%0A-%2F%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%0A%0Adef%20myLength%3A%20List%20%CE%B1%20-%3E%20Nat%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0Aexample%20%3A%20myLength%20%5B123%2C%20456%2C%20789%5D%20%3D%203%20%3A%3D%20by%20rfl%0A%0Aexample%20%3A%20myLength%20%5B'L'%2C%20'e'%2C%20'a'%2C%20'n'%2C%20'4'%5D%20%3D%205%20%3A%3D%20by%20rfl%0A%0Aexample%20%3A%20myLength%20%5BFalse%2C%20True%2C%20True%5D%20%3D%203%20%3A%3D%20by%20rfl%0A%0Aexample%20%3A%20myLength%20(%5B%5D%20%3A%20List%20%CE%B1)%20%3D%200%20%3A%3D%20by%20rfl%0A%0Aend%20Problem04%0A
-/
variable {α : Type}

def myLength: List α -> Nat
  -- sorry
  | [] => 0
  | _ :: a => myLength a + 1
  -- sorry

-- The following codes are for test and you should not edit these.

example : myLength [123, 456, 789] = 3 := by rfl

example : myLength ['L', 'e', 'a', 'n', '4'] = 5 := by rfl

example : myLength [False, True, True] = 3 := by rfl

example : myLength ([] : List α) = 0 := by rfl

end Problem04

namespace Problem05
/-
# Problem 5
(Easy) Reverse a list.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem05%0A%2F-%0A%23%20Problem%205%0A(Easy)%20Reverse%20a%20list.%0A-%2F%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%0A%0Adef%20myReverse%3A%20List%20%CE%B1%20-%3E%20List%20%CE%B1%0A%20%20%7C%20%5B%5D%20%3D%3E%20%5B%5D%0A%20%20%7C%20a%20%3A%3A%20as%20%3D%3E%20myReverse%20as%20%2B%2B%20%5Ba%5D%0A%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0Aexample%20%3A%20myReverse%20%5B1%2C%202%2C%203%2C%204%5D%20%3D%20%5B4%2C%203%2C%202%2C%201%5D%20%3A%3D%20rfl%0A%0Aexample%20%3A%20myReverse%20%5B%22man%22%2C%20%22plan%22%2C%20%22canal%22%2C%20%22panama%22%5D%0A%20%20%3D%20%5B%22panama%22%2C%20%22canal%22%2C%20%22plan%22%2C%20%22man%22%5D%20%3A%3D%20rfl%0A%0Aend%20Problem05%0A
-/
variable {α : Type}

def myReverse: List α -> List α
  | [] => []
  | a :: as => myReverse as ++ [a]


-- The following codes are for test and you should not edit these.

example : myReverse [1, 2, 3, 4] = [4, 3, 2, 1] := rfl

example : myReverse ["man", "plan", "canal", "panama"]
  = ["panama", "canal", "plan", "man"] := rfl

end Problem05

namespace Problem06
/-
# Problem 6
(Easy) Find out whether a list is a palindrome.

Hint: A palindrome can be read forward or backward; e.g. (x a m a x).

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem06%0A%2F-%0A%23%20Problem%206%0A(Easy)%20Find%20out%20whether%20a%20list%20is%20a%20palindrome.%0A%0AHint%3A%20A%20palindrome%20can%20be%20read%20forward%20or%20backward%3B%20e.g.%20(x%20a%20m%20a%20x).%0A-%2F%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%0A%0A--%20Assume%20that%20the%20terms%20in%20%60%CE%B1%60%20can%20be%20compared%0A--%20to%20determine%20whether%20they%20are%20identical.%0Avariable%20%5BBEq%20%CE%B1%5D%0A%0A--%20you%20can%20use%20%60List.reverse%60%0A%23check%20List.reverse%0A%0Adef%20isPalindrome%20(l%20%3A%20List%20%CE%B1)%20%3A%20Bool%20%3A%3D%0A%20%20l%20%3D%3D%20l.reverse%0A%0A%0A%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0Aexample%20%3A%20isPalindrome%20%5B1%2C%202%2C%203%5D%20%3D%20false%20%3A%3D%20rfl%0A%0Aexample%20%3A%20isPalindrome%20%5B1%2C%202%2C%204%2C%208%2C%2016%2C%208%2C%204%2C%202%2C%201%5D%20%3D%20true%20%3A%3D%20rfl%0A%0Aexample%20%3A%20isPalindrome%20%5B%22a%22%2C%20%22b%22%2C%20%22a%22%5D%20%3D%20true%20%3A%3D%20rfl%0A%0Aexample%20%3A%20isPalindrome%20(%5B%5D%20%3A%20List%20%CE%B1)%20%3D%20true%20%3A%3D%20rfl%0A%0Aexample%20%3A%20isPalindrome%20%5B'x'%5D%20%3D%20true%20%3A%3D%20rfl%0A%0Aend%20Problem06%0A
-/
variable {α : Type}

-- Assume that the terms in `α` can be compared
-- to determine whether they are identical.
variable [BEq α]

-- you can use `List.reverse`
#check List.reverse

def isPalindrome (l : List α) : Bool :=
  l == l.reverse




-- The following codes are for test and you should not edit these.

example : isPalindrome [1, 2, 3] = false := rfl

example : isPalindrome [1, 2, 4, 8, 16, 8, 4, 2, 1] = true := rfl

example : isPalindrome ["a", "b", "a"] = true := rfl

example : isPalindrome ([] : List α) = true := rfl

example : isPalindrome ['x'] = true := rfl

end Problem06

namespace Problem07
/-
# Problem 7
(Intermediate) Flatten a nested list structure.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem07%0A%2F-%0A%23%20Problem%207%0A(Intermediate)%20Flatten%20a%20nested%20list%20structure.%0A-%2F%0A%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%0A%0A--%20We%20have%20to%20define%20a%20new%20data%20type%2C%20because%20lists%20in%20Lean%20are%20homogeneous.%0Ainductive%20NestedList%20(%CE%B1%20%3A%20Type)%20where%0A%20%20%7C%20elem%20%3A%20%CE%B1%20%E2%86%92%20NestedList%20%CE%B1%0A%20%20%7C%20list%20%3A%20List%20(NestedList%20%CE%B1)%20%E2%86%92%20NestedList%20%CE%B1%0A%0A%2F--%20convert%20NestedList%20to%20String.%20-%2F%0Apartial%20def%20NestedList.toString%20%5BToString%20%CE%B1%5D%20%3A%20NestedList%20%CE%B1%20%E2%86%92%20String%0A%20%20%7C%20NestedList.elem%20x%20%3D%3E%20ToString.toString%20x%0A%20%20%7C%20NestedList.list%20xs%20%3D%3E%20%22%5B%22%20%2B%2B%20String.intercalate%20%22%2C%20%22%20(xs.map%20toString)%20%2B%2B%20%22%5D%22%0A%0A%2F--%20Display%20%60NestedList%60%20in%20a%20readable%20manner%20when%20you%20run%20%60%23eval%60.%20-%2F%0Ainstance%20%5BToString%20%CE%B1%5D%20%3A%20ToString%20(NestedList%20(%CE%B1%20%3A%20Type))%20where%0A%20%20toString%20nl%20%3A%3D%20NestedList.toString%20nl%0A%0A%2F--%20flatten%20the%20list%20structure%20-%2F%0Adef%20flatten%20(nl%20%3A%20NestedList%20%CE%B1)%20%3A%20List%20%CE%B1%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0Aopen%20NestedList%0A%0Adef%20sample%20%3A%20NestedList%20Nat%20%3A%3D%0A%20%20list%20%5Belem%201%2C%20list%20%5Belem%202%2C%20elem%203%5D%2C%20elem%204%5D%0A%0A%23eval%20sample%0A%0Adef%20empty%20%3A%20NestedList%20String%20%3A%3D%20list%20%5B%5D%0A%0A%23eval%20empty%0A%0Aexample%20%3A%20flatten%20(.elem%205)%20%3D%20%5B5%5D%20%3A%3D%20by%0A%20%20simp%20%5Bflatten%5D%0A%0Aexample%20%3A%20flatten%20sample%20%3D%20%5B1%2C%202%2C%203%2C%204%5D%20%3A%3D%20by%0A%20%20simp%20%5Bflatten%2C%20sample%5D%0A%0Aexample%20%3A%20flatten%20(empty)%20%3D%20%5B%5D%20%3A%3D%20by%0A%20%20simp%20%5Bflatten%2C%20empty%5D%0A%0Aend%20Problem07%0A
-/

variable {α : Type}

-- We have to define a new data type, because lists in Lean are homogeneous.
inductive NestedList (α : Type) where
  | elem : α → NestedList α
  | list : List (NestedList α) → NestedList α

/-- convert NestedList to String. -/
partial def NestedList.toString [ToString α] : NestedList α → String
  | NestedList.elem x => ToString.toString x
  | NestedList.list xs => "[" ++ String.intercalate ", " (xs.map toString) ++ "]"

/-- Display `NestedList` in a readable manner when you run `#eval`. -/
instance [ToString α] : ToString (NestedList (α : Type)) where
  toString nl := NestedList.toString nl

/-- flatten the list structure -/
def flatten (nl : NestedList α) : List α :=
  -- sorry
  match nl with
  | .elem x => [x]
  | .list [] => []
  | .list (x :: xs) => flatten x ++ flatten (.list xs)
  -- sorry

-- The following codes are for test and you should not edit these.

open NestedList

def sample : NestedList Nat :=
  list [elem 1, list [elem 2, elem 3], elem 4]

#eval sample

def empty : NestedList String := list []

#eval empty

example : flatten (.elem 5) = [5] := by
  simp [flatten]

example : flatten sample = [1, 2, 3, 4] := by
  simp [flatten, sample]

example : flatten (empty) = [] := by
  simp [flatten, empty]

end Problem07

namespace Problem08
/-
# Problem 8
(Intermediate) Eliminate consecutive duplicates of list elements.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem08%0A%2F-%0A%23%20Problem%208%0A(Intermediate)%20Eliminate%20consecutive%20duplicates%20of%20list%20elements.%0A-%2F%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%20%5BBEq%20%CE%B1%5D%0A%0Adef%20comp%3A%20%CE%B1%20-%3E%20List%20%CE%B1%20-%3E%20List%20%CE%B1%0A%20%20%7C%20_%2C%20%5B%5D%20%3D%3E%20%5B%5D%0A%20%20%7C%20x%2C%20a%20%3A%3A%20as%20%3D%3E%0A%20%20%20%20if%20x%20%3D%3D%20a%20then%0A%20%20%20%20%20%20comp%20a%20as%0A%20%20%20%20else%0A%20%20%20%20%20%20a%20%3A%3A%20comp%20a%20as%0A%0Adef%20compress%3A%20%20List%20%CE%B1%20-%3E%20List%20%CE%B1%0A%20%20%7C%20%5B%5D%20%3D%3E%20%5B%5D%0A%20%20%7C%20a%20%3A%3A%20xs%20%3D%3E%20a%20%3A%3A%20comp%20a%20xs%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0Aexample%20%3A%20compress%20%5B1%2C%201%2C%202%2C%202%2C%201%2C%202%2C%202%5D%20%3D%20%5B1%2C%202%2C%201%2C%202%5D%20%3A%3D%20by%20rfl%0A%0Aexample%20%3A%20compress%20(%5B%5D%20%3A%20List%20%CE%B1)%20%3D%20%5B%5D%20%3A%3D%20by%20rfl%0A%0Aexample%20%3A%20compress%20%5B'C'%2C%20'o'%2C%20'o'%2C%20'o'%2C%20'p'%2C%20'y'%2C%20'y'%5D%20%3D%20%5B'C'%2C%20'o'%2C%20'p'%2C%20'y'%5D%20%3A%3D%20by%20rfl%0A%0Aend%20Problem08%0A
-/
variable {α : Type} [BEq α]

def comp: α -> List α -> List α
  | _, [] => []
  | x, a :: as =>
    if x == a then
      comp a as
    else
      a :: comp a as

def compress:  List α -> List α
  | [] => []
  | a :: xs => a :: comp a xs

-- The following codes are for test and you should not edit these.

example : compress [1, 1, 2, 2, 1, 2, 2] = [1, 2, 1, 2] := by rfl

example : compress ([] : List α) = [] := by rfl

example : compress ['C', 'o', 'o', 'o', 'p', 'y', 'y'] = ['C', 'o', 'p', 'y'] := by rfl

end Problem08

namespace Problem09
/-
# Problem 9
(Intermediate) Pack consecutive duplicates of list elements into sublists.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem09%0A%2F-%0A%23%20Problem%209%0A(Intermediate)%20Pack%20consecutive%20duplicates%20of%20list%20elements%20into%20sublists.%0A-%2F%0Anamespace%20P9%20--%23%0A%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%20%5BBEq%20%CE%B1%5D%0A%0Apartial%20def%20pack%20(l%20%3A%20List%20%CE%B1)%20%3A%20List%20(List%20%CE%B1)%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0Adef%20_root_.List.unpack%20(l%20%3A%20List%20(List%20%CE%B1))%20%3A%20List%20%CE%B1%20%3A%3D%0A%20%20match%20l%20with%0A%20%20%7C%20%5B%5D%20%3D%3E%20%5B%5D%0A%20%20%7C%20x%20%3A%3A%20xs%20%3D%3E%20x%20%2B%2B%20unpack%20xs%0A%0Adef%20runTest%20%5BToString%20%CE%B1%5D%20(l%20%3A%20List%20%CE%B1)%20%3A%20IO%20Unit%20%3A%3D%20do%0A%20%20let%20result%20%3A%3D%20pack%20l%0A%20%20let%20check%20%3A%3D%20result.unpack%20%3D%3D%20l%0A%20%20if%20check%20then%0A%20%20%20%20IO.println%20%22ok!%22%0A%20%20else%0A%20%20%20%20throw%20%3C%7C%20.userError%20s!%22failed%3A%20pack%20%7Bl%7D%20%3D%20%7Bresult%7D%22%0A%0A%23eval%20runTest%20(%5B%5D%20%3A%20List%20Nat)%0A%0A%23eval%20runTest%20%5B1%5D%0A%0A%23eval%20runTest%20%5B0%2C%200%2C%201%2C%200%5D%0A%0A%23eval%20runTest%20%5B'a'%2C%20'a'%2C%20'a'%2C%20'a'%2C%20'b'%2C%20'c'%2C%20'c'%2C%20'a'%2C%20'a'%2C%20'd'%2C%20'e'%2C%20'e'%2C%20'e'%2C%20'e'%5D%0A%0Aend%20P9%20--%23%0A%0Aend%20Problem09%0A
-/
namespace P9 --#

variable {α : Type} [BEq α]

partial def pack (l : List α) : List (List α) :=
  -- sorry
  match l with
  | [] => []
  | x :: _ =>
    let (packed, rest) := l.span (· == x)
    packed :: pack rest
  -- sorry

-- The following codes are for test and you should not edit these.

def _root_.List.unpack (l : List (List α)) : List α :=
  match l with
  | [] => []
  | x :: xs => x ++ unpack xs

def runTest [ToString α] (l : List α) : IO Unit := do
  let result := pack l
  let check := result.unpack == l
  if check then
    IO.println "ok!"
  else
    throw <| .userError s!"failed: pack {l} = {result}"

#eval runTest ([] : List Nat)

#eval runTest [1]

#eval runTest [0, 0, 1, 0]

#eval runTest ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e']

end P9 --#

end Problem09

namespace Problem10
/-
# Problem 10
(Easy) Use the result of Problem 9 to implement the so-called run-length encoding data compression method. Consecutive duplicates of elements are encoded as lists `(N, E)` where `N` is the number of duplicates of the element `E`.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem10%0A%2F-%0A%23%20Problem%2010%0A(Easy)%20Use%20the%20result%20of%20Problem%209%20to%20implement%20the%20so-called%20run-length%20encoding%20data%20compression%20method.%20Consecutive%20duplicates%20of%20elements%20are%20encoded%20as%20lists%20%60(N%2C%20E)%60%20where%20%60N%60%20is%20the%20number%20of%20duplicates%20of%20the%20element%20%60E%60.%0A-%2F%0Anamespace%20P10%20--%23%0A%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%20%5BBEq%20%CE%B1%5D%20%5BInhabited%20%CE%B1%5D%0A%0Adef%20pack%20(l%20%3A%20List%20%CE%B1)%20%3A%20List%20(List%20%CE%B1)%20%3A%3D%0A%20%20sorry%0A%0Adef%20encode%20(l%20%3A%20List%20%CE%B1)%20%3A%20List%20(Nat%20%C3%97%20%CE%B1)%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0Aexample%20%3A%20encode%20%5B1%2C%201%2C%202%2C%202%2C%202%2C%203%2C%204%2C%204%2C%204%2C%204%5D%20%3D%20%5B(2%2C%201)%2C%20(3%2C%202)%2C%20(1%2C%203)%2C%20(4%2C%204)%5D%20%3A%3D%20rfl%0A%0Aexample%20%3A%20encode%20%5B'a'%2C%20'a'%2C%20'b'%2C%20'c'%2C%20'c'%5D%20%3D%20%5B(2%2C%20'a')%2C%20(1%2C%20'b')%2C%20(2%2C%20'c')%5D%20%3A%3D%20rfl%0A%0Aexample%20%3A%20encode%20%5B1%2C%201%5D%20%3D%20%5B(2%2C%201)%5D%20%3A%3D%20rfl%0A%0Aexample%20%3A%20encode%20(%5B%5D%20%3A%20List%20%CE%B1)%20%3D%20%5B%5D%20%3A%3D%20rfl%0A%0Aend%20P10%20--%23%0A%0Aend%20Problem10%0A
-/
namespace P10 --#

variable {α : Type} [BEq α] [Inhabited α]

def pack (l : List α) : List (List α) :=
  -- sorry
  match l with
  | [] => []
  | [a] => [[a]]
  | a :: b :: t =>
    let p := pack (b :: t)
    if a != b then
      [a] :: p
    else
      ([a] ++ p.head!) :: p.tail!
  -- sorry

def encode (l : List α) : List (Nat × α) :=
  -- sorry
  pack l |>.map fun x => (x.length, x.head!)
  -- sorry

-- The following codes are for test and you should not edit these.

example : encode [1, 1, 2, 2, 2, 3, 4, 4, 4, 4] = [(2, 1), (3, 2), (1, 3), (4, 4)] := rfl

example : encode ['a', 'a', 'b', 'c', 'c'] = [(2, 'a'), (1, 'b'), (2, 'c')] := rfl

example : encode [1, 1] = [(2, 1)] := rfl

example : encode ([] : List α) = [] := rfl

end P10 --#

end Problem10

namespace Problem11
/-
# Problem 11
(Easy) Modify the result of [Problem 10](./Problem10.md) in such a way that if an element has no duplicates it is simply copied into the result list. Only elements with duplicates are transferred as `(N E)` lists.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem11%0A%2F-%0A%23%20Problem%2011%0A(Easy)%20Modify%20the%20result%20of%20%5BProblem%2010%5D(.%2FProblem10.md)%20in%20such%20a%20way%20that%20if%20an%20element%20has%20no%20duplicates%20it%20is%20simply%20copied%20into%20the%20result%20list.%20Only%20elements%20with%20duplicates%20are%20transferred%20as%20%60(N%20E)%60%20lists.%0A-%2F%0Anamespace%20P11%20--%23%0A%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%20%5BBEq%20%CE%B1%5D%0A%0Ainductive%20Data%20(%CE%B1%20%3A%20Type)%20where%0A%20%20%7C%20multiple%20%3A%20Nat%20%E2%86%92%20%CE%B1%20%E2%86%92%20Data%20%CE%B1%0A%20%20%7C%20single%20%3A%20%CE%B1%20%E2%86%92%20Data%20%CE%B1%0Aderiving%20Repr%2C%20DecidableEq%0A%0Aopen%20Data%0A%0Apartial%20def%20encodeModified%20(l%20%3A%20List%20%CE%B1)%20%3A%20List%20(Data%20%CE%B1)%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0Aexample%20%3A%20encodeModified%20%5B'a'%2C%20'a'%2C%20'b'%2C%20'c'%5D%20%3D%0A%20%20%5Bmultiple%202%20'a'%2C%20single%20'b'%2C%20single%20'c'%5D%20%3A%3D%20by%20native_decide%0A%0Aexample%20%3A%20encodeModified%20(%5B%5D%20%3A%20List%20Nat)%20%3D%20%5B%5D%20%3A%3D%20by%20native_decide%0A%0Aexample%20%3A%20encodeModified%20%5B'a'%2C%20'b'%2C%20'b'%2C%20'b'%2C%20'c'%2C%20'b'%2C%20'b'%5D%20%3D%0A%20%20%5Bsingle%20'a'%2C%20multiple%203%20'b'%2C%20single%20'c'%2C%20multiple%202%20'b'%5D%20%3A%3D%20by%20native_decide%0A%0Aend%20P11%20--%23%0A%0Aend%20Problem11%0A
-/
namespace P11 --#

variable {α : Type} [BEq α]

inductive Data (α : Type) where
  | multiple : Nat → α → Data α
  | single : α → Data α
deriving Repr, DecidableEq

open Data

partial def encodeModified (l : List α) : List (Data α) :=
  -- sorry
  match l with
  | [] => []
  | x :: _xs =>
    let (as, bs) := l.span (· == x)
    if as.length > 1 then
      multiple as.length x :: encodeModified bs
    else
      single x :: encodeModified bs
  -- sorry

-- The following codes are for test and you should not edit these.

example : encodeModified ['a', 'a', 'b', 'c'] =
  [multiple 2 'a', single 'b', single 'c'] := by native_decide

example : encodeModified ([] : List Nat) = [] := by native_decide

example : encodeModified ['a', 'b', 'b', 'b', 'c', 'b', 'b'] =
  [single 'a', multiple 3 'b', single 'c', multiple 2 'b'] := by native_decide

end P11 --#

end Problem11

namespace Problem12
/-
# Problem 12
(Intermediate) Given a run-length code list generated as specified in problem 11. Construct its uncompressed version.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem12%0A%2F-%0A%23%20Problem%2012%0A(Intermediate)%20Given%20a%20run-length%20code%20list%20generated%20as%20specified%20in%20problem%2011.%20Construct%20its%20uncompressed%20version.%0A-%2F%0Anamespace%20P12%20--%23%0A%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%20%5BBEq%20%CE%B1%5D%0A%0Ainductive%20Data%20(%CE%B1%20%3A%20Type)%20where%0A%20%20%7C%20multiple%20%3A%20Nat%20%E2%86%92%20%CE%B1%20%E2%86%92%20Data%20%CE%B1%0A%20%20%7C%20single%20%3A%20%CE%B1%20%E2%86%92%20Data%20%CE%B1%0Aderiving%20Repr%0A%0Aopen%20Data%0A%0Adef%20decodeModified%20(l%20%3A%20List%20(Data%20%CE%B1))%20%3A%20List%20%CE%B1%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0Aexample%20%3A%20decodeModified%20%5Bmultiple%202%20'a'%2C%20single%20'b'%2C%20multiple%202%20'c'%5D%20%3D%20%5B'a'%2C%20'a'%2C%20'b'%2C%20'c'%2C%20'c'%5D%20%3A%3D%20rfl%0A%0Aexample%20%3A%20decodeModified%20%5Bsingle%20'a'%2C%20single%20'b'%2C%20single%20'c'%5D%20%3D%20%5B'a'%2C%20'b'%2C%20'c'%5D%20%3A%3D%20rfl%0A%0Aexample%20%3A%20decodeModified%20%5Bmultiple%203%20'2'%2C%20multiple%202%20'1'%2C%20single%20'9'%5D%20%3D%20%5B'2'%2C%20'2'%2C%20'2'%2C%20'1'%2C%20'1'%2C%20'9'%5D%20%3A%3D%20rfl%0A%0Aend%20P12%20--%23%0A%0Aend%20Problem12%0A
-/
namespace P12 --#

variable {α : Type} [BEq α]

inductive Data (α : Type) where
  | multiple : Nat → α → Data α
  | single : α → Data α
deriving Repr

open Data

def decodeModified (l : List (Data α)) : List α :=
  -- sorry
  match l with
  | [] => []
  | (multiple n a) :: t => (List.replicate n a) ++ decodeModified t
  | (single a) :: t => a :: decodeModified t
  -- sorry

-- The following codes are for test and you should not edit these.

example : decodeModified [multiple 2 'a', single 'b', multiple 2 'c'] = ['a', 'a', 'b', 'c', 'c'] := rfl

example : decodeModified [single 'a', single 'b', single 'c'] = ['a', 'b', 'c'] := rfl

example : decodeModified [multiple 3 '2', multiple 2 '1', single '9'] = ['2', '2', '2', '1', '1', '9'] := rfl

end P12 --#

end Problem12

namespace Problem13
/-
# Problem 13
(Intermediate) Implement the so-called run-length encoding data compression method directly. I.e. don't explicitly create the sublists containing the duplicates, as in [Problem 9](./Problem9.md), but only count them. As in [Problem 11](./Problem11.md), simplify the result list by replacing the singleton lists `(1 X)` by `X`.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem13%0A%2F-%0A%23%20Problem%2013%0A(Intermediate)%20Implement%20the%20so-called%20run-length%20encoding%20data%20compression%20method%20directly.%20I.e.%20don't%20explicitly%20create%20the%20sublists%20containing%20the%20duplicates%2C%20as%20in%20%5BProblem%209%5D(.%2FProblem9.md)%2C%20but%20only%20count%20them.%20As%20in%20%5BProblem%2011%5D(.%2FProblem11.md)%2C%20simplify%20the%20result%20list%20by%20replacing%20the%20singleton%20lists%20%60(1%20X)%60%20by%20%60X%60.%0A-%2F%0Anamespace%20P13%20--%23%0A%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%20%5BBEq%20%CE%B1%5D%20%5BInhabited%20%CE%B1%5D%0A%0Ainductive%20Data%20(%CE%B1%20%3A%20Type)%20where%0A%20%20%7C%20multiple%20%3A%20Nat%20%E2%86%92%20%CE%B1%20%E2%86%92%20Data%20%CE%B1%0A%20%20%7C%20single%20%3A%20%CE%B1%20%E2%86%92%20Data%20%CE%B1%0Aderiving%20Repr%0A%0Aopen%20Data%0A%0Adef%20encodeDirect%20(l%20%3A%20List%20%CE%B1)%20%3A%20List%20(Data%20%CE%B1)%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0Aexample%20%3A%20encodeDirect%20%5B'a'%2C%20'a'%2C%20'b'%2C%20'c'%5D%20%3D%0A%20%20%5Bmultiple%202%20'a'%2C%20single%20'b'%2C%20single%20'c'%5D%20%3A%3D%20by%20rfl%0A%0Aexample%20%3A%20encodeDirect%20(%5B%5D%20%3A%20List%20%CE%B1)%20%3D%20%5B%5D%20%3A%3D%20by%20rfl%0A%0Aexample%20%3A%20encodeDirect%20%5B'a'%2C%20'b'%2C%20'b'%2C%20'b'%2C%20'c'%2C%20'b'%2C%20'b'%5D%20%3D%0A%20%20%5Bsingle%20'a'%2C%20multiple%203%20'b'%2C%20single%20'c'%2C%20multiple%202%20'b'%5D%20%3A%3D%20by%20rfl%0A%0Aend%20P13%20--%23%0A%0Aend%20Problem13%0A
-/
namespace P13 --#

variable {α : Type} [BEq α] [Inhabited α]

inductive Data (α : Type) where
  | multiple : Nat → α → Data α
  | single : α → Data α
deriving Repr

open Data

def encodeDirect (l : List α) : List (Data α) :=
  -- sorry
  counting l |>.map fun (n, a) =>
    if n == 1 then
      single a
    else
      multiple n a
where
  counting : List α → List (Nat × α)
    | [] => []
    | [a] => [(1, a)]
    | a :: b :: t =>
      if a != b then
        (1, a) :: counting (b :: t)
      else
        let (n, a) := counting (b :: t) |>.head!
        (n + 1, a) :: (counting (b :: t) |>.tail!)
  -- sorry

-- The following codes are for test and you should not edit these.

example : encodeDirect ['a', 'a', 'b', 'c'] =
  [multiple 2 'a', single 'b', single 'c'] := by rfl

example : encodeDirect ([] : List α) = [] := by rfl

example : encodeDirect ['a', 'b', 'b', 'b', 'c', 'b', 'b'] =
  [single 'a', multiple 3 'b', single 'c', multiple 2 'b'] := by rfl

end P13 --#

end Problem13

namespace Problem14
/-
# Problem 14
(Easy) Duplicate the elements of a list.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem14%0A%2F-%0A%23%20Problem%2014%0A(Easy)%20Duplicate%20the%20elements%20of%20a%20list.%0A-%2F%0A%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%0A%0Adef%20dupli%3A%20List%20%CE%B1%20-%3E%20List%20%CE%B1%0A%20%20%7C%20%5B%5D%20%3D%3E%20%5B%5D%0A%20%20%7C%20a%20%3A%3A%20as%20%3D%3E%20a%20%3A%3A%20(a%20%3A%3A%20dupli%20as)%0A%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0Aexample%20%3A%20dupli%20%5B1%2C%202%2C%203%5D%20%3D%20%5B1%2C%201%2C%202%2C%202%2C%203%2C%203%5D%20%3A%3D%20by%20rfl%0A%0Aexample%20%3A%20dupli%20(%5B%5D%20%3A%20List%20%CE%B1)%20%3D%20%5B%5D%20%3A%3D%20by%20rfl%0A%0Aexample%20%3A%20dupli%20%5B'a'%2C%20'b'%2C%20'c'%2C%20'c'%2C%20'd'%5D%0A%20%20%3D%20%5B'a'%2C%20'a'%2C%20'b'%2C%20'b'%2C%20'c'%2C%20'c'%2C%20'c'%2C%20'c'%2C%20'd'%2C%20'd'%5D%20%3A%3D%20by%20rfl%0A%0Aend%20Problem14%0A
-/

variable {α : Type}

def dupli: List α -> List α
  | [] => []
  | a :: as => a :: (a :: dupli as)


-- The following codes are for test and you should not edit these.

example : dupli [1, 2, 3] = [1, 1, 2, 2, 3, 3] := by rfl

example : dupli ([] : List α) = [] := by rfl

example : dupli ['a', 'b', 'c', 'c', 'd']
  = ['a', 'a', 'b', 'b', 'c', 'c', 'c', 'c', 'd', 'd'] := by rfl

end Problem14

namespace Problem15
/-
# Problem 15
(Intermediate) Replicate the elements of a list a given number of times.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem15%0A%2F-%0A%23%20Problem%2015%0A(Intermediate)%20Replicate%20the%20elements%20of%20a%20list%20a%20given%20number%20of%20times.%0A-%2F%0A%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%0A%0Adef%20solerep%3A%20%CE%B1%20-%3E%20(n%20%3A%20Nat)%20-%3E%20List%20%CE%B1%0A%20%20%7C%20_%2C%200%20%3D%3E%20%5B%5D%0A%20%20%7C%20x%2C%20m%20%2B%201%20%3D%3E%20x%20%3A%3A%20solerep%20x%20m%0A%0Adef%20repli%20(l%20%3A%20List%20%CE%B1)%20(n%20%3A%20Nat)%20%3A%20List%20%CE%B1%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0Aexample%20%3A%20repli%20%5B1%2C%202%2C%203%5D%203%20%3D%20%5B1%2C%201%2C%201%2C%202%2C%202%2C%202%2C%203%2C%203%2C%203%5D%20%3A%3D%20by%20rfl%0A%0Aexample%20%3A%20repli%20%5B1%2C%202%2C%203%5D%202%20%3D%20%5B1%2C%201%2C%202%2C%202%2C%203%2C%203%5D%20%3A%3D%20by%20rfl%0A%0Aexample%20%3A%20repli%20%5B1%2C%202%2C%203%5D%201%20%3D%20%5B1%2C%202%2C%203%5D%20%3A%3D%20by%20rfl%0A%0Aexample%20%3A%20repli%20%5B1%2C%202%2C%203%5D%200%20%3D%20%5B%5D%20%3A%3D%20by%20rfl%0A%0Aexample%20%3A%20repli%20(%5B%5D%20%3A%20List%20%CE%B1)%20255%20%3D%20%5B%5D%20%3A%3D%20by%20rfl%0A%0Aend%20Problem15%0A
-/

variable {α : Type}

def solerep: α -> (n : Nat) -> List α
  | _, 0 => []
  | x, m + 1 => x :: solerep x m

def repli (l : List α) (n : Nat) : List α :=
  -- sorry
  match l with
  | [] => []
  | a :: b => (solerep a n) ++ repli b n
  -- sorry

-- The following codes are for test and you should not edit these.

example : repli [1, 2, 3] 3 = [1, 1, 1, 2, 2, 2, 3, 3, 3] := by rfl

example : repli [1, 2, 3] 2 = [1, 1, 2, 2, 3, 3] := by rfl

example : repli [1, 2, 3] 1 = [1, 2, 3] := by rfl

example : repli [1, 2, 3] 0 = [] := by rfl

example : repli ([] : List α) 255 = [] := by rfl

end Problem15

namespace Problem16
/-
# Problem 16
(Intermediate) Drop every N'th element from a list.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem16%0A%2F-%0A%23%20Problem%2016%0A(Intermediate)%20Drop%20every%20N'th%20element%20from%20a%20list.%0A-%2F%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%0A%0Adef%20dropEvery%20(l%20%3A%20List%20%CE%B1)%20(n%20%3A%20Nat)%20%3A%20List%20%CE%B1%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0Aexample%20%3A%20dropEvery%20%5B1%2C%202%2C%203%5D%200%20%3D%20%5B1%2C%202%2C%203%5D%20%3A%3D%20by%20rfl%0A%0Aexample%20%3A%20dropEvery%20%5B'a'%2C%20'b'%2C%20'c'%2C%20'd'%5D%202%20%3D%20%5B'a'%2C%20'c'%5D%20%3A%3D%20by%20rfl%0A%0Aexample%20%3A%20dropEvery%20%5B'a'%2C%20'b'%2C%20'3'%2C%20'c'%2C%20'd'%2C%20'6'%2C%20'e'%5D%203%0A%20%20%3D%20%5B'a'%2C%20'b'%2C%20'c'%2C%20'd'%2C%20'e'%5D%20%3A%3D%20by%20rfl%0A%0Aend%20Problem16%0A
-/
variable {α : Type}

def dropEvery (l : List α) (n : Nat) : List α :=
  -- sorry
  helper l n 1
where
  helper : List α → Nat → Nat → List α
  | [], _, _ => []
  | x :: xs, n, m =>
    if m % n = 0 then
      helper xs n (m + 1)
    else
      x :: helper xs n (m + 1)
  -- sorry

-- The following codes are for test and you should not edit these.

example : dropEvery [1, 2, 3] 0 = [1, 2, 3] := by rfl

example : dropEvery ['a', 'b', 'c', 'd'] 2 = ['a', 'c'] := by rfl

example : dropEvery ['a', 'b', '3', 'c', 'd', '6', 'e'] 3
  = ['a', 'b', 'c', 'd', 'e'] := by rfl

end Problem16

namespace Problem17
/-
# Problem 17
(Easy) Split a list into two parts; the length of the first part is given.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem17%0A%2F-%0A%23%20Problem%2017%0A(Easy)%20Split%20a%20list%20into%20two%20parts%3B%20the%20length%20of%20the%20first%20part%20is%20given.%0A-%2F%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%0A%0A--%20Don't%20use%20these%20functions%0A%23check%20List.take%0A%23check%20List.drop%0A%0Adef%20split%20(l%20%3A%20List%20%CE%B1)%20(n%20%3A%20Nat)%20%3A%20List%20%CE%B1%20%C3%97%20List%20%CE%B1%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0Aexample%20%3A%20split%20%5B1%2C%202%2C%203%2C%204%2C%205%5D%202%20%3D%20(%5B1%2C%202%5D%2C%20%5B3%2C%204%2C%205%5D)%20%3A%3D%20rfl%0A%0Aexample%20%3A%20split%20%5B%22a%22%5D%203%20%3D%20(%5B%22a%22%5D%2C%20%5B%5D)%20%3A%3D%20rfl%0A%0Aexample%20%3A%20split%20(%5B%5D%20%3A%20List%20%CE%B1)%201%20%3D%20(%5B%5D%2C%20%5B%5D)%20%3A%3D%20rfl%0A%0Aexample%20%3A%20split%20%5B%22a%22%2C%20%22b%22%2C%20%22c%22%2C%20%22d%22%2C%20%22e%22%2C%20%22f%22%5D%203%0A%20%20%3D%20(%5B%22a%22%2C%20%22b%22%2C%20%22c%22%5D%2C%20%5B%22d%22%2C%20%22e%22%2C%20%22f%22%5D)%20%3A%3D%20rfl%0A%0Aend%20Problem17%0A
-/
variable {α : Type}

-- Don't use these functions
#check List.take
#check List.drop

def split (l : List α) (n : Nat) : List α × List α :=
  -- sorry
  match l, n with
  | [], _ => ([], [])
  | _, 0 => ([], l)
  | h :: t, n =>
    let (a, b) := split t (n - 1)
    (h :: a, b)
  -- sorry

-- The following codes are for test and you should not edit these.

example : split [1, 2, 3, 4, 5] 2 = ([1, 2], [3, 4, 5]) := rfl

example : split ["a"] 3 = (["a"], []) := rfl

example : split ([] : List α) 1 = ([], []) := rfl

example : split ["a", "b", "c", "d", "e", "f"] 3
  = (["a", "b", "c"], ["d", "e", "f"]) := rfl

end Problem17

namespace Problem18
/-
# Problem 18
(Intermediate) Given two indices, `i` and `k`, the slice is the list containing the elements between the i'th and k'th element of the original list (both limits included). Start counting the elements with 1.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem18%0A%2F-%0A%23%20Problem%2018%0A(Intermediate)%20Given%20two%20indices%2C%20%60i%60%20and%20%60k%60%2C%20the%20slice%20is%20the%20list%20containing%20the%20elements%20between%20the%20i'th%20and%20k'th%20element%20of%20the%20original%20list%20(both%20limits%20included).%20Start%20counting%20the%20elements%20with%201.%0A-%2F%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%0A%0Adef%20slice%20(l%20%3A%20List%20%CE%B1)%20(i%20k%20%3A%20Nat)%20%3A%20List%20%CE%B1%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0Aexample%20%3A%20slice%20%5B1%2C%202%2C%203%2C%204%2C%205%2C%206%2C%207%2C%208%2C%209%5D%203%207%20%3D%20%5B3%2C%204%2C%205%2C%206%2C%207%5D%20%3A%3D%20by%20rfl%0A%0Aexample%20%3A%20slice%20%5B1%2C%202%2C%203%2C%204%2C%205%5D%201%201%20%3D%20%5B1%5D%20%3A%3D%20by%20rfl%0A%0Aexample%20%3A%20slice%20%5B1%2C%202%2C%203%2C%204%2C%205%5D%202%203%20%3D%20%5B2%2C%203%5D%20%3A%3D%20by%20rfl%0A%0Aend%20Problem18%0A
-/
variable {α : Type}

def slice (l : List α) (i k : Nat) : List α :=
  -- sorry
  if i <= k then
    l.drop (i - 1) |>.take (k - i + 1)
  else
    l.drop (k - 1) |>.take (i - k + 1)
  -- sorry

-- The following codes are for test and you should not edit these.

example : slice [1, 2, 3, 4, 5, 6, 7, 8, 9] 3 7 = [3, 4, 5, 6, 7] := by rfl

example : slice [1, 2, 3, 4, 5] 1 1 = [1] := by rfl

example : slice [1, 2, 3, 4, 5] 2 3 = [2, 3] := by rfl

end Problem18

namespace Problem19
/-
# Problem 19
(Intermediate) Rotate a list `N` places to the left.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem19%0A%2F-%0A%23%20Problem%2019%0A(Intermediate)%20Rotate%20a%20list%20%60N%60%20places%20to%20the%20left.%0A-%2F%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%0A%0Adef%20rotate%20(l%20%3A%20List%20%CE%B1)%20(n%20%3A%20Nat)%20%3A%20List%20%CE%B1%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0Aexample%20%3A%20rotate%20%5B1%2C%202%2C%203%2C%204%2C%205%5D%202%20%3D%20%5B3%2C%204%2C%205%2C%201%2C%202%5D%20%3A%3D%20rfl%0A%0Aexample%20%3A%20rotate%20%5B1%2C%202%2C%203%5D%200%20%3D%20%5B1%2C%202%2C%203%5D%20%3A%3D%20rfl%0A%0Aexample%20%3A%20rotate%20%5B1%2C%202%2C%203%5D%203%20%3D%20%5B1%2C%202%2C%203%5D%20%3A%3D%20rfl%0A%0Aexample%20%3A%20rotate%20%5B1%2C%202%2C%203%5D%201%20%3D%20%5B2%2C%203%2C%201%5D%20%3A%3D%20rfl%0A%0Aend%20Problem19%0A
-/
variable {α : Type}

def rotate (l : List α) (n : Nat) : List α :=
  -- sorry
  let n := n % l.length
  l.drop n ++ l.take n
  -- sorry

-- The following codes are for test and you should not edit these.

example : rotate [1, 2, 3, 4, 5] 2 = [3, 4, 5, 1, 2] := rfl

example : rotate [1, 2, 3] 0 = [1, 2, 3] := rfl

example : rotate [1, 2, 3] 3 = [1, 2, 3] := rfl

example : rotate [1, 2, 3] 1 = [2, 3, 1] := rfl

end Problem19

namespace Problem20
/-
# Problem 20
(Easy) Remove the K'th element from a list.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem20%0A%2F-%0A%23%20Problem%2020%0A(Easy)%20Remove%20the%20K'th%20element%20from%20a%20list.%0A-%2F%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%0A%0Adef%20removeAt%20(l%20%3A%20List%20%CE%B1)%20(n%20%3A%20Nat)%20%3A%20List%20%CE%B1%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0Aexample%20%3A%20removeAt%20%5B'a'%2C%20'b'%2C%20'c'%2C%20'd'%5D%202%20%3D%20%5B'a'%2C%20'c'%2C%20'd'%5D%20%3A%3D%20rfl%0A%0Aexample%20%3A%20removeAt%20%5B'a'%2C%20'b'%2C%20'c'%2C%20'd'%5D%205%20%3D%20%5B'a'%2C%20'b'%2C%20'c'%2C%20'd'%5D%20%3A%3D%20rfl%0A%0Aexample%20%3A%20removeAt%20%5B'a'%2C%20'b'%2C%20'c'%2C%20'd'%5D%200%20%3D%20%5B'a'%2C%20'b'%2C%20'c'%2C%20'd'%5D%20%3A%3D%20rfl%0A%0Aexample%20%3A%20removeAt%20%5B'a'%5D%201%20%3D%20%5B%5D%20%3A%3D%20rfl%0A%0Aexample%20%3A%20removeAt%20(%5B%5D%20%3A%20List%20%CE%B1)%201%20%3D%20%5B%5D%20%3A%3D%20rfl%0A%0Aend%20Problem20%0A
-/
variable {α : Type}

def removeAt (l : List α) (n : Nat) : List α :=
  -- sorry
  match l, n with
  | [], _ => []
  | _, 0 => l
  | _ :: b, 1 => b
  | x :: b, m + 2 => x :: removeAt b (m + 1)
  -- sorry

-- The following codes are for test and you should not edit these.

example : removeAt ['a', 'b', 'c', 'd'] 2 = ['a', 'c', 'd'] := rfl

example : removeAt ['a', 'b', 'c', 'd'] 5 = ['a', 'b', 'c', 'd'] := rfl

example : removeAt ['a', 'b', 'c', 'd'] 0 = ['a', 'b', 'c', 'd'] := rfl

example : removeAt ['a'] 1 = [] := rfl

example : removeAt ([] : List α) 1 = [] := rfl

end Problem20

namespace Problem21
/-
# Problem 21
(Easy) Insert an element at a given position into a list.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem21%0A%2F-%0A%23%20Problem%2021%0A(Easy)%20Insert%20an%20element%20at%20a%20given%20position%20into%20a%20list.%0A-%2F%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%0A%0Adef%20insertAt%20(e%20%3A%20%CE%B1)%20(l%20%3A%20List%20%CE%B1)%20(i%20%3A%20Nat)%20%3A%20List%20%CE%B1%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0Aexample%20%3A%20insertAt%20%22X%22%20%5B%221%22%2C%20%222%22%2C%20%223%22%2C%20%224%22%5D%202%20%3D%20%5B%221%22%2C%20%22X%22%2C%20%222%22%2C%20%223%22%2C%20%224%22%5D%20%3A%3D%20rfl%0A%0Aexample%20%3A%20insertAt%20%22X%22%20%5B%221%22%2C%20%222%22%2C%20%223%22%2C%20%224%22%5D%201%20%3D%20%5B%22X%22%2C%20%221%22%2C%20%222%22%2C%20%223%22%2C%20%224%22%5D%20%3A%3D%20rfl%0A%0Aexample%20%3A%20insertAt%20%22X%22%20%5B%5D%201%20%3D%20%5B%22X%22%5D%20%3A%3D%20rfl%0A%0Aend%20Problem21%0A
-/
variable {α : Type}

def insertAt (e : α) (l : List α) (i : Nat) : List α :=
  -- sorry
  match l, i with
  | a :: b , i + 2 => a :: insertAt e b (i + 1)
  | _ , _ => e :: l
  -- sorry

-- The following codes are for test and you should not edit these.

example : insertAt "X" ["1", "2", "3", "4"] 2 = ["1", "X", "2", "3", "4"] := rfl

example : insertAt "X" ["1", "2", "3", "4"] 1 = ["X", "1", "2", "3", "4"] := rfl

example : insertAt "X" [] 1 = ["X"] := rfl

end Problem21

namespace Problem22
/-
# Problem 22
(Easy) Create a list containing all integers within a given range.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem22%0A%2F-%0A%23%20Problem%2022%0A(Easy)%20Create%20a%20list%20containing%20all%20integers%20within%20a%20given%20range.%0A-%2F%0A%0Adef%20range%20(m%20n%20%3A%20Int)%20%3A%20List%20Int%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0Aexample%20%3A%20range%204%209%20%3D%20%5B4%2C%205%2C%206%2C%207%2C%208%2C%209%5D%20%3A%3D%20by%20rfl%0A%0Aexample%20%3A%20range%20(-1)%202%20%3D%20%5B-1%2C%200%2C%201%2C%202%5D%20%3A%3D%20by%20rfl%0A%0Aexample%20%3A%20range%20(-2)%20(-1)%20%3D%20%5B-2%2C%20-1%5D%20%3A%3D%20by%20rfl%0A%0Aend%20Problem22%0A
-/

def range (m n : Int) : List Int :=
  -- sorry
  generate m (n - m + 1).toNat
where
  generate (start : Int) (length : Nat) : List Int :=
    match length with
    | 0 => []
    | l + 1 => generate start l ++ [start + l]
  -- sorry

-- The following codes are for test and you should not edit these.

example : range 4 9 = [4, 5, 6, 7, 8, 9] := by rfl

example : range (-1) 2 = [-1, 0, 1, 2] := by rfl

example : range (-2) (-1) = [-2, -1] := by rfl

end Problem22

namespace Problem23
/-
# Problem 23
(Intermediate) Extract a given number of randomly selected elements from a list.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem23%0A%2F-%0A%23%20Problem%2023%0A(Intermediate)%20Extract%20a%20given%20number%20of%20randomly%20selected%20elements%20from%20a%20list.%0A-%2F%0Anamespace%20P23%20--%23%0A%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%20%5BInhabited%20%CE%B1%5D%0A%0Adef%20rndSelect%20(l%20%3A%20List%20%CE%B1)%20(n%20%3A%20Nat)%20%3A%20IO%20(List%20%CE%B1)%20%3A%3D%20do%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0Adef%20runTest%20%5BBEq%20%CE%B1%5D%20%5BToString%20%CE%B1%5D%20(l%20%3A%20List%20%CE%B1)%20(n%20%3A%20Nat)%20%3A%20IO%20Unit%20%3A%3D%20do%0A%20%20let%20result%20%E2%86%90%20rndSelect%20l%20n%0A%20%20let%20check%20%3A%3D%20result.length%20%3D%3D%20n%0A%20%20%20%20%7C%3E%20(%C2%B7%20%26%26%20result.all%20l.contains)%0A%20%20if%20check%20then%0A%20%20%20%20IO.println%20s!%22ok!%22%0A%20%20else%0A%20%20%20%20throw%20%3C%7C%20.userError%20s!%22failed%3A%20rndSelect%20%7Bl%7D%20%7Bn%7D%20%3D%20%7Bresult%7D%22%0A%0A%23eval%20runTest%20%5B1%2C%202%2C%203%5D%200%0A%0A%23eval%20runTest%20%5B'a'%2C%20'b'%5D%201%0A%0A%23eval%20runTest%20%5B1%2C%202%2C%203%2C%204%2C%205%5D%202%0A%0A%23eval%20runTest%20%5B1%2C%201%2C%201%5D%202%0A%0A%23eval%20runTest%20%5B2%2C%202%2C%202%5D%2012%0A%0A%23eval%20runTest%20(List.range%205200)%201897%0A%0Aend%20P23%20--%23%0A%0Aend%20Problem23%0A
-/
namespace P23 --#

variable {α : Type} [Inhabited α]

def rndSelect (l : List α) (n : Nat) : IO (List α) := do
  -- sorry
  match l, n with
  | [], _ => pure []
  | _, 0 => pure []
  | _, n + 1 =>
    let index ← IO.rand 0 $ l.length - 1
    let previous ← rndSelect l n
    pure <| l[index]! :: previous
  -- sorry

-- The following codes are for test and you should not edit these.

def runTest [BEq α] [ToString α] (l : List α) (n : Nat) : IO Unit := do
  let result ← rndSelect l n
  let check := result.length == n
    |> (· && result.all l.contains)
  if check then
    IO.println s!"ok!"
  else
    throw <| .userError s!"failed: rndSelect {l} {n} = {result}"

#eval runTest [1, 2, 3] 0

#eval runTest ['a', 'b'] 1

#eval runTest [1, 2, 3, 4, 5] 2

#eval runTest [1, 1, 1] 2

#eval runTest [2, 2, 2] 12

#eval runTest (List.range 5200) 1897

end P23 --#

end Problem23

namespace Problem24
/-
# Problem 24
(Easy) Lotto: Draw `N` different random numbers from the set `1..M`.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem24%0A%2F-%0A%23%20Problem%2024%0A(Easy)%20Lotto%3A%20Draw%20%60N%60%20different%20random%20numbers%20from%20the%20set%20%601..M%60.%0A-%2F%0Anamespace%20P24%20--%23%0A%0A%2F--%20List%20of%20natural%20numbers%20from%20%601%60%20to%20%60n%60%20-%2F%0Adef%20_root_.List.nrange%20(n%20%3A%20Nat)%20%3A%20List%20Nat%20%3A%3D%0A%20%20match%20n%20with%0A%20%20%7C%200%20%3D%3E%20%5B%5D%0A%20%20%7C%201%20%3D%3E%20%5B1%5D%0A%20%20%7C%20n%20%2B%201%20%3D%3E%20nrange%20n%20%2B%2B%20%5Bn%20%2B%201%5D%0A%0Aexample%20%3A%20List.nrange%205%20%3D%20%5B1%2C%202%2C%203%2C%204%2C%205%5D%20%3A%3D%20rfl%0A%0A--%20You%20can%20use%20this%20function%0A%23check%20List.nrange%0A%0Adef%20diffSelect%20(count%20range%20%3A%20Nat)%20%3A%20IO%20(List%20Nat)%20%3A%3D%20do%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0Adef%20runTest%20(count%20range%20%3A%20Nat)%20%3A%20IO%20Unit%20%3A%3D%20do%0A%20%20let%20result%20%E2%86%90%20diffSelect%20count%20range%0A%20%20let%20check%20%3A%3D%20result.eraseDups.length%20%3D%3D%20count%0A%20%20%20%20%7C%3E%20(%C2%B7%20%26%26%20result.all%20(List.nrange%20range).contains)%0A%20%20if%20check%20then%0A%20%20%20%20IO.println%20%22ok!%22%0A%20%20else%0A%20%20%20%20throw%20%3C%7C%20.userError%20s!%22failed%3A%20diffSelect%20%7Bcount%7D%20%7Brange%7D%20%3D%20%7Bresult%7D%22%0A%0A%23eval%20runTest%203%203%0A%0A%23eval%20runTest%201%201%0A%0A%23eval%20runTest%202%202%0A%0A%23eval%20runTest%206%2049%0A%0A%23eval%20runTest%201998%201999%0A%0A%23eval%20runTest%205668%205998%0A%0Aend%20P24%20--%23%0A%0Aend%20Problem24%0A
-/
namespace P24 --#

/-- List of natural numbers from `1` to `n` -/
def _root_.List.nrange (n : Nat) : List Nat :=
  match n with
  | 0 => []
  | 1 => [1]
  | n + 1 => nrange n ++ [n + 1]

example : List.nrange 5 = [1, 2, 3, 4, 5] := rfl

-- You can use this function
#check List.nrange

def diffSelect (count range : Nat) : IO (List Nat) := do
  -- sorry
  if count > range then
    IO.println s!"can't draw {count} different numbers from 1..{range}"
    return []

  let mut univ := List.nrange range
  let mut result : List Nat := []
  for _ in [0 : count] do
    let (element, rest) ← extractOne univ
    if let some e := element then
      univ := rest
      result := e :: result

  return result
where
  extractOne (univ : List Nat) : IO (Option Nat × List Nat) := do
    if univ == [] then
      return (none, [])

    let index ← IO.rand 0 (univ.length - 1)
    let element := univ[index]!
    let rest := univ.take index ++ univ.drop (index + 1)
    return (element, rest)
  -- sorry

-- The following codes are for test and you should not edit these.

def runTest (count range : Nat) : IO Unit := do
  let result ← diffSelect count range
  let check := result.eraseDups.length == count
    |> (· && result.all (List.nrange range).contains)
  if check then
    IO.println "ok!"
  else
    throw <| .userError s!"failed: diffSelect {count} {range} = {result}"

#eval runTest 3 3

#eval runTest 1 1

#eval runTest 2 2

#eval runTest 6 49

#eval runTest 1998 1999

#eval runTest 5668 5998

end P24 --#

end Problem24

namespace Problem25
/-
# Problem 25
(Easy) Generate a random permutation of the elements of a list.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem25%0A%2F-%0A%23%20Problem%2025%0A(Easy)%20Generate%20a%20random%20permutation%20of%20the%20elements%20of%20a%20list.%0A-%2F%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%20%5BInhabited%20%CE%B1%5D%20%5BBEq%20%CE%B1%5D%0A%0A%2F--%20Randomly%20removes%20one%20element%20from%20the%20given%20list%0Aand%20returns%20the%20removed%20element%20and%20the%20remaining%20pairs%20of%20elements%20in%20the%20List.%20-%2F%0Adef%20_root_.List.extractOne%20(univ%20%3A%20List%20%CE%B1)%20%3A%20IO%20(Option%20%CE%B1%20%C3%97%20List%20%CE%B1)%20%3A%3D%20do%0A%20%20if%20univ%20%3D%3D%20%5B%5D%20then%0A%20%20%20%20return%20(none%2C%20%5B%5D)%0A%0A%20%20let%20index%20%E2%86%90%20IO.rand%200%20(univ.length%20-%201)%0A%20%20let%20element%20%3A%3D%20univ%5Bindex%5D!%0A%20%20let%20rest%20%3A%3D%20univ.take%20index%20%2B%2B%20univ.drop%20(index%20%2B%201)%0A%20%20return%20(element%2C%20rest)%0A%0Apartial%20def%20rndPermu%20(l%20%3A%20List%20%CE%B1)%20%3A%20IO%20(List%20%CE%B1)%20%3A%3D%20do%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0Adef%20runTest%20%5BToString%20%CE%B1%5D%20(l%20%3A%20List%20%CE%B1)%20%3A%20IO%20Unit%20%3A%3D%20do%0A%20%20let%20result%20%E2%86%90%20rndPermu%20l%0A%20%20let%20check%20%3A%3D%20result.isPerm%20l%0A%0A%20%20if%20l.length%20%3E%3D%2030%20then%0A%20%20%20%20let%20result'%20%E2%86%90%20rndPermu%20l%0A%20%20%20%20if%20result%20%3D%3D%20result'%20then%0A%20%20%20%20%20%20throw%20%3C%7C%20.userError%20%22failed%3A%20Your%20function%20is%20not%20random.%22%0A%0A%20%20if%20check%20then%0A%20%20%20%20IO.println%20%22ok!%22%0A%20%20else%0A%20%20%20%20throw%20%3C%7C%20.userError%20s!%22failed%3A%20rndPermu%20%7Bl%7D%20%3D%20%7Bresult%7D%22%0A%0A%23eval%20runTest%20%5B1%2C%202%2C%203%5D%0A%0A%23eval%20runTest%20%5B'a'%2C%20'a'%2C%20'a'%5D%0A%0A%23eval%20runTest%20(%5B%5D%20%3A%20List%20Nat)%0A%0A%23eval%20runTest%20(List.range%2035)%0A%0Aend%20Problem25%0A
-/
variable {α : Type} [Inhabited α] [BEq α]

/-- Randomly removes one element from the given list
and returns the removed element and the remaining pairs of elements in the List. -/
def _root_.List.extractOne (univ : List α) : IO (Option α × List α) := do
  if univ == [] then
    return (none, [])

  let index ← IO.rand 0 (univ.length - 1)
  let element := univ[index]!
  let rest := univ.take index ++ univ.drop (index + 1)
  return (element, rest)

partial def rndPermu (l : List α) : IO (List α) := do
  -- sorry
  let (element, rest) ← l.extractOne
  match element with
  | none => return []
  | some e =>
    return e :: (← rndPermu rest)
  -- sorry

-- The following codes are for test and you should not edit these.

def runTest [ToString α] (l : List α) : IO Unit := do
  let result ← rndPermu l
  let check := result.isPerm l

  if l.length >= 30 then
    let result' ← rndPermu l
    if result == result' then
      throw <| .userError "failed: Your function is not random."

  if check then
    IO.println "ok!"
  else
    throw <| .userError s!"failed: rndPermu {l} = {result}"

#eval runTest [1, 2, 3]

#eval runTest ['a', 'a', 'a']

#eval runTest ([] : List Nat)

#eval runTest (List.range 35)

end Problem25

namespace Problem26
/-
# Problem 26
(Intermediate) Generate combinations of `K` distinct objects chosen from the `N` elements of a list.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem26%0A%2F-%0A%23%20Problem%2026%0A(Intermediate)%20Generate%20combinations%20of%20%60K%60%20distinct%20objects%20chosen%20from%20the%20%60N%60%20elements%20of%20a%20list.%0A-%2F%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%0A%0Adef%20_root_.List.combinations%20(k%20%3A%20Nat)%20(l%20%3A%20List%20%CE%B1)%20%3A%20List%20(List%20%CE%B1)%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0Aexample%20%3A%20%5B1%2C%202%2C%203%2C%204%5D.combinations%202%0A%20%20%3D%20%5B%5B1%2C%202%5D%2C%20%5B1%2C%203%5D%2C%20%5B1%2C%204%5D%2C%20%5B2%2C%203%5D%2C%20%5B2%2C%204%5D%2C%20%5B3%2C%204%5D%5D%20%3A%3D%20rfl%0A%0Aexample%20%3A%20%5B1%2C%202%2C%203%2C%204%5D.combinations%203%0A%20%20%3D%20%5B%5B1%2C%202%2C%203%5D%2C%20%5B1%2C%202%2C%204%5D%2C%20%5B1%2C%203%2C%204%5D%2C%20%5B2%2C%203%2C%204%5D%5D%20%3A%3D%20rfl%0A%0Aexample%20%3A%20%5B'a'%2C%20'b'%2C%20'c'%5D.combinations%201%0A%20%20%3D%20%5B%5B'a'%5D%2C%20%5B'b'%5D%2C%20%5B'c'%5D%5D%20%3A%3D%20rfl%0A%0Aend%20Problem26%0A
-/
variable {α : Type}

def _root_.List.combinations (k : Nat) (l : List α) : List (List α) :=
  -- sorry
  match k, l with
  | 0, _ => [[]]
  | _, [] => []
  | k + 1, x :: xs =>
    ((x :: ·) <$> (List.combinations k xs)) ++ (List.combinations (k + 1) xs)
  -- sorry

-- The following codes are for test and you should not edit these.

example : [1, 2, 3, 4].combinations 2
  = [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]] := rfl

example : [1, 2, 3, 4].combinations 3
  = [[1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4]] := rfl

example : ['a', 'b', 'c'].combinations 1
  = [['a'], ['b'], ['c']] := rfl

end Problem26

namespace Problem27
/- # Problem 27
(Intermediate) Group the elements of a set into disjoint subsets.

Write a function that generates all the possibilities and returns them in a list.

> **Note**: Originally there were two questions, (a) and (b), but I omitted (a) because it is a special case of (b).

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem27%0A%2F-%20%23%20Problem%2027%0A(Intermediate)%20Group%20the%20elements%20of%20a%20set%20into%20disjoint%20subsets.%0A%0AWrite%20a%20function%20that%20generates%20all%20the%20possibilities%20and%20returns%20them%20in%20a%20list.%0A%0A%3E%20**Note**%3A%20Originally%20there%20were%20two%20questions%2C%20(a)%20and%20(b)%2C%20but%20I%20omitted%20(a)%20because%20it%20is%20a%20special%20case%20of%20(b).%0A-%2F%0Auniverse%20u%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%0A%0Anamespace%20ListMonad%0A%0A%2F--%20monad%20instance%20of%20%60List%60%20-%2F%0Ascoped%20instance%20%3A%20Monad%20List%20where%0A%20%20pure%20%3A%3D%20List.singleton%0A%20%20bind%20xs%20f%20%3A%3D%20xs.flatMap%20f%0A%20%20map%20%3A%3D%20List.map%0A%0Aend%20ListMonad%0A%0Aopen%20scoped%20ListMonad%0A%0Adef%20_root_.List.split%20(n%20%3A%20Nat)%20(xs%20%3A%20List%20%CE%B1)%20%3A%20List%20(List%20%CE%B1%20%C3%97%20List%20%CE%B1)%20%3A%3D%0A%20%20sorry%0A%0A%23guard%20%5B1%2C%202%5D.split%201%20%3D%20%5B(%5B1%5D%2C%20%5B2%5D)%2C%20(%5B2%5D%2C%20%5B1%5D)%5D%0A%0A%23guard%20%5B1%2C%202%2C%203%5D.split%202%20%3D%20%5B(%5B1%2C%202%5D%2C%20%5B3%5D)%2C%20(%5B1%2C%203%5D%2C%20%5B2%5D)%2C%20(%5B2%2C%203%5D%2C%20%5B1%5D)%5D%0A%0A%23guard%20%5B1%2C%202%2C%203%5D.split%203%20%3D%20%5B(%5B1%2C%202%2C%203%5D%2C%20%5B%5D)%5D%0A%0A%23guard%20%5B1%2C%202%2C%203%5D.split%200%20%3D%20%5B(%5B%5D%2C%20%5B1%2C%202%2C%203%5D)%5D%0A%0Adef%20group%20(pattern%20%3A%20List%20Nat)%20(xs%20%3A%20List%20%CE%B1)%3A%20List%20%3C%7C%20List%20%3C%7C%20List%20%CE%B1%20%3A%3D%0A%20%20sorry%0A%0A%23guard%20group%20%5B1%2C%202%5D%20%5B1%2C%202%2C%203%5D%20%3D%20%5B%5B%5B1%5D%2C%20%5B2%2C%203%5D%5D%2C%20%5B%5B2%5D%2C%20%5B1%2C%203%5D%5D%2C%20%5B%5B3%5D%2C%20%5B1%2C%202%5D%5D%5D%0A%0A%23guard%20group%20%5B2%2C%201%5D%20%5B2%2C%204%2C%206%5D%20%3D%20%5B%5B%5B2%2C%204%5D%2C%20%5B6%5D%5D%2C%20%5B%5B2%2C%206%5D%2C%20%5B4%5D%5D%2C%20%5B%5B4%2C%206%5D%2C%20%5B2%5D%5D%5D%0A%0A%23guard%20group%20%5B1%2C%201%5D%20%5B1%2C%202%5D%20%3D%20%5B%5B%5B1%5D%2C%20%5B2%5D%5D%2C%20%5B%5B2%5D%2C%20%5B1%5D%5D%5D%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0A%2F--%20pattern%20of%202D%20%60List%60%20-%2F%0Adef%20_root_.List.pattern%20(xs%20%3A%20List%20(List%20%CE%B1))%20%3A%20List%20Nat%20%3A%3D%0A%20%20xs.map%20List.length%0A%0Adef%20_root_.Nat.factorial%20(n%20%3A%20Nat)%20%3A%20Nat%20%3A%3D%0A%20%20match%20n%20with%0A%20%20%7C%200%20%3D%3E%201%0A%20%20%7C%20n%20%2B%201%20%3D%3E%20(n%20%2B%201)%20*%20n.factorial%0A%0Adef%20runTest%20%5BToString%20%CE%B1%5D%20%5BBEq%20%CE%B1%5D%20(pattern%20%3A%20List%20Nat)%20(xs%20%3A%20List%20%CE%B1)%20%3A%20IO%20Unit%20%3A%3D%20do%0A%20%20if%20pattern.foldl%20(%C2%B7%20%2B%20%C2%B7)%200%20!%3D%20xs.length%20then%0A%20%20%20%20throw%20%3C%7C%20IO.userError%20s!%22invalid%20test%20case%3A%20the%20sum%20of%20pattern%20should%20be%20equal%20to%20the%20length%20of%20the%20input%20list.%22%0A%0A%20%20let%20result%20%3A%3D%20group%20pattern%20xs%0A%20%20let%20pattern_check%20%3A%3D%20result.map%20List.pattern%0A%20%20%20%20%7C%3E.all%20(%C2%B7%20%3D%20pattern)%0A%20%20if%20not%20pattern_check%20then%0A%20%20%20%20throw%20%3C%7C%20.userError%20s!%22pattern%20check%20failed%3A%20some%20elements%20of%20result%20has%20invalid%20pattern.%22%0A%0A%20%20let%20distinct_check%20%3A%3D%20result.eraseDups.length%20%3D%20result.length%0A%20%20if%20not%20distinct_check%20then%0A%20%20%20%20throw%20%3C%7C%20.userError%20s!%22distinct%20check%20failed%3A%20the%20elements%20of%20result%20should%20be%20distinct.%22%0A%0A%20%20let%20expected_length%20%3A%3D%20pattern.map%20Nat.factorial%0A%20%20%20%20%7C%3E.foldl%20(%C2%B7%20*%20%C2%B7)%201%0A%20%20%20%20%7C%3E%20(fun%20x%20%3D%3E%20xs.length.factorial%20%2F%20x)%0A%20%20let%20length_check%20%3A%3D%20result.length%20%3D%20expected_length%0A%20%20if%20not%20length_check%20then%0A%20%20%20%20throw%20%3C%7C%20.userError%20s!%22length%20check%20failed%3A%20the%20length%20of%20result%20should%20be%20equal%20to%20%7Bexpected_length%7D.%22%0A%0A%20%20IO.println%20%22OK!%22%0A%0A%23eval%20runTest%20%5B1%2C%202%2C%203%5D%20%3C%7C%20List.range%206%0A%0A%23eval%20runTest%20%5B2%2C%202%2C%204%5D%20%3C%7C%20List.range%208%0A%0A%23eval%20runTest%20%5B2%2C%203%2C%204%5D%20%3C%7C%20List.range%209%0A%0Aend%20Problem27%0A
-/
universe u
variable {α : Type}

namespace ListMonad

/-- monad instance of `List` -/
scoped instance : Monad List where
  pure := List.singleton
  bind xs f := xs.flatMap f
  map := List.map

end ListMonad

open scoped ListMonad

def _root_.List.split (n : Nat) (xs : List α) : List (List α × List α) :=
  -- sorry
  match n, xs with
  | 0, _ => [([], xs)]
  | _, [] => []
  | n + 1, x :: xs =>
    let ts := (xs.split n).map fun ⟨ys, zs⟩ => (x :: ys, zs)
    let ds := (xs.split (n + 1)).map fun ⟨ys, zs⟩ => (ys, x :: zs)
    ts ++ ds
  -- sorry

#guard [1, 2].split 1 = [([1], [2]), ([2], [1])]

#guard [1, 2, 3].split 2 = [([1, 2], [3]), ([1, 3], [2]), ([2, 3], [1])]

#guard [1, 2, 3].split 3 = [([1, 2, 3], [])]

#guard [1, 2, 3].split 0 = [([], [1, 2, 3])]

def group (pattern : List Nat) (xs : List α): List <| List <| List α :=
  -- sorry
  match pattern, xs with
  | [], _ => [[]]
  | n :: ns, xs => do
    let (g, rs) ← xs.split n
    let gs ← group ns rs
    pure <| g :: gs
  -- sorry

#guard group [1, 2] [1, 2, 3] = [[[1], [2, 3]], [[2], [1, 3]], [[3], [1, 2]]]

#guard group [2, 1] [2, 4, 6] = [[[2, 4], [6]], [[2, 6], [4]], [[4, 6], [2]]]

#guard group [1, 1] [1, 2] = [[[1], [2]], [[2], [1]]]

-- The following codes are for test and you should not edit these.

/-- pattern of 2D `List` -/
def _root_.List.pattern (xs : List (List α)) : List Nat :=
  xs.map List.length

def _root_.Nat.factorial (n : Nat) : Nat :=
  match n with
  | 0 => 1
  | n + 1 => (n + 1) * n.factorial

def runTest [ToString α] [BEq α] (pattern : List Nat) (xs : List α) : IO Unit := do
  if pattern.foldl (· + ·) 0 != xs.length then
    throw <| IO.userError s!"invalid test case: the sum of pattern should be equal to the length of the input list."

  let result := group pattern xs
  let pattern_check := result.map List.pattern
    |>.all (· = pattern)
  if not pattern_check then
    throw <| .userError s!"pattern check failed: some elements of result has invalid pattern."

  let distinct_check := result.eraseDups.length = result.length
  if not distinct_check then
    throw <| .userError s!"distinct check failed: the elements of result should be distinct."

  let expected_length := pattern.map Nat.factorial
    |>.foldl (· * ·) 1
    |> (fun x => xs.length.factorial / x)
  let length_check := result.length = expected_length
  if not length_check then
    throw <| .userError s!"length check failed: the length of result should be equal to {expected_length}."

  IO.println "OK!"

#eval runTest [1, 2, 3] <| List.range 6

#eval runTest [2, 2, 4] <| List.range 8

#eval runTest [2, 3, 4] <| List.range 9

end Problem27

namespace Problem28A
/- # Problem 28A
(Intermediate) Sorting a list of lists according to length of sublists.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem28A%0A%2F-%20%23%20Problem%2028A%0A(Intermediate)%20Sorting%20a%20list%20of%20lists%20according%20to%20length%20of%20sublists.%0A-%2F%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%0A%0A--%20You%20can%20use%20this!%0A%23check%20List.mergeSort%0A%0Adef%20lsort%20(l%20%3A%20List%20(List%20%CE%B1))%20%3A%20List%20(List%20%CE%B1)%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0A%23guard%20lsort%20%5B%5B%22a%22%2C%20%22b%22%2C%20%22c%22%5D%2C%20%5B%22a%22%2C%20%22b%22%5D%2C%20%5B%22a%22%5D%5D%0A%20%20%3D%20%5B%5B%22a%22%5D%2C%20%5B%22a%22%2C%20%22b%22%5D%2C%20%5B%22a%22%2C%20%22b%22%2C%20%22c%22%5D%5D%0A%0A%23guard%20lsort%20%5B%5B3%2C%201%2C%204%5D%2C%20%5B1%2C%205%2C%209%2C%202%5D%2C%20%5B6%2C%205%2C%203%2C%205%5D%2C%20%5B1%5D%5D%0A%20%20%3D%20%5B%5B1%5D%2C%20%5B3%2C%201%2C%204%5D%2C%20%5B1%2C%205%2C%209%2C%202%5D%2C%20%5B6%2C%205%2C%203%2C%205%5D%5D%0A%0Aend%20Problem28A%0A
-/
variable {α : Type}

-- You can use this!
#check List.mergeSort

def lsort (l : List (List α)) : List (List α) :=
  -- sorry
  List.mergeSort l (fun l₁ l₂ => l₁.length ≤ l₂.length)
  -- sorry

-- The following codes are for test and you should not edit these.

#guard lsort [["a", "b", "c"], ["a", "b"], ["a"]]
  = [["a"], ["a", "b"], ["a", "b", "c"]]

#guard lsort [[3, 1, 4], [1, 5, 9, 2], [6, 5, 3, 5], [1]]
  = [[1], [3, 1, 4], [1, 5, 9, 2], [6, 5, 3, 5]]

end Problem28A

namespace Problem28B
/- # Problem 28B

(Intermediate) Again, we suppose that a list contains elements that are lists themselves. But this time the objective is to sort the elements of this list according to their **length frequency**; i.e., in the default, where sorting is done ascendingly, lists with rare lengths are placed first, others with a more frequent length come later.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem28B%0A%2F-%20%23%20Problem%2028B%0A%0A(Intermediate)%20Again%2C%20we%20suppose%20that%20a%20list%20contains%20elements%20that%20are%20lists%20themselves.%20But%20this%20time%20the%20objective%20is%20to%20sort%20the%20elements%20of%20this%20list%20according%20to%20their%20**length%20frequency**%3B%20i.e.%2C%20in%20the%20default%2C%20where%20sorting%20is%20done%20ascendingly%2C%20lists%20with%20rare%20lengths%20are%20placed%20first%2C%20others%20with%20a%20more%20frequent%20length%20come%20later.%0A-%2F%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%0A%0A--%20You%20can%20use%20this!%0A%23check%20List.mergeSort%0A--%23--%0A%2F--%20Count%20the%20number%20of%20lists%20in%20list%20%60l%60%20that%20have%20the%20same%20length%20as%20%60target%60%20-%2F%0Adef%20makeToLengthFreq%20(l%20%3A%20List%20(List%20%CE%B1))%20(target%20%3A%20List%20%CE%B1)%20%3A%20Nat%20%3A%3D%0A%20%20let%20lengthList%20%3A%3D%20l.map%20(%C2%B7.length)%0A%20%20lengthList.filter%20(%C2%B7%20%3D%20target.length)%20%7C%3E.length%0A--%23--%0A%0Adef%20lfsort%20(l%20%3A%20List%20(List%20%CE%B1))%20%3A%20List%20(List%20%CE%B1)%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0A%23guard%20lfsort%20(%5B%5B%5D%5D%20%3A%20List%20(List%20String))%20%3D%20%5B%5B%5D%5D%0A%0A%23guard%20lfsort%20%5B%5B1%2C%202%5D%2C%20%5B1%5D%2C%20%5B1%2C%202%5D%5D%20%3D%20%5B%5B1%5D%2C%20%5B1%2C%202%5D%2C%20%5B1%2C%202%5D%5D%0A%0A%23guard%20lfsort%20%5B%5B1%2C%202%5D%2C%20%5B1%5D%2C%20%5B2%2C%203%5D%5D%20%3D%20%5B%5B1%5D%2C%20%5B1%2C%202%5D%2C%20%5B2%2C%203%5D%5D%0A%0Aend%20Problem28B%0A
-/
variable {α : Type}

-- You can use this!
#check List.mergeSort
--#--
/-- Count the number of lists in list `l` that have the same length as `target` -/
def makeToLengthFreq (l : List (List α)) (target : List α) : Nat :=
  let lengthList := l.map (·.length)
  lengthList.filter (· = target.length) |>.length
--#--

def lfsort (l : List (List α)) : List (List α) :=
  -- sorry
  List.mergeSort l (fun t s => makeToLengthFreq l t ≤ makeToLengthFreq l s)
  -- sorry

-- The following codes are for test and you should not edit these.

#guard lfsort ([[]] : List (List String)) = [[]]

#guard lfsort [[1, 2], [1], [1, 2]] = [[1], [1, 2], [1, 2]]

#guard lfsort [[1, 2], [1], [2, 3]] = [[1], [1, 2], [2, 3]]

end Problem28B

namespace Problem31
/-
# Problem 31
(Intermediate) Determine whether a given integer number is prime.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem31%0A%2F-%0A%23%20Problem%2031%0A(Intermediate)%20Determine%20whether%20a%20given%20integer%20number%20is%20prime.%0A-%2F%0A%0Adef%20isPrime%20(n%20%3A%20Nat)%20%3A%20Bool%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0Aexample%20%3A%20isPrime%207%20%3D%20true%20%3A%3D%20rfl%0A%0Aexample%20%3A%20isPrime%20(7%20*%2043)%20%3D%20false%20%3A%3D%20rfl%0A%0Aexample%20%3A%20isPrime%20307%20%3D%20true%20%3A%3D%20rfl%0A%0Aexample%20%3A%20isPrime%200%20%3D%20false%20%3A%3D%20rfl%0A%0Aexample%20%3A%20isPrime%201%20%3D%20false%20%3A%3D%20rfl%0A%0Aend%20Problem31%0A
-/

def isPrime (n : Nat) : Bool :=
  -- sorry
  if n == 0 || n == 1 then
    false
  else
    let properDivisors := List.range n
      |>.drop 2
      |>.filter (n % · == 0)

    properDivisors.length == 0
  -- sorry

-- The following codes are for test and you should not edit these.

example : isPrime 7 = true := rfl

example : isPrime (7 * 43) = false := rfl

example : isPrime 307 = true := rfl

example : isPrime 0 = false := rfl

example : isPrime 1 = false := rfl

end Problem31

namespace Problem32
/-
# Problem 32
(Intermediate) Determine the greatest common divisor of two positive integer numbers. Use the Euclid's algorithm.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem32%0A%2F-%0A%23%20Problem%2032%0A(Intermediate)%20Determine%20the%20greatest%20common%20divisor%20of%20two%20positive%20integer%20numbers.%20Use%20the%20Euclid's%20algorithm.%0A-%2F%0A%0A--%20don't%20use%20this%0A%23check%20Nat.gcd%0A%0A%2F--%20Euclidean%20algorithm%20-%2F%0Apartial%20def%20gcd%20(m%20n%20%3A%20Nat)%20%3A%20Nat%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0Aexample%20%3A%20gcd%206%200%20%3D%206%20%3A%3D%20by%20native_decide%0A%0Aexample%20%3A%20gcd%201%2037%20%3D%201%20%3A%3D%20by%20native_decide%0A%0Aexample%20%3A%20gcd%206%2015%20%3D%203%20%3A%3D%20by%20native_decide%0A%0Aexample%20%3A%20gcd%2021%203%20%3D%203%20%3A%3D%20by%20native_decide%0A%0Aexample%20%3A%20gcd%2042998431%20120019%20%3D%201%20%3A%3D%20by%20native_decide%0A%0Aend%20Problem32%0A
-/

-- don't use this
#check Nat.gcd

/-- Euclidean algorithm -/
partial def gcd (m n : Nat) : Nat :=
  -- sorry
  if m = 0 then
    n
  else
    gcd (n % m) m
  -- sorry

-- The following codes are for test and you should not edit these.

example : gcd 6 0 = 6 := by native_decide

example : gcd 1 37 = 1 := by native_decide

example : gcd 6 15 = 3 := by native_decide

example : gcd 21 3 = 3 := by native_decide

example : gcd 42998431 120019 = 1 := by native_decide

end Problem32

namespace Problem33
/- # Problem 33
(Easy) Determine whether two positive integer numbers are coprime.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem33%0A%2F-%20%23%20Problem%2033%0A(Easy)%20Determine%20whether%20two%20positive%20integer%20numbers%20are%20coprime.%0A-%2F%0A%0A--%20You%20can%20use%20this%0A%23check%20Nat.gcd%0A%0Adef%20coprime%20(a%20b%20%3A%20Nat)%20%3A%20Bool%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0Aexample%20%3A%20coprime%2035%2064%20%3D%20true%20%3A%3D%20rfl%0A%0Aexample%20%3A%20coprime%2038859%20233153%20%3D%20true%20%3A%3D%20rfl%0A%0Aexample%20%3A%20coprime%2010284412%2024135577%20%3D%20true%20%3A%3D%20rfl%0A%0Aend%20Problem33%0A
-/

-- You can use this
#check Nat.gcd

def coprime (a b : Nat) : Bool :=
  -- sorry
  Nat.gcd a b = 1
  -- sorry

-- The following codes are for test and you should not edit these.

example : coprime 35 64 = true := rfl

example : coprime 38859 233153 = true := rfl

example : coprime 10284412 24135577 = true := rfl

end Problem33

namespace Problem34
/-
# Problem 34
(Intermediate) Calculate Euler's totient function `φ(m)`.

Euler's so-called totient function `φ(m)` is defined as the number of positive integers `r (1 <= r < m)` that are coprime to `m`.

Example: `m = 10`: `r = 1, 3, 7, 9`; thus `φ(m) = 4`. Note the special case: `φ(1) = 1`.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem34%0A%2F-%0A%23%20Problem%2034%0A(Intermediate)%20Calculate%20Euler's%20totient%20function%20%60%CF%86(m)%60.%0A%0AEuler's%20so-called%20totient%20function%20%60%CF%86(m)%60%20is%20defined%20as%20the%20number%20of%20positive%20integers%20%60r%20(1%20%3C%3D%20r%20%3C%20m)%60%20that%20are%20coprime%20to%20%60m%60.%0A%0AExample%3A%20%60m%20%3D%2010%60%3A%20%60r%20%3D%201%2C%203%2C%207%2C%209%60%3B%20thus%20%60%CF%86(m)%20%3D%204%60.%20Note%20the%20special%20case%3A%20%60%CF%86(1)%20%3D%201%60.%0A-%2F%0A%0Adef%20totient%20(m%20%3A%20Nat)%20%3A%20Nat%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0Aexample%20%3A%20totient%201%20%3D%201%20%3A%3D%20rfl%0A%0Aexample%20%3A%20totient%2010%20%3D%204%20%3A%3D%20rfl%0A%0Aexample%20%3A%20totient%207%20%3D%206%20%3A%3D%20rfl%0A%0Aexample%20%3A%20totient%2070%20%3D%2024%20%3A%3D%20rfl%0A%0Aend%20Problem34%0A
-/

def totient (m : Nat) : Nat :=
  -- sorry
  let coprimes := List.range (m + 1)
    |>.drop 1
    |>.filter (Nat.gcd · m == 1)
  coprimes.length
  -- sorry

-- The following codes are for test and you should not edit these.

example : totient 1 = 1 := rfl

example : totient 10 = 4 := rfl

example : totient 7 = 6 := rfl

example : totient 70 = 24 := rfl

end Problem34

namespace Problem35
/-
# Problem 35
(Intermediate) Determine the prime factors of a given positive integer.

Construct a flat list containing the prime factors in ascending order.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem35%0A%2F-%0A%23%20Problem%2035%0A(Intermediate)%20Determine%20the%20prime%20factors%20of%20a%20given%20positive%20integer.%0A%0AConstruct%20a%20flat%20list%20containing%20the%20prime%20factors%20in%20ascending%20order.%0A-%2F%0A%0Apartial%20def%20primeFactors%20(n%20%3A%20Nat)%20%3A%20List%20Nat%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0Aexample%20%3A%20primeFactors%2017%20%3D%20%5B17%5D%20%3A%3D%20by%20native_decide%0A%0Aexample%20%3A%20primeFactors%20315%20%3D%20%5B3%2C%203%2C%205%2C%207%5D%20%3A%3D%20by%20native_decide%0A%0Aexample%20%3A%20primeFactors%2065536%20%3D%20%5B2%2C%202%2C%202%2C%202%2C%202%2C%202%2C%202%2C%202%2C%202%2C%202%2C%202%2C%202%2C%202%2C%202%2C%202%2C%202%5D%20%3A%3D%20by%20native_decide%0A%0Aexample%20%3A%20primeFactors%2020063%20%3D%20%5B20063%5D%20%3A%3D%20by%20native_decide%0A%0Aexample%20%3A%20primeFactors%20627537863%20%3D%20%5B24137%2C%2025999%5D%20%3A%3D%20by%20native_decide%0A%0Aexample%20%3A%20primeFactors%2010963345907%20%3D%20%5B104683%2C%20104729%5D%20%3A%3D%20by%20native_decide%0A%0Aend%20Problem35%0A
-/

partial def primeFactors (n : Nat) : List Nat :=
  -- sorry
  loop n 2 [] |>.reverse
where
  loop (tgt candidate : Nat) (acc : List Nat) : List Nat :=
    if tgt ≤ 1 || candidate > tgt then
      acc
    else if tgt % candidate = 0 then
      loop (tgt / candidate) candidate <| candidate :: acc
    else
      loop tgt (candidate + 1) acc
  -- sorry

-- The following codes are for test and you should not edit these.

example : primeFactors 17 = [17] := by native_decide

example : primeFactors 315 = [3, 3, 5, 7] := by native_decide

example : primeFactors 65536 = [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2] := by native_decide

example : primeFactors 20063 = [20063] := by native_decide

example : primeFactors 627537863 = [24137, 25999] := by native_decide

example : primeFactors 10963345907 = [104683, 104729] := by native_decide

end Problem35

namespace Problem36
/-
# Problem 36
(Intermediate) Determine the prime factors and their multiplicities of a given positive integer.

Construct a list containing each prime factor and its multiplicity.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem36%0A%2F-%0A%23%20Problem%2036%0A(Intermediate)%20Determine%20the%20prime%20factors%20and%20their%20multiplicities%20of%20a%20given%20positive%20integer.%0A%0AConstruct%20a%20list%20containing%20each%20prime%20factor%20and%20its%20multiplicity.%0A-%2F%0A%0Apartial%20def%20primeFactorsMult%20(n%20%3A%20Nat)%20%3A%20List%20(Nat%20%C3%97%20Nat)%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0A%23guard%20primeFactorsMult%200%20%3D%20%5B%5D%0A%0A%23guard%20primeFactorsMult%201%20%3D%20%5B%5D%0A%0A%23guard%20primeFactorsMult%202%20%3D%20%5B(2%2C%201)%5D%0A%0A%23guard%20primeFactorsMult%20315%20%3D%20%5B(3%2C%202)%2C%20(5%2C%201)%2C%20(7%2C%201)%5D%0A%0A%23guard%20primeFactorsMult%20307%20%3D%20%5B(307%2C%201)%5D%0A%0A%23guard%20primeFactorsMult%201000%20%3D%20%5B(2%2C%203)%2C%20(5%2C%203)%5D%0A%0A%23guard%20primeFactorsMult%20990801529%20%3D%20%5B(31477%2C%202)%5D%0A%0A%23guard%20primeFactorsMult%20119883030485877764933%0A%20%20%3D%20%5B(104623%2C%201)%2C%20(104639%2C%202)%2C%20(104651%2C%201)%5D%0A%0Aend%20Problem36%0A
-/

partial def primeFactorsMult (n : Nat) : List (Nat × Nat) :=
  -- sorry
  loop 2 n [] |>.reverse
where
  /-- the multiplicity of `d` in `n` -/
  extract (d n : Nat) : Nat × Nat :=
    if d ≤ 1 then
      (1, 0)
    else if n % d != 0 then
      (d, 0)
    else
      let (d, m) := extract d (n / d)
      (d, m + 1)

  /-- helper function -/
  loop (d target : Nat) (acc : List (Nat × Nat)) : List (Nat × Nat) :=
    if target ≤ 1 then
      acc
    else
      let (d, m) := extract d target
      if m = 0 then
        loop (d + 1) target acc
      else
        loop (d + 1) (target / (d ^ m)) ((d, m) :: acc)
  -- sorry

-- The following codes are for test and you should not edit these.

#guard primeFactorsMult 0 = []

#guard primeFactorsMult 1 = []

#guard primeFactorsMult 2 = [(2, 1)]

#guard primeFactorsMult 315 = [(3, 2), (5, 1), (7, 1)]

#guard primeFactorsMult 307 = [(307, 1)]

#guard primeFactorsMult 1000 = [(2, 3), (5, 3)]

#guard primeFactorsMult 990801529 = [(31477, 2)]

#guard primeFactorsMult 119883030485877764933
  = [(104623, 1), (104639, 2), (104651, 1)]

end Problem36

namespace Problem37
/-
# Problem 37
(Intermediate) Calculate Euler's totient function `φ(m)` (improved).

See [Problem 34](./Problem34.md) for the definition of Euler's totient function. If the list of the prime factors of a number `m` is known in the form of [Problem 36](./Problem36.md) then the function `φ(m)` can be efficiently calculated as follows: Let `[(p₁, m₁), (p₂, m₂), (p₃, m₃), ...]` be the list of prime factors (and their multiplicities) of a given number `m`. Then `φ(m)` can be calculated with the following formula:

$$
φ(m) = ∏_{i=1}^{n} (p_i - 1) * p_i^{(m_i - 1)}
$$

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem37%0A%2F-%0A%23%20Problem%2037%0A(Intermediate)%20Calculate%20Euler's%20totient%20function%20%60%CF%86(m)%60%20(improved).%0A%0ASee%20%5BProblem%2034%5D(.%2FProblem34.md)%20for%20the%20definition%20of%20Euler's%20totient%20function.%20If%20the%20list%20of%20the%20prime%20factors%20of%20a%20number%20%60m%60%20is%20known%20in%20the%20form%20of%20%5BProblem%2036%5D(.%2FProblem36.md)%20then%20the%20function%20%60%CF%86(m)%60%20can%20be%20efficiently%20calculated%20as%20follows%3A%20Let%20%60%5B(p%E2%82%81%2C%20m%E2%82%81)%2C%20(p%E2%82%82%2C%20m%E2%82%82)%2C%20(p%E2%82%83%2C%20m%E2%82%83)%2C%20...%5D%60%20be%20the%20list%20of%20prime%20factors%20(and%20their%20multiplicities)%20of%20a%20given%20number%20%60m%60.%20Then%20%60%CF%86(m)%60%20can%20be%20calculated%20with%20the%20following%20formula%3A%0A%0A%24%24%0A%CF%86(m)%20%3D%20%E2%88%8F_%7Bi%3D1%7D%5E%7Bn%7D%20(p_i%20-%201)%20*%20p_i%5E%7B(m_i%20-%201)%7D%0A%24%24%0A-%2F%0A%0A%2F--%20the%20list%20of%20prime%20factors%20and%20their%20multiplicities%20of%20%60n%60%20-%2F%0Aabbrev%20PrimeFactor%20%3A%3D%20List%20(Nat%20%C3%97%20Nat)%0A%0Adef%20%CF%86%20(_n%20%3A%20Nat)%20(factors%20%3A%20PrimeFactor)%20%3A%20Nat%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0A%23guard%20%CF%86%2010%20%5B(2%2C%201)%2C%20(5%2C%201)%5D%20%3D%204%0A%0A%23guard%20%CF%86%2020%20%5B(2%2C%202)%2C%20(5%2C%201)%5D%20%3D%208%0A%0A%23guard%20%CF%86%2039%20%5B(3%2C%201)%2C%20(13%2C%201)%5D%20%3D%2024%0A%0Aend%20Problem37%0A
-/

/-- the list of prime factors and their multiplicities of `n` -/
abbrev PrimeFactor := List (Nat × Nat)

def φ (_n : Nat) (factors : PrimeFactor) : Nat :=
  -- sorry
  factors.foldl (fun acc (p, m) => acc * (p - 1) * p ^ (m - 1)) 1
  -- sorry

-- The following codes are for test and you should not edit these.

#guard φ 10 [(2, 1), (5, 1)] = 4

#guard φ 20 [(2, 2), (5, 1)] = 8

#guard φ 39 [(3, 1), (13, 1)] = 24

end Problem37

namespace Problem39
/- # Problem 39

(Easy) Given a range of integers by its lower and upper limit, construct a list of all prime numbers in that range.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem39%0A%2F-%20%23%20Problem%2039%0A%0A(Easy)%20Given%20a%20range%20of%20integers%20by%20its%20lower%20and%20upper%20limit%2C%20construct%20a%20list%20of%20all%20prime%20numbers%20in%20that%20range.%0A-%2F%0A%0A%2F--%20eratosthenes%20sieve%20-%2F%0Adef%20eratosthenes%20(n%20%3A%20Nat)%20%3A%20Array%20Bool%20%3A%3D%20Id.run%20do%0A%20%20let%20mut%20isPrime%20%3A%3D%20Array.replicate%20(n%20%2B%201)%20true%0A%0A%20%20isPrime%20%3A%3D%20isPrime.set!%200%20false%0A%20%20isPrime%20%3A%3D%20isPrime.set!%201%20false%0A%0A%20%20for%20p%20in%20%5B2%20%3A%20n%20%2B%201%5D%20do%0A%20%20%20%20if%20not%20isPrime%5Bp%5D!%20then%0A%20%20%20%20%20%20continue%0A%0A%20%20%20%20if%20p%20%5E%202%20%3E%20n%20then%0A%20%20%20%20%20%20break%0A%0A%20%20%20%20let%20mut%20q%20%3A%3D%20p%20*%20p%0A%20%20%20%20while%20q%20%3C%3D%20n%20do%0A%20%20%20%20%20%20isPrime%20%3A%3D%20isPrime.set!%20q%20false%0A%20%20%20%20%20%20q%20%3A%3D%20q%20%2B%20p%0A%0A%20%20return%20isPrime%0A%0A--%23--%0A%2F--%20Returns%20a%20list%20of%20prime%20numbers%20less%20than%20or%20equal%20to%20n%20given%20-%2F%0Adef%20primeSieve%20(n%20%3A%20Nat)%20%3A%20List%20Nat%20%3A%3D%0A%20%20let%20result%20%3A%3D%20eratosthenes%20n%0A%20%20result.toList.zipIdx%0A%20%20%20%20%7C%3E%20List.filter%20(fun%20(e%2C%20_i)%20%3D%3E%20e)%0A%20%20%20%20%7C%3E%20List.map%20(fun%20(_e%2C%20i)%20%3D%3E%20i)%0A--%23--%0A%0Adef%20primesR%20(s%20t%20%3A%20Nat)%20%3A%20List%20Nat%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0A%23guard%20primesR%2010%2010%20%3D%20%5B%5D%0A%0A%23guard%20primesR%2011%2011%20%3D%20%5B11%5D%0A%0A%23guard%20primesR%201%2010%20%3D%20%5B2%2C%203%2C%205%2C%207%5D%0A%0A%23guard%20primesR%2030%20100%20%3D%20%5B31%2C%2037%2C%2041%2C%2043%2C%2047%2C%2053%2C%2059%2C%2061%2C%2067%2C%2071%2C%2073%2C%2079%2C%2083%2C%2089%2C%2097%5D%0A%0Aend%20Problem39%0A
-/

/-- eratosthenes sieve -/
def eratosthenes (n : Nat) : Array Bool := Id.run do
  let mut isPrime := Array.replicate (n + 1) true

  isPrime := isPrime.set! 0 false
  isPrime := isPrime.set! 1 false

  for p in [2 : n + 1] do
    if not isPrime[p]! then
      continue

    if p ^ 2 > n then
      break

    let mut q := p * p
    while q <= n do
      isPrime := isPrime.set! q false
      q := q + p

  return isPrime

--#--
/-- Returns a list of prime numbers less than or equal to n given -/
def primeSieve (n : Nat) : List Nat :=
  let result := eratosthenes n
  result.toList.zipIdx
    |> List.filter (fun (e, _i) => e)
    |> List.map (fun (_e, i) => i)
--#--

def primesR (s t : Nat) : List Nat :=
  -- sorry
  primeSieve t |>.filter (· ≥ s)
  -- sorry

-- The following codes are for test and you should not edit these.

#guard primesR 10 10 = []

#guard primesR 11 11 = [11]

#guard primesR 1 10 = [2, 3, 5, 7]

#guard primesR 30 100 = [31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]

end Problem39

namespace Problem40
/- # Problem 40

(Intermediate) Goldbach's conjecture says that every positive even number greater than `2` is the sum of two prime numbers. Example: `28 = 5 + 23`. It is one of the most famous facts in number theory that has not been proved to be correct in the general case. It has been numerically confirmed up to very large numbers (much larger than we can go with our Prolog system). Write a predicate to find the two prime numbers that sum up to a given even integer.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem40%0A%2F-%20%23%20Problem%2040%0A%0A(Intermediate)%20Goldbach's%20conjecture%20says%20that%20every%20positive%20even%20number%20greater%20than%20%602%60%20is%20the%20sum%20of%20two%20prime%20numbers.%20Example%3A%20%6028%20%3D%205%20%2B%2023%60.%20It%20is%20one%20of%20the%20most%20famous%20facts%20in%20number%20theory%20that%20has%20not%20been%20proved%20to%20be%20correct%20in%20the%20general%20case.%20It%20has%20been%20numerically%20confirmed%20up%20to%20very%20large%20numbers%20(much%20larger%20than%20we%20can%20go%20with%20our%20Prolog%20system).%20Write%20a%20predicate%20to%20find%20the%20two%20prime%20numbers%20that%20sum%20up%20to%20a%20given%20even%20integer.%0A-%2F%0A%0Adef%20_root_.Nat.isPrime%20(n%20%3A%20Nat)%20%3A%20Bool%20%3A%3D%20Id.run%20do%0A%20%20if%20n%20%3C%202%20then%0A%20%20%20%20return%20false%0A%20%20for%20d%20in%20%5B2%3An%5D%20do%0A%20%20%20%20if%20n%20%25%20d%20%3D%200%20then%0A%20%20%20%20%20%20return%20false%0A%20%20%20%20if%20d%20%5E%202%20%3E%20n%20then%0A%20%20%20%20%20%20break%0A%20%20return%20true%0A%0A--%20You%20can%20use%20this!%0A%23check%20Nat.isPrime%0A%0Adef%20goldbach%20(n%20%3A%20Nat)%20%3A%20Nat%20%C3%97%20Nat%20%3A%3D%20Id.run%20do%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0Adef%20goldbachTest%20(n%20%3A%20Nat)%20%3A%20IO%20Unit%20%3A%3D%0A%20%20let%20(fst%2C%20snd)%20%3A%3D%20goldbach%20n%0A%20%20if%20fst%20%2B%20snd%20%E2%89%A0%20n%20then%0A%20%20%20%20throw%20%3C%7C%20.userError%20s!%22failed%3A%20%7Bfst%7D%20%2B%20%7Bsnd%7D%20%E2%89%A0%20%7Bn%7D%22%0A%20%20else%20if%20!%20fst.isPrime%20%7C%7C%20!%20snd.isPrime%20then%0A%20%20%20%20throw%20%3C%7C%20.userError%20s!%22failed%3A%20%7Bfst%7D%20and%20%7Bsnd%7D%20must%20be%20prime.%22%0A%20%20else%0A%20%20%20%20IO.println%20s!%22ok!%20%7Bn%7D%20%3D%20%7Bfst%7D%20%2B%20%7Bsnd%7D%22%0A%0A%23eval%20goldbachTest%2014%0A%0A%23eval%20goldbachTest%20308%0A%0A%23eval%20goldbachTest%20308000%0A%0A%23eval%20goldbachTest%2019278020%0A%0Aend%20Problem40%0A
-/

def _root_.Nat.isPrime (n : Nat) : Bool := Id.run do
  if n < 2 then
    return false
  for d in [2:n] do
    if n % d = 0 then
      return false
    if d ^ 2 > n then
      break
  return true

-- You can use this!
#check Nat.isPrime

def goldbach (n : Nat) : Nat × Nat := Id.run do
  -- sorry
  if n % 2 ≠ 0 then
    panic! "n must be an even number"

  for cand in [2:n] do
    if not cand.isPrime then
      continue
    let rest := n - cand
    if not rest.isPrime then
      continue
    return (cand, rest)

  panic! "we've found a counter example of goldbach conjecture!!"
  -- sorry

-- The following codes are for test and you should not edit these.

def goldbachTest (n : Nat) : IO Unit :=
  let (fst, snd) := goldbach n
  if fst + snd ≠ n then
    throw <| .userError s!"failed: {fst} + {snd} ≠ {n}"
  else if ! fst.isPrime || ! snd.isPrime then
    throw <| .userError s!"failed: {fst} and {snd} must be prime."
  else
    IO.println s!"ok! {n} = {fst} + {snd}"

#eval goldbachTest 14

#eval goldbachTest 308

#eval goldbachTest 308000

#eval goldbachTest 19278020

end Problem40

namespace Problem41
/- # Problem 41

(Intermediate) A list of even numbers and their Goldbach compositions in a given range.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem41%0A%2F-%20%23%20Problem%2041%0A%0A(Intermediate)%20A%20list%20of%20even%20numbers%20and%20their%20Goldbach%20compositions%20in%20a%20given%20range.%0A-%2F%0A%0A--%20%60Nat.isPrime%60%20is%20defined%20in%20Problem%2040.%0A%0Adef%20goldbach%20(n%20%3A%20Nat)%20%3A%20Nat%20%C3%97%20Nat%20%3A%3D%20Id.run%20do%0A%20%20for%20cand%20in%20%5B2%3An%5D%20do%0A%20%20%20%20if%20not%20cand.isPrime%20then%0A%20%20%20%20%20%20continue%0A%20%20%20%20let%20rest%20%3A%3D%20n%20-%20cand%0A%20%20%20%20if%20not%20rest.isPrime%20then%0A%20%20%20%20%20%20continue%0A%20%20%20%20return%20(cand%2C%20rest)%0A%0A%20%20panic!%20%22we've%20found%20a%20counter%20example%20of%20goldbach%20conjecture!!%22%0A%0Adef%20goldbachList%20(lower%20upper%20%3A%20Nat)%20(primeLower%20%3A%20Nat%20%3A%3D%202)%20%3A%20List%20(Nat%20%C3%97%20Nat)%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0A%23guard%20goldbachList%209%2020%20%3D%3D%20%5B(3%2C%207)%2C%20(5%2C%207)%2C%20(3%2C%2011)%2C%20(3%2C%2013)%2C%20(5%2C%2013)%2C%20(3%2C%2017)%5D%0A%0A%23guard%20goldbachList%209%2020%203%20%3D%3D%20%5B(5%2C%207)%2C%20(5%2C%2013)%5D%0A%0A%23guard%20goldbachList%204%202000%2050%20%3D%3D%20%5B(73%2C919)%2C(61%2C1321)%2C(67%2C1789)%2C(61%2C1867)%5D%0A%0Aend%20Problem41%0A
-/

-- `Nat.isPrime` is defined in Problem 40.

def goldbach (n : Nat) : Nat × Nat := Id.run do
  for cand in [2:n] do
    if not cand.isPrime then
      continue
    let rest := n - cand
    if not rest.isPrime then
      continue
    return (cand, rest)

  panic! "we've found a counter example of goldbach conjecture!!"

def goldbachList (lower upper : Nat) (primeLower : Nat := 2) : List (Nat × Nat) :=
  -- sorry
  List.range (upper + 1)
    |>.filter (· ≥ lower)
    |>.filter (· % 2 == 0)
    |>.map (fun n => (goldbach n))
    |>.filter (fun t => t.fst > primeLower)
  -- sorry

-- The following codes are for test and you should not edit these.

#guard goldbachList 9 20 == [(3, 7), (5, 7), (3, 11), (3, 13), (5, 13), (3, 17)]

#guard goldbachList 9 20 3 == [(5, 7), (5, 13)]

#guard goldbachList 4 2000 50 == [(73,919),(61,1321),(67,1789),(61,1867)]

end Problem41

namespace Problem46
/- # Problem 46
(Intermediate) Truth tables for logical expressions.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem46%0A%2F-%20%23%20Problem%2046%0A(Intermediate)%20Truth%20tables%20for%20logical%20expressions.%0A-%2F%0A%0A%0Adef%20table%20(p%20%3A%20Bool%20%E2%86%92%20Bool%20%E2%86%92%20Bool)%20%3A%20List%20(List%20Bool)%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0A%23guard%20table%20(fun%20a%20b%20%3D%3E%20And%20a%20(Or%20a%20b))%20%3D%3D%0A%20%20%5B%0A%20%20%20%20%5Btrue%2C%20true%2C%20true%5D%2C%0A%20%20%20%20%5Btrue%2C%20false%2C%20true%5D%2C%0A%20%20%20%20%5Bfalse%2C%20true%2C%20false%5D%2C%0A%20%20%20%20%5Bfalse%2C%20false%2C%20false%5D%0A%20%20%5D%0A%0Aend%20Problem46%0A
-/


def table (p : Bool → Bool → Bool) : List (List Bool) :=
  -- sorry
  [
    [true, true, p true true],
    [true, false, p true false],
    [false, true, p false true],
    [false, false, p false false]
  ]
  -- sorry

-- The following codes are for test and you should not edit these.

#guard table (fun a b => And a (Or a b)) ==
  [
    [true, true, true],
    [true, false, true],
    [false, true, false],
    [false, false, false]
  ]

end Problem46

namespace Problem47
/- # Problem 47
(Easy) Truth tables for logical expressions (part 2).

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem47%0A%2F-%20%23%20Problem%2047%0A(Easy)%20Truth%20tables%20for%20logical%20expressions%20(part%202).%0A-%2F%0A%0Adef%20table%20(p%20%3A%20Bool%20%E2%86%92%20Bool%20%E2%86%92%20Bool)%20%3A%20List%20(List%20Bool)%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0A%23guard%20table%20(fun%20a%20b%20%3D%3E%20a%20%26%26%20(a%20%7C%7C%20b))%20%3D%3D%0A%20%20%5B%0A%20%20%20%20%5Btrue%2C%20true%2C%20true%5D%2C%0A%20%20%20%20%5Btrue%2C%20false%2C%20true%5D%2C%0A%20%20%20%20%5Bfalse%2C%20true%2C%20false%5D%2C%0A%20%20%20%20%5Bfalse%2C%20false%2C%20false%5D%0A%20%20%5D%0A%0Aend%20Problem47%0A
-/

def table (p : Bool → Bool → Bool) : List (List Bool) :=
  -- sorry
  [
    [true, true, p true true],
    [true, false, p true false],
    [false, true, p false true],
    [false, false, p false false]
  ]
  -- sorry

-- The following codes are for test and you should not edit these.

#guard table (fun a b => a && (a || b)) ==
  [
    [true, true, true],
    [true, false, true],
    [false, true, false],
    [false, false, false]
  ]

end Problem47

namespace Problem48
/- # Problem 48
(Easy) Truth tables for logical expressions (part 3).

Generalize Problem 47 in such a way that the logical expression may contain any number of logical variables. Define table/2 in a way that table(List,Expr) prints the truth table for the expression Expr, which contains the logical variables enumerated in List.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem48%0A%2F-%20%23%20Problem%2048%0A(Easy)%20Truth%20tables%20for%20logical%20expressions%20(part%203).%0A%0AGeneralize%20Problem%2047%20in%20such%20a%20way%20that%20the%20logical%20expression%20may%20contain%20any%20number%20of%20logical%20variables.%20Define%20table%2F2%20in%20a%20way%20that%20table(List%2CExpr)%20prints%20the%20truth%20table%20for%20the%20expression%20Expr%2C%20which%20contains%20the%20logical%20variables%20enumerated%20in%20List.%0A-%2F%0Auniverse%20u%0A%0Anamespace%20ListMonad%0A%0A%2F--%20monad%20instance%20of%20%60List%60%20-%2F%0Ascoped%20instance%20%3A%20Monad%20List.%7Bu%7D%20where%0A%20%20pure%20%3A%3D%20List.singleton%0A%20%20bind%20xs%20f%20%3A%3D%20xs.flatMap%20f%0A%20%20map%20%3A%3D%20List.map%0A%0Aend%20ListMonad%0A%0Aopen%20scoped%20ListMonad%0A%0Adef%20Arity%20%3A%20(n%20%3A%20Nat)%20%E2%86%92%20Type%0A%20%20%7C%200%20%3D%3E%20Bool%0A%20%20%7C%20n%20%2B%201%20%3D%3E%20Bool%20%E2%86%92%20Arity%20n%0A%0Adef%20tablen%20(n%20%3A%20Nat)%20(p%20%3A%20Arity%20n)%20%3A%20List%20(List%20Bool)%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0A%23guard%20tablen%201%20(fun%20a%20%3D%3E%20a)%20%3D%20%5B%5Btrue%2C%20true%5D%2C%20%5Bfalse%2C%20false%5D%5D%0A%0A%23guard%20tablen%202%20(fun%20a%20b%20%3D%3E%20a%20%26%26%20b)%20%3D%20%5B%0A%20%20%5Btrue%2C%20true%2C%20true%5D%2C%0A%20%20%5Btrue%2C%20false%2C%20false%5D%2C%0A%20%20%5Bfalse%2C%20true%2C%20false%5D%2C%0A%20%20%5Bfalse%2C%20false%2C%20false%5D%0A%5D%0A%0A%23guard%20tablen%202%20(fun%20a%20b%20%3D%3E%20!a%20%7C%7C%20b)%20%3D%20%5B%0A%20%20%5Btrue%2C%20true%2C%20true%5D%2C%0A%20%20%5Btrue%2C%20false%2C%20false%5D%2C%0A%20%20%5Bfalse%2C%20true%2C%20true%5D%2C%0A%20%20%5Bfalse%2C%20false%2C%20true%5D%0A%5D%0A%0A%23guard%20tablen%203%20(fun%20a%20b%20c%20%3D%3E%20a%20%26%26%20b%20%26%26%20c)%20%3D%20%5B%0A%20%20%5Btrue%2C%20true%2C%20true%2C%20true%5D%2C%0A%20%20%5Btrue%2C%20true%2C%20false%2C%20false%5D%2C%0A%20%20%5Btrue%2C%20false%2C%20true%2C%20false%5D%2C%0A%20%20%5Btrue%2C%20false%2C%20false%2C%20false%5D%2C%0A%20%20%5Bfalse%2C%20true%2C%20true%2C%20false%5D%2C%0A%20%20%5Bfalse%2C%20true%2C%20false%2C%20false%5D%2C%0A%20%20%5Bfalse%2C%20false%2C%20true%2C%20false%5D%2C%0A%20%20%5Bfalse%2C%20false%2C%20false%2C%20false%5D%0A%5D%0A%0Aend%20Problem48%0A
-/
universe u

namespace ListMonad

/-- monad instance of `List` -/
scoped instance : Monad List.{u} where
  pure := List.singleton
  bind xs f := xs.flatMap f
  map := List.map

end ListMonad

open scoped ListMonad

def Arity : (n : Nat) → Type
  | 0 => Bool
  | n + 1 => Bool → Arity n

def tablen (n : Nat) (p : Arity n) : List (List Bool) :=
  -- sorry
  match n with
  | 0 => [[p]]
  | n + 1 => do
    let b ← [true, false]
    let result ← tablen n (p b) |>.map (b :: ·)
    return result
  -- sorry

-- The following codes are for test and you should not edit these.

#guard tablen 1 (fun a => a) = [[true, true], [false, false]]

#guard tablen 2 (fun a b => a && b) = [
  [true, true, true],
  [true, false, false],
  [false, true, false],
  [false, false, false]
]

#guard tablen 2 (fun a b => !a || b) = [
  [true, true, true],
  [true, false, false],
  [false, true, true],
  [false, false, true]
]

#guard tablen 3 (fun a b c => a && b && c) = [
  [true, true, true, true],
  [true, true, false, false],
  [true, false, true, false],
  [true, false, false, false],
  [false, true, true, false],
  [false, true, false, false],
  [false, false, true, false],
  [false, false, false, false]
]

end Problem48

namespace Problem49
/- # Problem 49
(Intermediate) Gray codes.

An n-bit Gray code is a sequence of n-bit strings constructed according to certain rules. For example,

```
n = 1: C(1) = ['0','1'].
n = 2: C(2) = ['00','01','11','10'].
n = 3: C(3) = ['000','001','011','010','110','111','101','100'].
```

Find out the construction rules and write a predicate with the following specification:

```
% gray(N,C) :- C is the N-bit Gray code
```

Can you apply the method of "result caching" in order to make the predicate more efficient, when it is to be used repeatedly?

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem49%0A%2F-%20%23%20Problem%2049%0A(Intermediate)%20Gray%20codes.%0A%0AAn%20n-bit%20Gray%20code%20is%20a%20sequence%20of%20n-bit%20strings%20constructed%20according%20to%20certain%20rules.%20For%20example%2C%0A%0A%60%60%60%0An%20%3D%201%3A%20C(1)%20%3D%20%5B'0'%2C'1'%5D.%0An%20%3D%202%3A%20C(2)%20%3D%20%5B'00'%2C'01'%2C'11'%2C'10'%5D.%0An%20%3D%203%3A%20C(3)%20%3D%20%5B'000'%2C'001'%2C'011'%2C'010'%2C'110'%2C'111'%2C'101'%2C'100'%5D.%0A%60%60%60%0A%0AFind%20out%20the%20construction%20rules%20and%20write%20a%20predicate%20with%20the%20following%20specification%3A%0A%0A%60%60%60%0A%25%20gray(N%2CC)%20%3A-%20C%20is%20the%20N-bit%20Gray%20code%0A%60%60%60%0A%0ACan%20you%20apply%20the%20method%20of%20%22result%20caching%22%20in%20order%20to%20make%20the%20predicate%20more%20efficient%2C%20when%20it%20is%20to%20be%20used%20repeatedly%3F%0A-%2F%0A%0Ainductive%20Digit%20%3A%20Type%20where%0A%20%20%7C%20zero%0A%20%20%7C%20one%0Aderiving%20DecidableEq%0A%0Aabbrev%20GrayCode%20%3A%3D%20List%20Digit%0A%0Adef%20Digit.toString%20%3A%20Digit%20%E2%86%92%20String%0A%20%20%7C%20.zero%20%3D%3E%20%220%22%0A%20%20%7C%20.one%20%3D%3E%20%221%22%0A%0Ainstance%20%3A%20OfNat%20Digit%200%20where%0A%20%20ofNat%20%3A%3D%20Digit.zero%0A%0Ainstance%20%3A%20OfNat%20Digit%201%20where%0A%20%20ofNat%20%3A%3D%20Digit.one%0A%0Ainstance%20%3A%20ToString%20Digit%20where%0A%20%20toString%20%3A%3D%20Digit.toString%0A%0Adef%20gray%20(n%20%3A%20Nat)%20%3A%20List%20GrayCode%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0A%23guard%20gray%201%20%3D%20%5B%5B0%5D%2C%20%5B1%5D%5D%0A%0A%23guard%20gray%202%20%3D%20%5B%5B0%2C%200%5D%2C%20%5B0%2C%201%5D%2C%20%5B1%2C%201%5D%2C%20%5B1%2C%200%5D%5D%0A%0A%23guard%20gray%203%20%3D%20%5B%0A%20%20%5B0%2C%200%2C%200%5D%2C%0A%20%20%5B0%2C%200%2C%201%5D%2C%0A%20%20%5B0%2C%201%2C%201%5D%2C%0A%20%20%5B0%2C%201%2C%200%5D%2C%0A%20%20%5B1%2C%201%2C%200%5D%2C%0A%20%20%5B1%2C%201%2C%201%5D%2C%0A%20%20%5B1%2C%200%2C%201%5D%2C%0A%20%20%5B1%2C%200%2C%200%5D%0A%5D%0A%0Aend%20Problem49%0A
-/

inductive Digit : Type where
  | zero
  | one
deriving DecidableEq

abbrev GrayCode := List Digit

def Digit.toString : Digit → String
  | .zero => "0"
  | .one => "1"

instance : OfNat Digit 0 where
  ofNat := Digit.zero

instance : OfNat Digit 1 where
  ofNat := Digit.one

instance : ToString Digit where
  toString := Digit.toString

def gray (n : Nat) : List GrayCode :=
  -- sorry
  match n with
  | 0 => []
  | 1 => [[.zero], [.one]]
  | n + 1 =>
    let prev := gray n
    let revPrev := prev.reverse
    (prev.map (fun d => Digit.zero :: d)) ++ (revPrev.map (fun d => Digit.one :: d))
  -- sorry

-- The following codes are for test and you should not edit these.

#guard gray 1 = [[0], [1]]

#guard gray 2 = [[0, 0], [0, 1], [1, 1], [1, 0]]

#guard gray 3 = [
  [0, 0, 0],
  [0, 0, 1],
  [0, 1, 1],
  [0, 1, 0],
  [1, 1, 0],
  [1, 1, 1],
  [1, 0, 1],
  [1, 0, 0]
]

end Problem49

namespace Problem50
/- # Problem 50
(Hard) Huffman codes.

We suppose a set of symbols with their frequencies, given as a list of `fr(S,F)` terms.

Example: `[fr(a,45), fr(b,13), fr(c,12), fr(d,16), fr(e,9), fr(f,5)]`.

Our objective is to construct a list `hc(S,C)` terms, where `C` is the Huffman code word for the symbol `S`.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem50%0A%2F-%20%23%20Problem%2050%0A(Hard)%20Huffman%20codes.%0A%0AWe%20suppose%20a%20set%20of%20symbols%20with%20their%20frequencies%2C%20given%20as%20a%20list%20of%20%60fr(S%2CF)%60%20terms.%0A%0AExample%3A%20%60%5Bfr(a%2C45)%2C%20fr(b%2C13)%2C%20fr(c%2C12)%2C%20fr(d%2C16)%2C%20fr(e%2C9)%2C%20fr(f%2C5)%5D%60.%0A%0AOur%20objective%20is%20to%20construct%20a%20list%20%60hc(S%2CC)%60%20terms%2C%20where%20%60C%60%20is%20the%20Huffman%20code%20word%20for%20the%20symbol%20%60S%60.%0A-%2F%0A%0A%2F--%20Insert%20an%20element%20in%20a%20way%20that%0Adoes%20not%20break%20the%20order%20of%20the%20sorted%20list.%20-%2F%0Adef%20orderedInsert%20%7B%CE%B1%20%3A%20Type%7D%20%5BOrd%20%CE%B1%5D%20(a%20%3A%20%CE%B1)%20%3A%20List%20%CE%B1%20%E2%86%92%20List%20%CE%B1%0A%20%20%7C%20%5B%5D%20%3D%3E%20%5Ba%5D%0A%20%20%7C%20b%20%3A%3A%20l%20%3D%3E%0A%20%20%20%20match%20compare%20a%20b%20with%0A%20%20%20%20%7C%20.lt%20%3D%3E%20a%20%3A%3A%20b%20%3A%3A%20l%0A%20%20%20%20%7C%20_%20%3D%3E%20b%20%3A%3A%20orderedInsert%20a%20l%0A%0A%2F--%20insertion%20sort%20-%2F%0Adef%20insertionSort%20%7B%CE%B1%20%3A%20Type%7D%20%5BOrd%20%CE%B1%5D%20%3A%20List%20%CE%B1%20%E2%86%92%20List%20%CE%B1%0A%20%20%7C%20%5B%5D%20%3D%3E%20%5B%5D%0A%20%20%7C%20b%20%3A%3A%20l%20%3D%3E%20orderedInsert%20b%20(insertionSort%20l)%0A%0A--%20You%20can%20use%20this!%0A%23check%20insertionSort%0A%0A%0A%2F--%20Huffman%20Tree%20-%2F%0Ainductive%20HuffTree%20where%0A%20%20%7C%20node%20(left%20%3A%20HuffTree)%20(right%20%3A%20HuffTree)%20(weight%20%3A%20Nat)%0A%20%20%7C%20Leaf%20(c%20%3A%20Char)%20(weight%20%3A%20Nat)%0Aderiving%20Inhabited%2C%20Repr%0A%0Adef%20HuffTree.weight%20%3A%20HuffTree%20%E2%86%92%20Nat%0A%20%20%7C%20Leaf%20_%20w%20%3D%3E%20w%0A%20%20%7C%20node%20_%20_%20w%20%3D%3E%20w%0A%0Adef%20HuffTree.compare%20(s%20s'%20%3A%20HuffTree)%20%3A%20Ordering%20%3A%3D%0A%20%20let%20w%20%3A%3D%20s.weight%0A%20%20let%20w'%20%3A%3D%20s'.weight%0A%20%20Ord.compare%20w%20w'%0A%0Ainstance%20%3A%20Ord%20HuffTree%20where%0A%20%20compare%20%3A%3D%20HuffTree.compare%0A%0Adef%20HuffTree.sort%20(trees%20%3A%20List%20HuffTree)%20%3A%20List%20HuffTree%20%3A%3D%20insertionSort%20trees%0A%0A--%23--%0Adef%20_root_.String.freq%20(s%20%3A%20String)%20(c%20%3A%20Char)%20%3A%3D%20s.toList.filter%20(%C2%B7%20%3D%3D%20c)%20%7C%3E.length%0A%0Adef%20_root_.String.toLeaves%20(s%20%3A%20String)%20%3A%20List%20HuffTree%20%3A%3D%0A%20%20let%20allChars%20%3A%20List%20Char%20%3A%3D%20s.toList.eraseDups%0A%20%20allChars.map%20fun%20c%20%3D%3E%20HuffTree.Leaf%20c%20(s.freq%20c)%0A%0Apartial%20def%20HuffTree.merge%20(trees%20%3A%20List%20HuffTree)%20%3A%20List%20HuffTree%20%3A%3D%0A%20%20let%20sorted%20%3A%3D%20HuffTree.sort%20trees%0A%20%20match%20sorted%20with%0A%20%20%7C%20%5B%5D%20%3D%3E%20%5B%5D%0A%20%20%7C%20%5Btree%5D%20%3D%3E%20%5Btree%5D%0A%20%20%7C%20t1%20%3A%3A%20t2%20%3A%3A%20rest%20%3D%3E%0A%20%20%20%20let%20t'%20%3A%3D%20HuffTree.node%20t1%20t2%20(t1.weight%20%2B%20t2.weight)%0A%20%20%20%20HuffTree.merge%20(t'%20%3A%3A%20rest)%0A%0A--%20This%20function%20is%20not%20used%20in%20the%20solution%0Adef%20HuffTree.ofString%20(msg%20%3A%20String)%20%3A%20HuffTree%20%3A%3D%0A%20%20msg.toLeaves%20%7C%3E%20HuffTree.merge%20%7C%3E.head!%0A--%23--%0Aabbrev%20Code%20%3A%3D%20String%0A--%23--%0Adef%20HuffTree.encode%20(c%20%3A%20Char)%20%3A%20HuffTree%20%E2%86%92%20Option%20Code%0A%20%20%7C%20.Leaf%20c'%20_%20%3D%3E%20if%20c%20%3D%20c'%20then%20some%20%22%22%20else%20none%0A%20%20%7C%20.node%20l%20r%20_w%20%3D%3E%0A%20%20%20%20match%20l.encode%20c%2C%20r.encode%20c%20with%0A%20%20%20%20%7C%20none%2C%20some%20s%20%3D%3E%20some%20(%221%22%20%2B%2B%20s)%0A%20%20%20%20%7C%20some%20s%2C%20none%20%3D%3E%20some%20(%220%22%20%2B%2B%20s)%0A%20%20%20%20%7C%20_%2C%20_%20%3D%3E%20none%0A--%23--%0A%0Adef%20huffman%20(input%20%3A%20List%20(Char%20%C3%97%20Nat))%20%3A%20List%20(Char%20%C3%97%20Code)%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0A%23guard%20huffman%20%5B('a'%2C%2045)%2C('b'%2C%2013)%2C('c'%2C%2012)%2C('d'%2C%2016)%2C('e'%2C%209)%2C('f'%2C%205)%5D%20%3D%0A%20%20%5B('a'%2C%20%220%22)%2C('b'%2C%20%22101%22)%2C('c'%2C%20%22100%22)%2C('d'%2C%20%22111%22)%2C('e'%2C%20%221101%22)%2C('f'%2C%20%221100%22)%5D%0A%0A%23guard%20huffman%20%5B('B'%2C%207)%2C('C'%2C%206)%2C('A'%2C%203)%2C('D'%2C%201)%2C('E'%2C%201)%2C%5D%20%3D%0A%20%20%5B('B'%2C%20%220%22)%2C%20('C'%2C%20%2211%22)%2C%20('A'%2C%20%22101%22)%2C%20('D'%2C%20%221001%22)%2C%20('E'%2C%20%221000%22)%5D%0A%0Aend%20Problem50%0A
-/

/-- Insert an element in a way that
does not break the order of the sorted list. -/
def orderedInsert {α : Type} [Ord α] (a : α) : List α → List α
  | [] => [a]
  | b :: l =>
    match compare a b with
    | .lt => a :: b :: l
    | _ => b :: orderedInsert a l

/-- insertion sort -/
def insertionSort {α : Type} [Ord α] : List α → List α
  | [] => []
  | b :: l => orderedInsert b (insertionSort l)

-- You can use this!
#check insertionSort


/-- Huffman Tree -/
inductive HuffTree where
  | node (left : HuffTree) (right : HuffTree) (weight : Nat)
  | Leaf (c : Char) (weight : Nat)
deriving Inhabited, Repr

def HuffTree.weight : HuffTree → Nat
  | Leaf _ w => w
  | node _ _ w => w

def HuffTree.compare (s s' : HuffTree) : Ordering :=
  let w := s.weight
  let w' := s'.weight
  Ord.compare w w'

instance : Ord HuffTree where
  compare := HuffTree.compare

def HuffTree.sort (trees : List HuffTree) : List HuffTree := insertionSort trees

--#--
def _root_.String.freq (s : String) (c : Char) := s.toList.filter (· == c) |>.length

def _root_.String.toLeaves (s : String) : List HuffTree :=
  let allChars : List Char := s.toList.eraseDups
  allChars.map fun c => HuffTree.Leaf c (s.freq c)

partial def HuffTree.merge (trees : List HuffTree) : List HuffTree :=
  let sorted := HuffTree.sort trees
  match sorted with
  | [] => []
  | [tree] => [tree]
  | t1 :: t2 :: rest =>
    let t' := HuffTree.node t1 t2 (t1.weight + t2.weight)
    HuffTree.merge (t' :: rest)

-- This function is not used in the solution
def HuffTree.ofString (msg : String) : HuffTree :=
  msg.toLeaves |> HuffTree.merge |>.head!
--#--
abbrev Code := String
--#--
def HuffTree.encode (c : Char) : HuffTree → Option Code
  | .Leaf c' _ => if c = c' then some "" else none
  | .node l r _w =>
    match l.encode c, r.encode c with
    | none, some s => some ("1" ++ s)
    | some s, none => some ("0" ++ s)
    | _, _ => none
--#--

def huffman (input : List (Char × Nat)) : List (Char × Code) :=
  -- sorry
  let leaves : List HuffTree := input.map (fun (c, w) => HuffTree.Leaf c w)
  let tree : HuffTree := HuffTree.merge leaves |>.head!
  input.map (fun (c, _) => (c, tree.encode c |>.get!))
  -- sorry

-- The following codes are for test and you should not edit these.

#guard huffman [('a', 45),('b', 13),('c', 12),('d', 16),('e', 9),('f', 5)] =
  [('a', "0"),('b', "101"),('c', "100"),('d', "111"),('e', "1101"),('f', "1100")]

#guard huffman [('B', 7),('C', 6),('A', 3),('D', 1),('E', 1),] =
  [('B', "0"), ('C', "11"), ('A', "101"), ('D', "1001"), ('E', "1000")]

end Problem50

namespace Problem55
/- # Problem 55
(Intermediate) Construct completely balanced binary trees.

In a completely balanced binary tree, the following property holds for every node: The number of nodes in its left subtree and the number of nodes in its right subtree are almost equal, which means their difference is not greater than one.

Write a function `cbalTree` to construct completely balanced binary trees for a given number of nodes. The predicate should generate all solutions via backtracking.

> **warning**
>
> A completely balanced binary tree is not the same as a (hight) balanced binary tree.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem55%0A%2F-%20%23%20Problem%2055%0A(Intermediate)%20Construct%20completely%20balanced%20binary%20trees.%0A%0AIn%20a%20completely%20balanced%20binary%20tree%2C%20the%20following%20property%20holds%20for%20every%20node%3A%20The%20number%20of%20nodes%20in%20its%20left%20subtree%20and%20the%20number%20of%20nodes%20in%20its%20right%20subtree%20are%20almost%20equal%2C%20which%20means%20their%20difference%20is%20not%20greater%20than%20one.%0A%0AWrite%20a%20function%20%60cbalTree%60%20to%20construct%20completely%20balanced%20binary%20trees%20for%20a%20given%20number%20of%20nodes.%20The%20predicate%20should%20generate%20all%20solutions%20via%20backtracking.%0A%0A%3E%20**warning**%0A%3E%0A%3E%20A%20completely%20balanced%20binary%20tree%20is%20not%20the%20same%20as%20a%20(hight)%20balanced%20binary%20tree.%0A-%2F%0A%0Ainductive%20BinTree%20(%CE%B1%20%3A%20Type)%20where%0A%20%20%7C%20empty%20%3A%20BinTree%20%CE%B1%0A%20%20%7C%20node%20%3A%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%0Aderiving%20Repr%0A%0Adef%20leaf%20%7B%CE%B1%20%3A%20Type%7D%20(a%20%3A%20%CE%B1)%20%3A%20BinTree%20%CE%B1%20%3A%3D%20.node%20a%20.empty%20.empty%0A%0Adef%20BinTree.nodes%20%7B%CE%B1%20%3A%20Type%7D%20%3A%20BinTree%20%CE%B1%20%E2%86%92%20Nat%0A%7C%20.empty%20%3D%3E%200%0A%7C%20.node%20_%20l%20r%20%3D%3E%201%20%2B%20l.nodes%20%2B%20r.nodes%0A%0Adef%20BinTree.isCBalanced%20%7B%CE%B1%20%3A%20Type%7D%20%3A%20BinTree%20%CE%B1%20%E2%86%92%20Bool%0A%20%20%7C%20.empty%20%3D%3E%20true%0A%20%20%7C%20.node%20_%20l%20r%20%3D%3E%0A%20%20%20%20Int.natAbs%20((l.nodes%20%3A%20Int)%20-%20(r.nodes%20%3A%20Int))%20%E2%89%A4%201%20%26%26%20l.isCBalanced%20%26%26%20r.isCBalanced%0A%0Anamespace%20ListMonad%0A%0A%2F--%20monad%20instance%20of%20%60List%60%20-%2F%0Ascoped%20instance%20%3A%20Monad%20List%20where%0A%20%20pure%20%3A%3D%20List.singleton%0A%20%20bind%20xs%20f%20%3A%3D%20xs.flatMap%20f%0A%20%20map%20%3A%3D%20List.map%0A%0Aend%20ListMonad%0A%0Aopen%20scoped%20ListMonad%0A%0A%2F--%20construct%20all%20completely%20balanced%20binary%20trees%20which%20contains%20%60x%60%20elements%20-%2F%0Apartial%20def%20cbalTree%20(x%20%3A%20Nat)%20%3A%20List%20(BinTree%20Unit)%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0A%23eval%20(cbalTree%203).length%20%3D%201%0A%23eval%20(cbalTree%203)%7C%3E.map%20BinTree.isCBalanced%20%7C%3E.and%0A%23eval%20(cbalTree%204)%7C%3E.map%20BinTree.isCBalanced%20%7C%3E.and%0A%23eval%20(cbalTree%204).length%20%3D%204%0A%23eval%20(cbalTree%205)%7C%3E.map%20BinTree.isCBalanced%20%7C%3E.and%0A%23eval%20(cbalTree%206)%7C%3E.map%20BinTree.isCBalanced%20%7C%3E.and%0A%23eval%20(cbalTree%207).length%20%3D%201%0A%0Aend%20Problem55%0A
-/

inductive BinTree (α : Type) where
  | empty : BinTree α
  | node : α → BinTree α → BinTree α → BinTree α
deriving Repr

def leaf {α : Type} (a : α) : BinTree α := .node a .empty .empty

def BinTree.nodes {α : Type} : BinTree α → Nat
| .empty => 0
| .node _ l r => 1 + l.nodes + r.nodes

def BinTree.isCBalanced {α : Type} : BinTree α → Bool
  | .empty => true
  | .node _ l r =>
    Int.natAbs ((l.nodes : Int) - (r.nodes : Int)) ≤ 1 && l.isCBalanced && r.isCBalanced

namespace ListMonad

/-- monad instance of `List` -/
scoped instance : Monad List where
  pure := List.singleton
  bind xs f := xs.flatMap f
  map := List.map

end ListMonad

open scoped ListMonad

/-- construct all completely balanced binary trees which contains `x` elements -/
partial def cbalTree (x : Nat) : List (BinTree Unit) :=
  -- sorry
  match x with
  | 0 => [.empty]
  | n + 1 => do
    let q := n / 2
    let r := n % 2
    let indices := List.range (q+r+1) |>.drop q
    let i ← indices
    let left ← cbalTree i
    let right ← cbalTree (n - i)
    pure (BinTree.node () left right)
  -- sorry

-- The following codes are for test and you should not edit these.

#eval (cbalTree 3).length = 1
#eval (cbalTree 3)|>.map BinTree.isCBalanced |>.and
#eval (cbalTree 4)|>.map BinTree.isCBalanced |>.and
#eval (cbalTree 4).length = 4
#eval (cbalTree 5)|>.map BinTree.isCBalanced |>.and
#eval (cbalTree 6)|>.map BinTree.isCBalanced |>.and
#eval (cbalTree 7).length = 1

end Problem55

namespace Problem56
/- # Problem 56

Let us call a binary tree symmetric if you can draw a vertical line through the root node and then the right subtree is the mirror image of the left subtree. Write a predicate symmetric/1 to check whether a given binary tree is symmetric. Hint: Write a predicate mirror/2 first to check whether one tree is the mirror image of another. We are only interested in the structure, not in the contents of the nodes.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem56%0A%2F-%20%23%20Problem%2056%0A%0ALet%20us%20call%20a%20binary%20tree%20symmetric%20if%20you%20can%20draw%20a%20vertical%20line%20through%20the%20root%20node%20and%20then%20the%20right%20subtree%20is%20the%20mirror%20image%20of%20the%20left%20subtree.%20Write%20a%20predicate%20symmetric%2F1%20to%20check%20whether%20a%20given%20binary%20tree%20is%20symmetric.%20Hint%3A%20Write%20a%20predicate%20mirror%2F2%20first%20to%20check%20whether%20one%20tree%20is%20the%20mirror%20image%20of%20another.%20We%20are%20only%20interested%20in%20the%20structure%2C%20not%20in%20the%20contents%20of%20the%20nodes.%0A-%2F%0A%0Ainductive%20BinTree%20(%CE%B1%20%3A%20Type)%20where%0A%20%20%7C%20empty%20%3A%20BinTree%20%CE%B1%0A%20%20%7C%20node%20%3A%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%0Aderiving%20Repr%0A%0Adef%20leaf%20%7B%CE%B1%20%3A%20Type%7D%20(a%20%3A%20%CE%B1)%20%3A%20BinTree%20%CE%B1%20%3A%3D%20.node%20a%20.empty%20.empty%0A%0A%2F--%20This%20is%20used%20to%20display%20%60%23check%60%20results%20-%2F%0A%40%5Bapp_unexpander%20BinTree.node%5D%0Adef%20leaf.unexpander%20%3A%20Lean.PrettyPrinter.Unexpander%0A%20%20%7C%20%60(%24_%20%24a%20BinTree.empty%20BinTree.empty)%20%3D%3E%20%60(leaf%20%24a)%0A%20%20%7C%20_%20%3D%3E%20throw%20()%0A%0A%2F--%20Use%20%60leaf%60%20to%20display%20%60%23eval%60%20results%20-%2F%0Adef%20BinTree.toString%20%7B%CE%B1%20%3A%20Type%7D%20%5BToString%20%CE%B1%5D%20(t%20%3A%20BinTree%20%CE%B1)%20%3A%20String%20%3A%3D%0A%20%20match%20t%20with%0A%20%20%7C%20.node%20v%20.empty%20.empty%20%3D%3E%20s!%22leaf%20%7Bv%7D%22%0A%20%20%7C%20.node%20v%20l%20r%20%3D%3E%20s!%22BinTree.node%20%7Bv%7D%20(%7BtoString%20l%7D)%20(%7BtoString%20r%7D)%22%0A%20%20%7C%20.empty%20%3D%3E%20%22empty%22%0A%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%0A%0Adef%20BinTree.mirror%20(s%20t%20%3A%20BinTree%20%CE%B1)%20%3A%20Bool%20%3A%3D%0A%20%20sorry%0A%0Adef%20BinTree.isSymmetric%20(t%20%3A%20BinTree%20%CE%B1)%20%3A%20Bool%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0A%23guard%20BinTree.isSymmetric%20(leaf%20'x')%0A%0A%23guard%20!%20BinTree.isSymmetric%20(BinTree.node%20'x'%20(leaf%20'x')%20BinTree.empty)%0A%0A%23guard%20BinTree.isSymmetric%20(BinTree.node%20'x'%20(leaf%20'x')%20(leaf%20'x'))%0A%0Aend%20Problem56%0A
-/

inductive BinTree (α : Type) where
  | empty : BinTree α
  | node : α → BinTree α → BinTree α → BinTree α
deriving Repr

def leaf {α : Type} (a : α) : BinTree α := .node a .empty .empty

/-- This is used to display `#check` results -/
@[app_unexpander BinTree.node]
def leaf.unexpander : Lean.PrettyPrinter.Unexpander
  | `($_ $a BinTree.empty BinTree.empty) => `(leaf $a)
  | _ => throw ()

/-- Use `leaf` to display `#eval` results -/
def BinTree.toString {α : Type} [ToString α] (t : BinTree α) : String :=
  match t with
  | .node v .empty .empty => s!"leaf {v}"
  | .node v l r => s!"BinTree.node {v} ({toString l}) ({toString r})"
  | .empty => "empty"

variable {α : Type}

def BinTree.mirror (s t : BinTree α) : Bool :=
  -- sorry
  match s, t with
  | .empty, .empty => true
  | .node _ a b, .node _ x y => mirror a y && mirror b x
  | _, _ => false
  -- sorry

def BinTree.isSymmetric (t : BinTree α) : Bool :=
  -- sorry
  match t with
  | .empty => true
  | .node _ l r => mirror l r
  -- sorry

-- The following codes are for test and you should not edit these.

#guard BinTree.isSymmetric (leaf 'x')

#guard ! BinTree.isSymmetric (BinTree.node 'x' (leaf 'x') BinTree.empty)

#guard BinTree.isSymmetric (BinTree.node 'x' (leaf 'x') (leaf 'x'))

end Problem56

namespace Problem57
/- # Problem 57

Use the predicate add/3, developed in chapter 4 of the course, to write a predicate to construct a binary search tree from a list of integer numbers.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem57%0A%2F-%20%23%20Problem%2057%0A%0AUse%20the%20predicate%20add%2F3%2C%20developed%20in%20chapter%204%20of%20the%20course%2C%20to%20write%20a%20predicate%20to%20construct%20a%20binary%20search%20tree%20from%20a%20list%20of%20integer%20numbers.%0A-%2F%0A%0Ainductive%20BinTree%20(%CE%B1%20%3A%20Type)%20where%0A%20%20%7C%20empty%20%3A%20BinTree%20%CE%B1%0A%20%20%7C%20node%20%3A%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%0A%0Adef%20leaf%20%7B%CE%B1%20%3A%20Type%7D%20(a%20%3A%20%CE%B1)%20%3A%20BinTree%20%CE%B1%20%3A%3D%20.node%20a%20.empty%20.empty%0A%0A%2F--%20This%20is%20used%20to%20display%20%60%23check%60%20results%20-%2F%0A%40%5Bapp_unexpander%20BinTree.node%5D%0Adef%20leaf.unexpander%20%3A%20Lean.PrettyPrinter.Unexpander%0A%20%20%7C%20%60(%24_%20%24a%20BinTree.empty%20BinTree.empty)%20%3D%3E%20%60(leaf%20%24a)%0A%20%20%7C%20_%20%3D%3E%20throw%20()%0A%0A%2F--%20Use%20%60leaf%60%20to%20display%20%60%23eval%60%20results%20-%2F%0Adef%20BinTree.toString%20%7B%CE%B1%20%3A%20Type%7D%20%5BToString%20%CE%B1%5D%20(t%20%3A%20BinTree%20%CE%B1)%20%3A%20String%20%3A%3D%0A%20%20match%20t%20with%0A%20%20%7C%20.node%20v%20.empty%20.empty%20%3D%3E%20s!%22leaf%20%7Bv%7D%22%0A%20%20%7C%20.node%20v%20l%20r%20%3D%3E%20s!%22BinTree.node%20%7Bv%7D%20(%7BtoString%20l%7D)%20(%7BtoString%20r%7D)%22%0A%20%20%7C%20.empty%20%3D%3E%20%22empty%22%0A%0Ainstance%20%7B%CE%B1%20%3A%20Type%7D%20%5BToString%20%CE%B1%5D%20%3A%20ToString%20(BinTree%20%CE%B1)%20%3A%3D%20%E2%9F%A8BinTree.toString%E2%9F%A9%0A%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%0A%0Ainstance%20%5BOrd%20%CE%B1%5D%20%3A%20Max%20%CE%B1%20where%0A%20%20max%20x%20y%20%3A%3D%0A%20%20%20%20match%20compare%20x%20y%20with%0A%20%20%20%20%7C%20.lt%20%3D%3E%20y%0A%20%20%20%20%7C%20_%20%3D%3E%20x%0A%0Adef%20BinTree.max%20%5BOrd%20%CE%B1%5D%20(t%20%3A%20BinTree%20%CE%B1)%20%3A%20Option%20%CE%B1%20%3A%3D%0A%20%20match%20t%20with%0A%20%20%7C%20.empty%20%3D%3E%20none%0A%20%20%7C%20.node%20v%20l%20r%20%3D%3E%0A%20%20%20%20let%20left_max%20%3A%3D%20(max%20l).getD%20v%0A%20%20%20%20let%20right_max%20%3A%3D%20(max%20r).getD%20v%0A%20%20%20%20some%20%3C%7C%20%5Bleft_max%2C%20right_max%5D.foldl%20Max.max%20v%0A%0Adef%20BinTree.searchTree%20%5BOrd%20%CE%B1%5D%20(t%20%3A%20BinTree%20%CE%B1)%20%3A%20Bool%20%3A%3D%0A%20%20sorry%0A%0Adef%20BinTree.searchTreeFromList%20%5BOrd%20%CE%B1%5D%20(xs%20%3A%20List%20%CE%B1)%20%3A%20BinTree%20%CE%B1%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0A%23guard%20BinTree.node%203%20(.node%202%20(leaf%201)%20.empty)%20(.node%205%20.empty%20(leaf%207))%20%7C%3E.searchTree%0A%0A%23guard%20BinTree.searchTreeFromList%20%5B3%2C%202%2C%205%2C%207%2C%201%5D%20%7C%3E.searchTree%0A%0Aend%20Problem57%0A
-/

inductive BinTree (α : Type) where
  | empty : BinTree α
  | node : α → BinTree α → BinTree α → BinTree α

def leaf {α : Type} (a : α) : BinTree α := .node a .empty .empty

/-- This is used to display `#check` results -/
@[app_unexpander BinTree.node]
def leaf.unexpander : Lean.PrettyPrinter.Unexpander
  | `($_ $a BinTree.empty BinTree.empty) => `(leaf $a)
  | _ => throw ()

/-- Use `leaf` to display `#eval` results -/
def BinTree.toString {α : Type} [ToString α] (t : BinTree α) : String :=
  match t with
  | .node v .empty .empty => s!"leaf {v}"
  | .node v l r => s!"BinTree.node {v} ({toString l}) ({toString r})"
  | .empty => "empty"

instance {α : Type} [ToString α] : ToString (BinTree α) := ⟨BinTree.toString⟩

variable {α : Type}

instance [Ord α] : Max α where
  max x y :=
    match compare x y with
    | .lt => y
    | _ => x

def BinTree.max [Ord α] (t : BinTree α) : Option α :=
  match t with
  | .empty => none
  | .node v l r =>
    let left_max := (max l).getD v
    let right_max := (max r).getD v
    some <| [left_max, right_max].foldl Max.max v

def BinTree.searchTree [Ord α] (t : BinTree α) : Bool :=
  -- sorry
  match t with
  | .empty => true
  | .node v l r =>
    let left_max := (max l).getD v
    let right_max := (max r).getD v
    match compare left_max v, compare v right_max with
    | _, .gt => false
    | .gt, _ => false
    | _, _ => searchTree l && searchTree r
  -- sorry

def BinTree.searchTreeFromList [Ord α] (xs : List α) : BinTree α :=
  -- sorry
  xs.foldl insert BinTree.empty
where
  insert : BinTree α → α → BinTree α
  | .empty, x => leaf x
  | .node v l r, x =>
    match compare x v with
    | .lt => BinTree.node v (insert l x) r
    | _ => BinTree.node v l (insert r x)
  -- sorry

-- The following codes are for test and you should not edit these.

#guard BinTree.node 3 (.node 2 (leaf 1) .empty) (.node 5 .empty (leaf 7)) |>.searchTree

#guard BinTree.searchTreeFromList [3, 2, 5, 7, 1] |>.searchTree

end Problem57

namespace Problem58
/- # Problem 58

Apply the generate-and-test paradigm to construct all symmetric, completely balanced binary trees with a given number of nodes.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem58%0A%2F-%20%23%20Problem%2058%0A%0AApply%20the%20generate-and-test%20paradigm%20to%20construct%20all%20symmetric%2C%20completely%20balanced%20binary%20trees%20with%20a%20given%20number%20of%20nodes.%0A-%2F%0A%0A%2F--%20binary%20tree%20-%2F%0Ainductive%20BinTree%20(%CE%B1%20%3A%20Type)%20where%0A%20%20%7C%20empty%20%3A%20BinTree%20%CE%B1%0A%20%20%7C%20node%20%3A%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%0A%0Adef%20leaf%20%7B%CE%B1%20%3A%20Type%7D%20(a%20%3A%20%CE%B1)%20%3A%20BinTree%20%CE%B1%20%3A%3D%20.node%20a%20.empty%20.empty%0A%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%0A%0Asection%0A%20%20%2F-%20pretty%20print%20of%20binary%20tree%20-%2F%0A%20%20variable%20%5BToString%20%CE%B1%5D%0A%0A%20%20def%20_root_.String.addIndent%20(s%20%3A%20String)%20(depth%20%3A%20Nat)%20%3A%20String%20%3A%3D%0A%20%20%20%20Nat.repeat%20(fun%20s%20%3D%3E%20%22%20%22%20%2B%2B%20s)%20depth%20s%0A%0A%20%20def%20BinTree.toString%20(tree%20%3A%20BinTree%20%CE%B1)%20%3A%20String%20%3A%3D%0A%20%20%20%20aux%20tree%202%0A%20%20where%0A%20%20%20%20aux%20(tree%20%3A%20BinTree%20%CE%B1)%20(depth%20%3A%20Nat)%20%3A%20String%20%3A%3D%0A%20%20%20%20%20%20match%20tree%20with%0A%20%20%20%20%20%20%7C%20.node%20v%20.empty%20.empty%20%3D%3E%20s!%22leaf%20%7Bv%7D%22%0A%20%20%20%20%20%20%7C%20.node%20v%20l%20r%20%3D%3E%0A%20%20%20%20%20%20%20%20let%20ls%20%3A%3D%20aux%20l%20(depth%20%2B%202)%0A%20%20%20%20%20%20%20%20let%20rs%20%3A%3D%20aux%20r%20(depth%20%2B%202)%0A%20%20%20%20%20%20%20%20s!%22.node%20%7Bv%7D%5Cn%22%20%2B%2B%20s!%22%7Bls%7D%5Cn%22.addIndent%20depth%20%2B%2B%20s!%22%7Brs%7D%5Cn%22.addIndent%20depth%0A%20%20%20%20%20%20%7C%20.empty%20%3D%3E%20%22empty%22%0A%0A%20%20instance%20%7B%CE%B1%20%3A%20Type%7D%20%5BToString%20%CE%B1%5D%20%3A%20ToString%20(BinTree%20%CE%B1)%20%3A%3D%20%E2%9F%A8BinTree.toString%E2%9F%A9%0Aend%0A%0A%23eval%20BinTree.node%203%20(.node%202%20(leaf%201)%20.empty)%20(.node%205%20.empty%20(leaf%207))%0A%0A%23eval%20BinTree.node%20'x'%20(leaf%20'x')%20(leaf%20'x')%0A%0A%23eval%20BinTree.node%20'x'%20.empty%20(leaf%20'x')%0A%0A%23eval%20BinTree.node%20'x'%20(leaf%20'x')%20.empty%0A%0Anamespace%20ListMonad%0A%0A%2F--%20monad%20instance%20of%20%60List%60%20-%2F%0Ascoped%20instance%20%3A%20Monad%20List%20where%0A%20%20pure%20%3A%3D%20List.singleton%0A%20%20bind%20xs%20f%20%3A%3D%20xs.flatMap%20f%0A%20%20map%20%3A%3D%20List.map%0A%0Aend%20ListMonad%0A%0Aopen%20scoped%20ListMonad%0A%0A%2F--%20construct%20all%20balanced%20binary%20trees%20which%20contains%20%60x%60%20elements%20-%2F%0Apartial%20def%20cbalTree%20(x%20%3A%20Nat)%20%3A%20List%20(BinTree%20Unit)%20%3A%3D%0A%20%20sorry%0A%0Adef%20BinTree.mirror%20(s%20t%20%3A%20BinTree%20%CE%B1)%20%3A%20Bool%20%3A%3D%0A%20%20match%20s%2C%20t%20with%0A%20%20%7C%20.empty%2C%20.empty%20%3D%3E%20true%0A%20%20%7C%20.node%20_%20a%20b%2C%20.node%20_%20x%20y%20%3D%3E%20mirror%20a%20y%20%26%26%20mirror%20b%20x%0A%20%20%7C%20_%2C%20_%20%3D%3E%20false%0A%0Adef%20BinTree.isSymmetric%20(t%20%3A%20BinTree%20%CE%B1)%20%3A%20Bool%20%3A%3D%0A%20%20match%20t%20with%0A%20%20%7C%20.empty%20%3D%3E%20true%0A%20%20%7C%20.node%20_%20l%20r%20%3D%3E%20mirror%20l%20r%0A%0A%2F--%20construct%20all%20balanced%2C%20symmetric%20binary%20trees%20with%20given%20number%20of%20elements%20-%2F%0Adef%20symCbalTrees%20(n%20%3A%20Nat)%20%3A%20List%20(BinTree%20Unit)%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0A%23guard%20(symCbalTrees%205).length%20%3D%202%0A%23guard%20(symCbalTrees%206).length%20%3D%200%0A%23guard%20(symCbalTrees%207).length%20%3D%201%0A%23guard%20(symCbalTrees%208).length%20%3D%200%0A%0Aend%20Problem58%0A
-/

/-- binary tree -/
inductive BinTree (α : Type) where
  | empty : BinTree α
  | node : α → BinTree α → BinTree α → BinTree α

def leaf {α : Type} (a : α) : BinTree α := .node a .empty .empty

variable {α : Type}

section
  /- pretty print of binary tree -/
  variable [ToString α]

  def _root_.String.addIndent (s : String) (depth : Nat) : String :=
    Nat.repeat (fun s => " " ++ s) depth s

  def BinTree.toString (tree : BinTree α) : String :=
    aux tree 2
  where
    aux (tree : BinTree α) (depth : Nat) : String :=
      match tree with
      | .node v .empty .empty => s!"leaf {v}"
      | .node v l r =>
        let ls := aux l (depth + 2)
        let rs := aux r (depth + 2)
        s!".node {v}\n" ++ s!"{ls}\n".addIndent depth ++ s!"{rs}\n".addIndent depth
      | .empty => "empty"

  instance {α : Type} [ToString α] : ToString (BinTree α) := ⟨BinTree.toString⟩
end

#eval BinTree.node 3 (.node 2 (leaf 1) .empty) (.node 5 .empty (leaf 7))

#eval BinTree.node 'x' (leaf 'x') (leaf 'x')

#eval BinTree.node 'x' .empty (leaf 'x')

#eval BinTree.node 'x' (leaf 'x') .empty

namespace ListMonad

/-- monad instance of `List` -/
scoped instance : Monad List where
  pure := List.singleton
  bind xs f := xs.flatMap f
  map := List.map

end ListMonad

open scoped ListMonad

/-- construct all balanced binary trees which contains `x` elements -/
partial def cbalTree (x : Nat) : List (BinTree Unit) :=
  -- sorry
  match x with
  | 0 => [.empty]
  | n + 1 => do
    let q := n / 2
    let r := n % 2
    let indices := List.range (q+r+1) |>.drop q
    let i ← indices
    let left ← cbalTree i
    let right ← cbalTree (n - i)
    pure (BinTree.node () left right)
  -- sorry

def BinTree.mirror (s t : BinTree α) : Bool :=
  match s, t with
  | .empty, .empty => true
  | .node _ a b, .node _ x y => mirror a y && mirror b x
  | _, _ => false

def BinTree.isSymmetric (t : BinTree α) : Bool :=
  match t with
  | .empty => true
  | .node _ l r => mirror l r

/-- construct all balanced, symmetric binary trees with given number of elements -/
def symCbalTrees (n : Nat) : List (BinTree Unit) :=
  -- sorry
  cbalTree n |>.filter BinTree.isSymmetric
  -- sorry

-- The following codes are for test and you should not edit these.

#guard (symCbalTrees 5).length = 2
#guard (symCbalTrees 6).length = 0
#guard (symCbalTrees 7).length = 1
#guard (symCbalTrees 8).length = 0

end Problem58

namespace Problem59
/- # Problem 59

Construct height-balanced binary trees.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem59%0A%2F-%20%23%20Problem%2059%0A%0AConstruct%20height-balanced%20binary%20trees.%0A-%2F%0A%0A%2F--%20binary%20tree%20-%2F%0Ainductive%20BinTree%20(%CE%B1%20%3A%20Type)%20where%0A%20%20%7C%20empty%20%3A%20BinTree%20%CE%B1%0A%20%20%7C%20node%20%3A%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%0A%0Aderiving%20Repr%0A%0Adef%20leaf%20%7B%CE%B1%20%3A%20Type%7D%20(a%20%3A%20%CE%B1)%20%3A%20BinTree%20%CE%B1%20%3A%3D%20.node%20a%20.empty%20.empty%0A%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%20%5BToString%20%CE%B1%5D%0A%0Adef%20BinTree.height%20(t%20%3A%20BinTree%20%CE%B1)%20%3A%20Nat%20%3A%3D%0A%20%20match%20t%20with%0A%20%20%7C%20.empty%20%3D%3E%200%0A%20%20%7C%20.node%20_%20l%20r%20%3D%3E%201%20%2B%20max%20l.height%20r.height%0A%0Anamespace%20ListMonad%0A%0A%2F--%20monad%20instance%20of%20%60List%60%20-%2F%0Ascoped%20instance%20%3A%20Monad%20List%20where%0A%20%20pure%20%3A%3D%20List.singleton%0A%20%20bind%20xs%20f%20%3A%3D%20xs.flatMap%20f%0A%20%20map%20%3A%3D%20List.map%0A%0Aend%20ListMonad%0A%0Aopen%20scoped%20ListMonad%0A%0A%2F--%20construct%20all%20balanced%20binary%20trees%20which%20contains%20%60x%60%20elements%20-%2F%0Apartial%20def%20cbalTree%20(x%20%3A%20Nat)%20%3A%20List%20(BinTree%20Unit)%20%3A%3D%0A%20%20sorry%0A%0Avariable%20%7B%CE%B2%20%3A%20Type%7D%0A%0Adef%20_root_.List.product%20(as%20%3A%20List%20%CE%B1)%20(bs%20%3A%20List%20%CE%B2)%20%3A%20List%20(%CE%B1%20%C3%97%20%CE%B2)%20%3A%3D%20do%0A%20%20let%20a%20%E2%86%90%20as%0A%20%20let%20b%20%E2%86%90%20bs%0A%20%20return%20(a%2C%20b)%0A%0A%2F--%20construct%20all%20balanced%20binary%20trees%20whose%20hight%20is%20%60height%60.%20-%2F%0Adef%20hbalTrees%20(height%20%3A%20Nat)%20%3A%20List%20(BinTree%20Unit)%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0A%23guard%20(hbalTrees%202%20%7C%3E.length)%20%3D%203%0A%23guard%20(hbalTrees%203%20%7C%3E.length)%20%3D%2015%0A%23guard%20(hbalTrees%204%20%7C%3E.length)%20%3D%20315%0A%0Aend%20Problem59%0A
-/

/-- binary tree -/
inductive BinTree (α : Type) where
  | empty : BinTree α
  | node : α → BinTree α → BinTree α → BinTree α

deriving Repr

def leaf {α : Type} (a : α) : BinTree α := .node a .empty .empty

variable {α : Type} [ToString α]

def BinTree.height (t : BinTree α) : Nat :=
  match t with
  | .empty => 0
  | .node _ l r => 1 + max l.height r.height

namespace ListMonad

/-- monad instance of `List` -/
scoped instance : Monad List where
  pure := List.singleton
  bind xs f := xs.flatMap f
  map := List.map

end ListMonad

open scoped ListMonad

/-- construct all balanced binary trees which contains `x` elements -/
partial def cbalTree (x : Nat) : List (BinTree Unit) :=
  -- sorry
  match x with
  | 0 => [.empty]
  | n + 1 => do
    let q := n / 2
    let r := n % 2
    let indices := List.range (q+r+1) |>.drop q
    let i ← indices
    let left ← cbalTree i
    let right ← cbalTree (n - i)
    pure (BinTree.node () left right)
  -- sorry

variable {β : Type}

def _root_.List.product (as : List α) (bs : List β) : List (α × β) := do
  let a ← as
  let b ← bs
  return (a, b)

/-- construct all balanced binary trees whose hight is `height`. -/
def hbalTrees (height : Nat) : List (BinTree Unit) :=
  -- sorry
  match height with
  | 0 => [.empty]
  | 1 => [leaf ()]
  | h + 2 =>
    let t1s := hbalTrees (h + 1)
    let t2s := hbalTrees h
    let ts := List.product t1s t2s ++ List.product t1s t1s ++ List.product t2s t1s
    ts.map fun (t1, t2) => BinTree.node () t1 t2
  -- sorry

-- The following codes are for test and you should not edit these.

#guard (hbalTrees 2 |>.length) = 3
#guard (hbalTrees 3 |>.length) = 15
#guard (hbalTrees 4 |>.length) = 315

end Problem59

/-! ## Shared `[tree| ...]` syntax for binary trees (used by Problems 60-65)
Hygiene is off so that `BinTree` refers to the type defined in each problem. -/

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

set_option hygiene false in
macro_rules
  | `([tree| ∅]) => `(BinTree.empty)
  | `([tree| $v:tree_label]) => do
    `(BinTree.leaf $(← expandTreeLabel v))
  | `([tree| $v:tree_label * ($l + $r)]) => do
    `(BinTree.node $(← expandTreeLabel v) [tree| $l] [tree| $r])


namespace Problem60
/- # Problem 60

(Intermediate) Construct height-balanced binary trees with a given number of nodes.

Consider a height-balanced binary tree of height `H`. What is the maximum number of nodes it can contain?
Clearly, `MaxN = 2 ^ H - 1`. However, what is the minimum number `MinN`? This question is more difficult.
Try to find a recursive statement and turn it into a function `minNodes` that returns the minimum number of nodes in a height-balanced binary tree of height `H`.

On the other hand, we might ask: what is the maximum height `H` a height-balanced binary tree with `N` nodes can have?
Write a function `maxHeight` that computes this.

Now, we can attack the main problem: construct all the height-balanced binary trees with a given number of nodes.
Find out how many height-balanced trees exist for `N = 15`.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem60%0A%2F-%20%23%20Problem%2060%0A%0A(Intermediate)%20Construct%20height-balanced%20binary%20trees%20with%20a%20given%20number%20of%20nodes.%0A%0AConsider%20a%20height-balanced%20binary%20tree%20of%20height%20%60H%60.%20What%20is%20the%20maximum%20number%20of%20nodes%20it%20can%20contain%3F%0AClearly%2C%20%60MaxN%20%3D%202%20%5E%20H%20-%201%60.%20However%2C%20what%20is%20the%20minimum%20number%20%60MinN%60%3F%20This%20question%20is%20more%20difficult.%0ATry%20to%20find%20a%20recursive%20statement%20and%20turn%20it%20into%20a%20function%20%60minNodes%60%20that%20returns%20the%20minimum%20number%20of%20nodes%20in%20a%20height-balanced%20binary%20tree%20of%20height%20%60H%60.%0A%0AOn%20the%20other%20hand%2C%20we%20might%20ask%3A%20what%20is%20the%20maximum%20height%20%60H%60%20a%20height-balanced%20binary%20tree%20with%20%60N%60%20nodes%20can%20have%3F%0AWrite%20a%20function%20%60maxHeight%60%20that%20computes%20this.%0A%0ANow%2C%20we%20can%20attack%20the%20main%20problem%3A%20construct%20all%20the%20height-balanced%20binary%20trees%20with%20a%20given%20number%20of%20nodes.%0AFind%20out%20how%20many%20height-balanced%20trees%20exist%20for%20%60N%20%3D%2015%60.%0A-%2F%0A%2F--%20binary%20tree%20-%2F%0Ainductive%20BinTree%20(%CE%B1%20%3A%20Type)%20where%0A%20%20%7C%20empty%20%3A%20BinTree%20%CE%B1%0A%20%20%7C%20node%20%3A%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%0Aderiving%20DecidableEq%2C%20Repr%0A%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%0A%0A%2F--%20a%20node%20without%20children%20-%2F%0Adef%20BinTree.leaf%20(a%20%3A%20%CE%B1)%20%3A%20BinTree%20%CE%B1%20%3A%3D%20.node%20a%20.empty%20.empty%0A%0A%2F--%20the%20number%20of%20nodes%20of%20a%20binary%20tree%20-%2F%0Adef%20BinTree.nodes%20%3A%20BinTree%20%CE%B1%20%E2%86%92%20Nat%0A%20%20%7C%20.empty%20%3D%3E%200%0A%20%20%7C%20.node%20_%20l%20r%20%3D%3E%201%20%2B%20l.nodes%20%2B%20r.nodes%0A%0Anamespace%20ListMonad%0A%0A%2F--%20monad%20instance%20of%20%60List%60%20-%2F%0Ascoped%20instance%20%3A%20Monad%20List%20where%0A%20%20pure%20%3A%3D%20List.singleton%0A%20%20bind%20xs%20f%20%3A%3D%20xs.flatMap%20f%0A%20%20map%20%3A%3D%20List.map%0A%0Aend%20ListMonad%0A%0Aopen%20scoped%20ListMonad%0A%0A%2F--%20all%20height-balanced%20binary%20trees%20of%20the%20given%20height%20(see%20Problem%2059)%20-%2F%0Apartial%20def%20hbalTrees%20(a%20%3A%20%CE%B1)%20(height%20%3A%20Nat)%20%3A%20List%20(BinTree%20%CE%B1)%20%3A%3D%0A%20%20match%20height%20with%0A%20%20%7C%200%20%3D%3E%20%5B.empty%5D%0A%20%20%7C%201%20%3D%3E%20%5B.leaf%20a%5D%0A%20%20%7C%20h%20%2B%202%20%3D%3E%20do%0A%20%20%20%20let%20(hl%2C%20hr)%20%E2%86%90%20%5B(h%2C%20h%20%2B%201)%2C%20(h%20%2B%201%2C%20h%20%2B%201)%2C%20(h%20%2B%201%2C%20h)%5D%0A%20%20%20%20let%20l%20%E2%86%90%20hbalTrees%20a%20hl%0A%20%20%20%20let%20r%20%E2%86%90%20hbalTrees%20a%20hr%0A%20%20%20%20return%20BinTree.node%20a%20l%20r%0A%0A%2F--%20the%20minimum%20number%20of%20nodes%20in%20a%20height-balanced%20binary%20tree%20of%20height%20%60h%60%20-%2F%0Adef%20minNodes%20(h%20%3A%20Nat)%20%3A%20Nat%20%3A%3D%0A%20%20sorry%0A%0A%2F--%20the%20maximum%20height%20of%20a%20height-balanced%20binary%20tree%20with%20%60n%60%20nodes%20-%2F%0Adef%20maxHeight%20(n%20%3A%20Nat)%20%3A%20Nat%20%3A%3D%0A%20%20sorry%0A%0A%2F--%20all%20height-balanced%20binary%20trees%20with%20%60n%60%20nodes%20-%2F%0Adef%20hbalTreeNodes%20(a%20%3A%20%CE%B1)%20(n%20%3A%20Nat)%20%3A%20List%20(BinTree%20%CE%B1)%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0A%23guard%20minNodes%201%20%3D%201%0A%23guard%20minNodes%202%20%3D%202%0A%23guard%20minNodes%203%20%3D%204%0A%23guard%20minNodes%204%20%3D%207%0A%0A%23guard%20maxHeight%200%20%3D%200%0A%23guard%20maxHeight%201%20%3D%201%0A%23guard%20maxHeight%202%20%3D%202%0A%23guard%20maxHeight%203%20%3D%202%0A%23guard%20maxHeight%204%20%3D%203%0A%23guard%20maxHeight%207%20%3D%204%0A%0A%23guard%20hbalTreeNodes%200%201%20%3D%20%5B%5Btree%7C%200%5D%5D%0A%23guard%20hbalTreeNodes%200%202%20%3D%20%5B%5Btree%7C%200%20*%20(%E2%88%85%20%2B%200)%5D%2C%20%5Btree%7C%200%20*%20(0%20%2B%20%E2%88%85)%5D%5D%0A%23guard%20(hbalTreeNodes%20'x'%2015).length%20%3D%201553%0A%0Aend%20Problem60%0A
-/
/-- binary tree -/
inductive BinTree (α : Type) where
  | empty : BinTree α
  | node : α → BinTree α → BinTree α → BinTree α
deriving DecidableEq, Repr

variable {α : Type}

/-- a node without children -/
def BinTree.leaf (a : α) : BinTree α := .node a .empty .empty

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

end Problem60

namespace Problem61
/- # Problem 61

(Easy) Count the leaves of a binary tree.

A leaf is a node with no successors. Write a function `countLeaves` to count them.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem61%0A%2F-%20%23%20Problem%2061%0A%0A(Easy)%20Count%20the%20leaves%20of%20a%20binary%20tree.%0A%0AA%20leaf%20is%20a%20node%20with%20no%20successors.%20Write%20a%20function%20%60countLeaves%60%20to%20count%20them.%0A-%2F%0A%2F--%20binary%20tree%20-%2F%0Ainductive%20BinTree%20(%CE%B1%20%3A%20Type)%20where%0A%20%20%7C%20empty%20%3A%20BinTree%20%CE%B1%0A%20%20%7C%20node%20%3A%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%0Aderiving%20DecidableEq%2C%20Repr%0A%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%0A%0A%2F--%20a%20node%20without%20children%20-%2F%0Adef%20BinTree.leaf%20(a%20%3A%20%CE%B1)%20%3A%20BinTree%20%CE%B1%20%3A%3D%20.node%20a%20.empty%20.empty%0A%0Adef%20countLeaves%20(t%20%3A%20BinTree%20%CE%B1)%20%3A%20Nat%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0A%23guard%20countLeaves%20(BinTree.empty%20%3A%20BinTree%20Nat)%20%3D%200%0A%23guard%20countLeaves%20%5Btree%7C%201%5D%20%3D%201%0A%23guard%20countLeaves%20%5Btree%7C%201%20*%20(2%20%2B%203)%5D%20%3D%202%0A%23guard%20countLeaves%20%5Btree%7C%201%20*%20(2%20*%20(%E2%88%85%20%2B%204)%20%2B%20%E2%88%85)%5D%20%3D%201%0A%23guard%20countLeaves%20%5Btree%7C%201%20*%20(2%20*%20(3%20%2B%204)%20%2B%205%20*%20(6%20%2B%207))%5D%20%3D%204%0A%0Aend%20Problem61%0A
-/
/-- binary tree -/
inductive BinTree (α : Type) where
  | empty : BinTree α
  | node : α → BinTree α → BinTree α → BinTree α
deriving DecidableEq, Repr

variable {α : Type}

/-- a node without children -/
def BinTree.leaf (a : α) : BinTree α := .node a .empty .empty

def countLeaves (t : BinTree α) : Nat :=
  -- sorry
  match t with
  | .empty => 0
  | .node _ .empty .empty => 1
  | .node _ left right => countLeaves left + countLeaves right
  -- sorry

-- The following codes are for test and you should not edit these.

#guard countLeaves (BinTree.empty : BinTree Nat) = 0
#guard countLeaves [tree| 1] = 1
#guard countLeaves [tree| 1 * (2 + 3)] = 2
#guard countLeaves [tree| 1 * (2 * (∅ + 4) + ∅)] = 1
#guard countLeaves [tree| 1 * (2 * (3 + 4) + 5 * (6 + 7))] = 4

end Problem61

namespace Problem61A
/- # Problem 61A

(Easy) Collect the leaves of a binary tree in a list.

A leaf is a node with no successors. Write a function `leaves` to collect them in a list, from left to right.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem61A%0A%2F-%20%23%20Problem%2061A%0A%0A(Easy)%20Collect%20the%20leaves%20of%20a%20binary%20tree%20in%20a%20list.%0A%0AA%20leaf%20is%20a%20node%20with%20no%20successors.%20Write%20a%20function%20%60leaves%60%20to%20collect%20them%20in%20a%20list%2C%20from%20left%20to%20right.%0A-%2F%0A%2F--%20binary%20tree%20-%2F%0Ainductive%20BinTree%20(%CE%B1%20%3A%20Type)%20where%0A%20%20%7C%20empty%20%3A%20BinTree%20%CE%B1%0A%20%20%7C%20node%20%3A%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%0Aderiving%20DecidableEq%2C%20Repr%0A%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%0A%0A%2F--%20a%20node%20without%20children%20-%2F%0Adef%20BinTree.leaf%20(a%20%3A%20%CE%B1)%20%3A%20BinTree%20%CE%B1%20%3A%3D%20.node%20a%20.empty%20.empty%0A%0Adef%20leaves%20(t%20%3A%20BinTree%20%CE%B1)%20%3A%20List%20%CE%B1%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0A%23guard%20leaves%20(BinTree.empty%20%3A%20BinTree%20Nat)%20%3D%20%5B%5D%0A%23guard%20leaves%20%5Btree%7C%201%5D%20%3D%20%5B1%5D%0A%23guard%20leaves%20%5Btree%7C%201%20*%20(2%20%2B%203)%5D%20%3D%20%5B2%2C%203%5D%0A%23guard%20leaves%20%5Btree%7C%201%20*%20(2%20*%20(%E2%88%85%20%2B%204)%20%2B%20%E2%88%85)%5D%20%3D%20%5B4%5D%0A%23guard%20leaves%20%5Btree%7C%201%20*%20(2%20*%20(3%20%2B%204)%20%2B%205%20*%20(6%20%2B%207))%5D%20%3D%20%5B3%2C%204%2C%206%2C%207%5D%0A%0Aend%20Problem61A%0A
-/
/-- binary tree -/
inductive BinTree (α : Type) where
  | empty : BinTree α
  | node : α → BinTree α → BinTree α → BinTree α
deriving DecidableEq, Repr

variable {α : Type}

/-- a node without children -/
def BinTree.leaf (a : α) : BinTree α := .node a .empty .empty

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

end Problem61A

namespace Problem62
/- # Problem 62

(Easy) Collect the internal nodes of a binary tree in a list.

An internal node of a binary tree has either one or two non-empty successors.
Write a function `internals` to collect them in a list (root first, then the left subtree, then the right subtree).

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem62%0A%2F-%20%23%20Problem%2062%0A%0A(Easy)%20Collect%20the%20internal%20nodes%20of%20a%20binary%20tree%20in%20a%20list.%0A%0AAn%20internal%20node%20of%20a%20binary%20tree%20has%20either%20one%20or%20two%20non-empty%20successors.%0AWrite%20a%20function%20%60internals%60%20to%20collect%20them%20in%20a%20list%20(root%20first%2C%20then%20the%20left%20subtree%2C%20then%20the%20right%20subtree).%0A-%2F%0A%2F--%20binary%20tree%20-%2F%0Ainductive%20BinTree%20(%CE%B1%20%3A%20Type)%20where%0A%20%20%7C%20empty%20%3A%20BinTree%20%CE%B1%0A%20%20%7C%20node%20%3A%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%0Aderiving%20DecidableEq%2C%20Repr%0A%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%0A%0A%2F--%20a%20node%20without%20children%20-%2F%0Adef%20BinTree.leaf%20(a%20%3A%20%CE%B1)%20%3A%20BinTree%20%CE%B1%20%3A%3D%20.node%20a%20.empty%20.empty%0A%0Adef%20internals%20(t%20%3A%20BinTree%20%CE%B1)%20%3A%20List%20%CE%B1%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0A%23guard%20internals%20%5Btree%7C%201%5D%20%3D%20%5B%5D%0A%23guard%20internals%20%5Btree%7C%201%20*%20(2%20%2B%203)%5D%20%3D%20%5B1%5D%0A%23guard%20internals%20%5Btree%7C%201%20*%20(2%20*%20(%E2%88%85%20%2B%204)%20%2B%20%E2%88%85)%5D%20%3D%20%5B1%2C%202%5D%0A%23guard%20internals%20%5Btree%7C%201%20*%20(2%20*%20(3%20%2B%204)%20%2B%205%20*%20(6%20%2B%207))%5D%20%3D%20%5B1%2C%202%2C%205%5D%0A%0Aend%20Problem62%0A
-/
/-- binary tree -/
inductive BinTree (α : Type) where
  | empty : BinTree α
  | node : α → BinTree α → BinTree α → BinTree α
deriving DecidableEq, Repr

variable {α : Type}

/-- a node without children -/
def BinTree.leaf (a : α) : BinTree α := .node a .empty .empty

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

end Problem62

namespace Problem62B
/- # Problem 62B

(Easy) Collect the nodes at a given level in a list.

A node of a binary tree is at level `n` if the path from the root to the node has length `n - 1`.
The root node is at level 1.
Write a function `atLevel` to collect all nodes at a given level in a list, from left to right.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem62B%0A%2F-%20%23%20Problem%2062B%0A%0A(Easy)%20Collect%20the%20nodes%20at%20a%20given%20level%20in%20a%20list.%0A%0AA%20node%20of%20a%20binary%20tree%20is%20at%20level%20%60n%60%20if%20the%20path%20from%20the%20root%20to%20the%20node%20has%20length%20%60n%20-%201%60.%0AThe%20root%20node%20is%20at%20level%201.%0AWrite%20a%20function%20%60atLevel%60%20to%20collect%20all%20nodes%20at%20a%20given%20level%20in%20a%20list%2C%20from%20left%20to%20right.%0A-%2F%0A%2F--%20binary%20tree%20-%2F%0Ainductive%20BinTree%20(%CE%B1%20%3A%20Type)%20where%0A%20%20%7C%20empty%20%3A%20BinTree%20%CE%B1%0A%20%20%7C%20node%20%3A%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%0Aderiving%20DecidableEq%2C%20Repr%0A%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%0A%0A%2F--%20a%20node%20without%20children%20-%2F%0Adef%20BinTree.leaf%20(a%20%3A%20%CE%B1)%20%3A%20BinTree%20%CE%B1%20%3A%3D%20.node%20a%20.empty%20.empty%0A%0Adef%20atLevel%20(t%20%3A%20BinTree%20%CE%B1)%20(level%20%3A%20Nat)%20%3A%20List%20%CE%B1%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0A%23guard%20atLevel%20%5Btree%7C%201%5D%200%20%3D%20%5B%5D%0A%23guard%20atLevel%20%5Btree%7C%201%5D%201%20%3D%20%5B1%5D%0A%23guard%20atLevel%20%5Btree%7C%201%20*%20(2%20%2B%203)%5D%202%20%3D%20%5B2%2C%203%5D%0A%23guard%20atLevel%20%5Btree%7C%201%20*%20(2%20*%20(3%20%2B%204)%20%2B%205%20*%20(6%20%2B%207))%5D%202%20%3D%20%5B2%2C%205%5D%0A%23guard%20atLevel%20%5Btree%7C%201%20*%20(2%20*%20(3%20%2B%204)%20%2B%205%20*%20(6%20%2B%207))%5D%203%20%3D%20%5B3%2C%204%2C%206%2C%207%5D%0A%23guard%20atLevel%20%5Btree%7C%201%20*%20(2%20*%20(3%20%2B%204)%20%2B%205%20*%20(6%20%2B%207))%5D%204%20%3D%20%5B%5D%0A%0Aend%20Problem62B%0A
-/
/-- binary tree -/
inductive BinTree (α : Type) where
  | empty : BinTree α
  | node : α → BinTree α → BinTree α → BinTree α
deriving DecidableEq, Repr

variable {α : Type}

/-- a node without children -/
def BinTree.leaf (a : α) : BinTree α := .node a .empty .empty

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

end Problem62B

namespace Problem63
/- # Problem 63

(Intermediate) Construct a complete binary tree.

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

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem63%0A%2F-%20%23%20Problem%2063%0A%0A(Intermediate)%20Construct%20a%20complete%20binary%20tree.%0A%0AA%20complete%20binary%20tree%20with%20height%20%60H%60%20is%20defined%20as%20follows%3A%0Athe%20levels%20%601%2C%202%2C%203%2C%20...%2C%20H%20-%201%60%20contain%20the%20maximum%20number%20of%20nodes%20(i.e.%20%602%20%5E%20(i%20-%201)%60%20at%20level%20%60i%60)%2C%0Aand%20in%20level%20%60H%60%2C%20which%20may%20contain%20less%20than%20the%20maximum%20possible%20number%20of%20nodes%2C%0Aall%20the%20nodes%20are%20%22left-adjusted%22.%20This%20means%20that%20in%20a%20level-order%20tree%20traversal%0Aall%20internal%20nodes%20come%20first%2C%20the%20leaves%20come%20second%2C%20and%20empty%20successors%0A(the%20empty%20trees%20which%20are%20not%20really%20nodes!)%20come%20last.%0A%0AParticularly%2C%20complete%20binary%20trees%20are%20used%20as%20data%20structures%20(or%20addressing%20schemes)%20for%20heaps.%0A%0AWe%20can%20assign%20an%20address%20number%20to%20each%20node%20in%20a%20complete%20binary%20tree%20by%20enumerating%20the%20nodes%20in%20level-order%2C%0Astarting%20at%20the%20root%20with%20number%201.%20For%20every%20node%20%60X%60%20with%20address%20%60A%60%20the%20following%20property%20holds%3A%0Athe%20addresses%20of%20%60X%60's%20left%20and%20right%20successors%20are%20%602%20*%20A%60%20and%20%602%20*%20A%20%2B%201%60%2C%20respectively%2C%20if%20they%20exist.%0AThis%20fact%20can%20be%20used%20to%20elegantly%20construct%20a%20complete%20binary%20tree%20structure.%0A%0AWrite%20a%20function%20%60completeBinaryTree%60%20that%20constructs%20a%20complete%20binary%20tree%20with%20%60n%60%20nodes%2C%0Aand%20a%20function%20%60BinTree.isComplete%60%20that%20checks%20whether%20a%20given%20binary%20tree%20is%20complete.%0A-%2F%0A%2F--%20binary%20tree%20-%2F%0Ainductive%20BinTree%20(%CE%B1%20%3A%20Type)%20where%0A%20%20%7C%20empty%20%3A%20BinTree%20%CE%B1%0A%20%20%7C%20node%20%3A%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%0Aderiving%20DecidableEq%2C%20Repr%0A%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%0A%0A%2F--%20a%20node%20without%20children%20-%2F%0Adef%20BinTree.leaf%20(a%20%3A%20%CE%B1)%20%3A%20BinTree%20%CE%B1%20%3A%3D%20.node%20a%20.empty%20.empty%0A%0A%2F--%20the%20number%20of%20nodes%20of%20a%20binary%20tree%20-%2F%0Adef%20BinTree.nodes%20%3A%20BinTree%20%CE%B1%20%E2%86%92%20Nat%0A%20%20%7C%20.empty%20%3D%3E%200%0A%20%20%7C%20.node%20_%20l%20r%20%3D%3E%201%20%2B%20l.nodes%20%2B%20r.nodes%0A%0A%2F--%20a%20complete%20binary%20tree%20with%20%60n%60%20nodes%2C%20all%20labeled%20with%20%60x%60%20-%2F%0Adef%20completeBinaryTree%20(x%20%3A%20%CE%B1)%20(n%20%3A%20Nat)%20%3A%20BinTree%20%CE%B1%20%3A%3D%0A%20%20sorry%0A%0A%2F--%20whether%20the%20binary%20tree%20is%20complete%20-%2F%0Adef%20BinTree.isComplete%20(t%20%3A%20BinTree%20%CE%B1)%20%3A%20Bool%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0A%23guard%20completeBinaryTree%200%200%20%3D%20.empty%0A%23guard%20completeBinaryTree%200%201%20%3D%20%5Btree%7C%200%5D%0A%23guard%20completeBinaryTree%200%202%20%3D%20%5Btree%7C%200%20*%20(0%20%2B%20%E2%88%85)%5D%0A%23guard%20completeBinaryTree%200%203%20%3D%20%5Btree%7C%200%20*%20(0%20%2B%200)%5D%0A%23guard%20completeBinaryTree%200%204%20%3D%20%5Btree%7C%200%20*%20(0%20*%20(0%20%2B%20%E2%88%85)%20%2B%200)%5D%0A%23guard%20completeBinaryTree%200%206%20%3D%20%5Btree%7C%200%20*%20(0%20*%20(0%20%2B%200)%20%2B%200%20*%20(0%20%2B%20%E2%88%85))%5D%0A%23guard%20completeBinaryTree%200%207%20%3D%20%5Btree%7C%200%20*%20(0%20*%20(0%20%2B%200)%20%2B%200%20*%20(0%20%2B%200))%5D%0A%23guard%20(completeBinaryTree%20'x'%20100).nodes%20%3D%20100%0A%0A%23guard%20(BinTree.empty%20%3A%20BinTree%20Nat).isComplete%0A%23guard%20%5Btree%7C%201%5D.isComplete%0A%23guard%20%5Btree%7C%201%20*%20(2%20%2B%20%E2%88%85)%5D.isComplete%0A%23guard%20!%20%5Btree%7C%201%20*%20(%E2%88%85%20%2B%202)%5D.isComplete%0A%23guard%20%5Btree%7C%201%20*%20(2%20*%20(4%20%2B%20%E2%88%85)%20%2B%203)%5D.isComplete%0A%23guard%20!%20%5Btree%7C%201%20*%20(2%20*%20(%E2%88%85%20%2B%205)%20%2B%203)%5D.isComplete%0A%23guard%20!%20%5Btree%7C%201%20*%20(2%20%2B%203%20*%20(6%20%2B%20%E2%88%85))%5D.isComplete%0A%23guard%20%5Btree%7C%201%20*%20(2%20*%20(4%20%2B%205)%20%2B%203%20*%20(6%20%2B%207))%5D.isComplete%0A%23guard%20(completeBinaryTree%20'x'%20100).isComplete%0A%0Aend%20Problem63%0A
-/
/-- binary tree -/
inductive BinTree (α : Type) where
  | empty : BinTree α
  | node : α → BinTree α → BinTree α → BinTree α
deriving DecidableEq, Repr

variable {α : Type}

/-- a node without children -/
def BinTree.leaf (a : α) : BinTree α := .node a .empty .empty

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

end Problem63

namespace Problem64
/- # Problem 64

(Intermediate) Layout a binary tree (1).

Given a binary tree as the usual `BinTree`, we want to prepare it for drawing.
Each node is annotated with its position `(x, y)` in a rectangular grid, using the following rule:

* `x` is the position of the node in the in-order sequence of the tree (the leftmost node has `x = 1`),
* `y` is the depth of the node in the tree (the root has `y = 1`).

Write a function `BinTree.layout` that annotates each node of a tree with its position.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem64%0A%2F-%20%23%20Problem%2064%0A%0A(Intermediate)%20Layout%20a%20binary%20tree%20(1).%0A%0AGiven%20a%20binary%20tree%20as%20the%20usual%20%60BinTree%60%2C%20we%20want%20to%20prepare%20it%20for%20drawing.%0AEach%20node%20is%20annotated%20with%20its%20position%20%60(x%2C%20y)%60%20in%20a%20rectangular%20grid%2C%20using%20the%20following%20rule%3A%0A%0A*%20%60x%60%20is%20the%20position%20of%20the%20node%20in%20the%20in-order%20sequence%20of%20the%20tree%20(the%20leftmost%20node%20has%20%60x%20%3D%201%60)%2C%0A*%20%60y%60%20is%20the%20depth%20of%20the%20node%20in%20the%20tree%20(the%20root%20has%20%60y%20%3D%201%60).%0A%0AWrite%20a%20function%20%60BinTree.layout%60%20that%20annotates%20each%20node%20of%20a%20tree%20with%20its%20position.%0A-%2F%0A%2F--%20binary%20tree%20-%2F%0Ainductive%20BinTree%20(%CE%B1%20%3A%20Type)%20where%0A%20%20%7C%20empty%20%3A%20BinTree%20%CE%B1%0A%20%20%7C%20node%20%3A%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%0Aderiving%20DecidableEq%2C%20Repr%0A%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%0A%0A%2F--%20a%20node%20without%20children%20-%2F%0Adef%20BinTree.leaf%20(a%20%3A%20%CE%B1)%20%3A%20BinTree%20%CE%B1%20%3A%3D%20.node%20a%20.empty%20.empty%0A%0A%2F--%20list%20the%20nodes%20of%20a%20binary%20tree%20in%20pre-order%20-%2F%0Adef%20BinTree.toList%20%3A%20BinTree%20%CE%B1%20%E2%86%92%20List%20%CE%B1%0A%20%20%7C%20.empty%20%3D%3E%20%5B%5D%0A%20%20%7C%20.node%20a%20l%20r%20%3D%3E%20a%20%3A%3A%20(l.toList%20%2B%2B%20r.toList)%0A%0A%2F--%20annotate%20each%20node%20with%20its%20position%20%60(x%2C%20y)%60%20-%2F%0Adef%20BinTree.layout%20(t%20%3A%20BinTree%20%CE%B1)%20%3A%20BinTree%20(%CE%B1%20%C3%97%20Nat%20%C3%97%20Nat)%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0A%23guard%20%5Btree%7C%20'a'%5D.layout.toList%20%3D%20%5B('a'%2C%201%2C%201)%5D%0A%0A%23guard%20%5Btree%7C%20'a'%20*%20('b'%20%2B%20%E2%88%85)%5D.layout.toList%20%3D%20%5B('a'%2C%202%2C%201)%2C%20('b'%2C%201%2C%202)%5D%0A%0A%23guard%20%5Btree%7C%20'a'%20*%20('b'%20%2B%20'c')%5D.layout.toList%20%3D%20%5B('a'%2C%202%2C%201)%2C%20('b'%2C%201%2C%202)%2C%20('c'%2C%203%2C%202)%5D%0A%0A%23guard%20%5Btree%7C%20'a'%20*%20('b'%20*%20(%E2%88%85%20%2B%20'c')%20%2B%20'd'%20*%20('e'%20%2B%20%E2%88%85))%5D.layout.toList%20%3D%0A%20%20%5B('a'%2C%203%2C%201)%2C%20('b'%2C%201%2C%202)%2C%20('c'%2C%202%2C%203)%2C%20('d'%2C%205%2C%202)%2C%20('e'%2C%204%2C%203)%5D%0A%0A--%20the%20example%20tree%20from%20H-99%0A%23guard%0A%20%20let%20tree%20%3A%3D%20%5Btree%7C%20'n'%20*%20('k'%20*%20('c'%20*%20('a'%20%2B%20'h'%20*%20('g'%20*%20('e'%20%2B%20%E2%88%85)%20%2B%20%E2%88%85))%20%2B%20'm')%20%2B%20'u'%20*%20('p'%20*%20(%E2%88%85%20%2B%20's'%20*%20('q'%20%2B%20%E2%88%85))%20%2B%20%E2%88%85))%5D%0A%20%20tree.layout.toList%20%3D%20%5B%0A%20%20%20%20('n'%2C%208%2C%201)%2C%20('k'%2C%206%2C%202)%2C%20('c'%2C%202%2C%203)%2C%20('a'%2C%201%2C%204)%2C%20('h'%2C%205%2C%204)%2C%20('g'%2C%204%2C%205)%2C%0A%20%20%20%20('e'%2C%203%2C%206)%2C%20('m'%2C%207%2C%203)%2C%20('u'%2C%2012%2C%202)%2C%20('p'%2C%209%2C%203)%2C%20('s'%2C%2011%2C%204)%2C%20('q'%2C%2010%2C%205)%0A%20%20%5D%0A%0Aend%20Problem64%0A
-/
/-- binary tree -/
inductive BinTree (α : Type) where
  | empty : BinTree α
  | node : α → BinTree α → BinTree α → BinTree α
deriving DecidableEq, Repr

variable {α : Type}

/-- a node without children -/
def BinTree.leaf (a : α) : BinTree α := .node a .empty .empty

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

end Problem64

namespace Problem65
/- # Problem 65

(Intermediate) Layout a binary tree (2).

This is an alternative to the layout method of Problem 64. Each node is again annotated with its position `(x, y)`,
where `y` is the depth of the node (the root has `y = 1`), but `x` is chosen by a different rule:

* on a given level, the horizontal distance between neighboring nodes is constant.
  More precisely, if the tree has height `H`, a node at level `k` and each of its children
  are `2 ^ (H - k - 1)` columns apart (the left child to the left, the right child to the right).
* the leftmost node of the whole tree has `x = 1`.

Write a function `BinTree.layout2` that annotates each node of a tree with its position.

Try it in the Lean playground: https://live.lean-lang.org/#code=import%20Lean%0A%0Anamespace%20Problem65%0A%2F-%20%23%20Problem%2065%0A%0A(Intermediate)%20Layout%20a%20binary%20tree%20(2).%0A%0AThis%20is%20an%20alternative%20to%20the%20layout%20method%20of%20Problem%2064.%20Each%20node%20is%20again%20annotated%20with%20its%20position%20%60(x%2C%20y)%60%2C%0Awhere%20%60y%60%20is%20the%20depth%20of%20the%20node%20(the%20root%20has%20%60y%20%3D%201%60)%2C%20but%20%60x%60%20is%20chosen%20by%20a%20different%20rule%3A%0A%0A*%20on%20a%20given%20level%2C%20the%20horizontal%20distance%20between%20neighboring%20nodes%20is%20constant.%0A%20%20More%20precisely%2C%20if%20the%20tree%20has%20height%20%60H%60%2C%20a%20node%20at%20level%20%60k%60%20and%20each%20of%20its%20children%0A%20%20are%20%602%20%5E%20(H%20-%20k%20-%201)%60%20columns%20apart%20(the%20left%20child%20to%20the%20left%2C%20the%20right%20child%20to%20the%20right).%0A*%20the%20leftmost%20node%20of%20the%20whole%20tree%20has%20%60x%20%3D%201%60.%0A%0AWrite%20a%20function%20%60BinTree.layout2%60%20that%20annotates%20each%20node%20of%20a%20tree%20with%20its%20position.%0A-%2F%0A%2F--%20binary%20tree%20-%2F%0Ainductive%20BinTree%20(%CE%B1%20%3A%20Type)%20where%0A%20%20%7C%20empty%20%3A%20BinTree%20%CE%B1%0A%20%20%7C%20node%20%3A%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%20%E2%86%92%20BinTree%20%CE%B1%0Aderiving%20DecidableEq%2C%20Repr%0A%0Avariable%20%7B%CE%B1%20%3A%20Type%7D%0A%0A%2F--%20a%20node%20without%20children%20-%2F%0Adef%20BinTree.leaf%20(a%20%3A%20%CE%B1)%20%3A%20BinTree%20%CE%B1%20%3A%3D%20.node%20a%20.empty%20.empty%0A%0A%2F--%20list%20the%20nodes%20of%20a%20binary%20tree%20in%20pre-order%20-%2F%0Adef%20BinTree.toList%20%3A%20BinTree%20%CE%B1%20%E2%86%92%20List%20%CE%B1%0A%20%20%7C%20.empty%20%3D%3E%20%5B%5D%0A%20%20%7C%20.node%20a%20l%20r%20%3D%3E%20a%20%3A%3A%20(l.toList%20%2B%2B%20r.toList)%0A%0A%2F--%20the%20height%20of%20a%20binary%20tree%20-%2F%0Adef%20BinTree.height%20%3A%20BinTree%20%CE%B1%20%E2%86%92%20Nat%0A%20%20%7C%20.empty%20%3D%3E%200%0A%20%20%7C%20.node%20_%20l%20r%20%3D%3E%201%20%2B%20max%20l.height%20r.height%0A%0A%2F--%20annotate%20each%20node%20with%20its%20position%20%60(x%2C%20y)%60%20-%2F%0Adef%20BinTree.layout2%20(t%20%3A%20BinTree%20%CE%B1)%20%3A%20BinTree%20(%CE%B1%20%C3%97%20Nat%20%C3%97%20Nat)%20%3A%3D%0A%20%20sorry%0A%0A--%20The%20following%20codes%20are%20for%20test%20and%20you%20should%20not%20edit%20these.%0A%0A%23guard%20%5Btree%7C%20'a'%5D.layout2.toList%20%3D%20%5B('a'%2C%201%2C%201)%5D%0A%0A%23guard%20%5Btree%7C%20'a'%20*%20('b'%20%2B%20'c')%5D.layout2.toList%20%3D%20%5B('a'%2C%202%2C%201)%2C%20('b'%2C%201%2C%202)%2C%20('c'%2C%203%2C%202)%5D%0A%0A%23guard%20%5Btree%7C%20'a'%20*%20(%E2%88%85%20%2B%20'b'%20*%20('c'%20%2B%20%E2%88%85))%5D.layout2.toList%20%3D%20%5B('a'%2C%201%2C%201)%2C%20('b'%2C%203%2C%202)%2C%20('c'%2C%202%2C%203)%5D%0A%0A%23guard%20%5Btree%7C%20'a'%20*%20('b'%20*%20(%E2%88%85%20%2B%20'c')%20%2B%20'd')%5D.layout2.toList%20%3D%0A%20%20%5B('a'%2C%203%2C%201)%2C%20('b'%2C%201%2C%202)%2C%20('c'%2C%202%2C%203)%2C%20('d'%2C%205%2C%202)%5D%0A%0A--%20the%20example%20tree%20from%20H-99%0A%23guard%0A%20%20let%20tree%20%3A%3D%20%5Btree%7C%20'n'%20*%20('k'%20*%20('c'%20*%20('a'%20%2B%20'e'%20*%20('d'%20%2B%20'g'))%20%2B%20'm')%20%2B%20'u'%20*%20('p'%20*%20(%E2%88%85%20%2B%20'q')%20%2B%20%E2%88%85))%5D%0A%20%20tree.layout2.toList%20%3D%20%5B%0A%20%20%20%20('n'%2C%2015%2C%201)%2C%20('k'%2C%207%2C%202)%2C%20('c'%2C%203%2C%203)%2C%20('a'%2C%201%2C%204)%2C%20('e'%2C%205%2C%204)%2C%20('d'%2C%204%2C%205)%2C%0A%20%20%20%20('g'%2C%206%2C%205)%2C%20('m'%2C%2011%2C%203)%2C%20('u'%2C%2023%2C%202)%2C%20('p'%2C%2019%2C%203)%2C%20('q'%2C%2021%2C%204)%0A%20%20%5D%0A%0Aend%20Problem65%0A
-/
/-- binary tree -/
inductive BinTree (α : Type) where
  | empty : BinTree α
  | node : α → BinTree α → BinTree α → BinTree α
deriving DecidableEq, Repr

variable {α : Type}

/-- a node without children -/
def BinTree.leaf (a : α) : BinTree α := .node a .empty .empty

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

end Problem65
