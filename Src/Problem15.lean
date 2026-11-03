/-
# Problem 15
(Intermediate 🌟🌟) Replicate the elements of a list a given number of times.
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

-- The following codes are for test and you should not edit these.

example : repli [1, 2, 3] 3 = [1, 1, 1, 2, 2, 2, 3, 3, 3] := by rfl

example : repli [1, 2, 3] 2 = [1, 1, 2, 2, 3, 3] := by rfl

example : repli [1, 2, 3] 1 = [1, 2, 3] := by rfl

example : repli [1, 2, 3] 0 = [] := by rfl

example : repli ([] : List α) 255 = [] := by rfl
