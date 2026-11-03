/-
# Problem 8
(Intermediate 🌟🌟) Eliminate consecutive duplicates of list elements.
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
