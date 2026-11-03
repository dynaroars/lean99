/-
# Problem 5
(Easy 🌟) Reverse a list.
-/
variable {α : Type}

def myReverse: List α -> List α
  | [] => []
  | a :: as => myReverse as ++ [a]


-- The following codes are for test and you should not edit these.

example : myReverse [1, 2, 3, 4] = [4, 3, 2, 1] := rfl

example : myReverse ["man", "plan", "canal", "panama"]
  = ["panama", "canal", "plan", "man"] := rfl
