#### Easy 1 Question 7:<br><br>

`Array#flatten(level)` / `Array#flatten!(level)`
- Recursively flattens self (combines nested arrays).
- Levels of flattening are the levels of nested arrays, where `0` is the main array.
- No argument, nil, or a negative argument will result in all levels being flattened.
- Giving a level argument will flatten through that level of the nested arrays.
- With no `!`, `#flatten` will return a new array.
- With `!`, `#flatten!` will return self / mutates the caller.
<br>

```Ruby
a = [ 0, [ 1, [2, 3], 4 ], 5 ]
a.flatten!	# => [0, 1, 2, 3, 4, 5]
```

```Ruby
a = [ 0, [ 1, [2, 3], 4 ], 5 ]
a.flatten!(1)	# => [0, 1, [2, 3], 4, 5]
```
<br><br>
To make this:
```Ruby
flintstones = ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
```

Into an un-nested array:
```Ruby
flintstones.flatten!	# => ["Fred", "Wilma", "Barney", "Betty", "BamBam", "Pebbles"]
```
