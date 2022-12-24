#### Easy 2 Question 2:<br><br>

##### Converting a String into Different Cases:

`String#swapcase!` / `String#capitalize!` / `String#downcase!` / `String#upcase!`

<br>

`String#swapcase` / `String#swapcase!`
- Reverses the cases of all characters in the string.
- Each uppercase character is downcased; each lowercase character is upcased.
- With no `!`, returns a new string.
- With `!`, returns self if any changes were made, nil otherwise / mutates the caller.

`String#capitalize` / `String#capitalize!`
- The first character of the string is upcased, and the remaining characters are downcased.
- With no `!`, returns a new string.
- With `!`, returns self if any changes were made, nil otherwise / mutates the caller.

`String#downcase` / `String#downcase!`
- All characters in the string are downcased.
- With no `!`, returns a new string.
- With `!`, returns self if any changes were made, nil otherwise / mutates the caller.

`String#upcase` / `String#upcase!`
- All characters in the string are upcased.
- With no `!`, returns a new string.
- With `!`, returns self if any changes were made, nil otherwise / mutates the caller.

<br>

Given the string:
```Ruby
munsters_description = "The Munsters are creepy in a good way."
```

`String#swapcase!`
```Ruby
munsters_description.swapcase!		# => "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
```

`String#capitalize!`
```Ruby
munsters_description.capitalize!	# => "The munsters are creepy in a good way."
```

`String#downcase!`
```Ruby
munsters_description.downcase!		# => "the munsters are creepy in a good way."
```

`String#upcase!`
```Ruby
munsters_description.upcase!		# => "THE MUNSTERS ARE CREEPY IN A GOOD WAY."
```
