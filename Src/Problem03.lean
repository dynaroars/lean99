/-
# Problem 3
(Easy 🌟) Find the K'th element of a list.
-/
variable {α : Type}

def elementAt: List α -> Nat -> Option α
  | x :: _,1 => some x
  | _ :: xs, n+1 => elementAt xs n
  | _, _ => none
  -- sorry

-- The following codes are for test and you should not edit these.

example : elementAt ['a', 'b', 'c', 'd', 'e'] 3 = some 'c' := by rfl

example : elementAt ['a', 'b', 'c', 'd', 'e'] 6 = none := by rfl

example : elementAt ['a', 'b', 'c', 'd', 'e'] 0 = none := by rfl

example : elementAt ([] : List α) 0 = none := by rfl

example : elementAt [1, 2, 3] 2 = some 2 := by rfl
