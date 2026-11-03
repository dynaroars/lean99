/-
# Problem 2
(Easy 🌟) Find the last-but-one (or second-last) element of a list.
-/
variable {α : Type}

def myButLast (l : List α) : Option α :=
  -- sorry
  match l with
  | [] => none
  | [_] => none
  | [x,_] => some x
  | _ :: xs => myButLast xs

-- The following codes are for test and you should not edit these.

example : myButLast [1, 2, 3, 4] = some 3 := rfl

example : myButLast ['x', 'y', 'z'] = some 'y' := rfl

example : myButLast ([] : List α) = none := rfl

example : myButLast [1] = none := rfl
