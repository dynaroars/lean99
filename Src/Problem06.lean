/-
# Problem 6
(Easy 🌟) Find out whether a list is a palindrome.

Hint: A palindrome can be read forward or backward; e.g. (x a m a x).
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
