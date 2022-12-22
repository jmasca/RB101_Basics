#### Easy 1 Question 6:<br><br>

##### Combining Strings:

`String#insert(index, other_string)`:
- Used to insert the given `other_string` into self at the specified `index`.
	- A negative index will begin from the end of the `String`.
- Returns self / will mutate the caller. 

`String#prepend(*other_strings)`:
- Will prepend each string in `other_strings` to self.
- Each string in `other_strings` is separated by a comma.
- Returns self / mutates the caller.

Other ways to concatenate one string to another string:
- `+` can be used to concatenate one string to another string and will always return a new string.
- `<<` can also be used to concatenate one string to another string. However:
	- If used to concatenate a variable to a string it will return a new string.<br>
	`"a string " << some_variable` leaves `some_variable` unchanged.
	- If used to concatenate a string to a variable it will return self, mutated.<br>
	`some_variable << "a string"` will mutate `some_variable`.<br><br><br>

To put "Four score and " in front of "seven years ago..." when:
```Ruby
famous_words = "seven years ago..."
```
<br>

`famous_words` is mutated:
```Ruby
famous_words.insert(0, "Four score and ")
```
```Ruby
famous_words.prepend("Four score and ")
```
<br>

`famous_words` remains unmodified:
```Ruby
"Four score and " + famous_words
```
```Ruby
"Four score and " << famous_words
```
