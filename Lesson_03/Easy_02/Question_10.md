#### Easy 2 Question 10:<br><br>

##### Centering a String:

`String#center(size, pad_string = ' ')`
- `size` is an integer argument.
- When `size` is:
	- Greater than the size (in characters) of self, returns a new string centered and padded on both ends.
	- Not greater than the size of self, returns a copy of self.

<br>

To center title, with spaces, above a table that was forty characters in width:
```Ruby
title = "Flintstone Family Members"

title.center(40)
```
