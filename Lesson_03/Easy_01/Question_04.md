#### Easy 1 Question 4:

`Array#delete` and `Array#delete_at`<br><br>

`Array#delete(obj)`
- Is used to delete a specified value/object.
- Will remove all occurrences of the specified value/object.
- Returns the last deleted element or nil if no element was removed.
- Mutates the caller.

`Array#delete_at(index)`
- Is used to delete the element at a specified integer index.
- A negative index begins from the last element.
- Returns the deleted element or nil if the index given is too high/too low.
- Mutates the caller.

###### Note: Both methods mutate the referenced array despite not having the `!` as part of their names.<br><br><br>
```Ruby
numbers = [1, 2, 3, 4, 5]
```
```Ruby
numbers.delete(1)	# numbers is now [2, 3, 4, 5]
numbers.delete_at(1)	# numbers is now [1, 3, 4, 5]
```