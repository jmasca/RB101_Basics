#### Easy 2 Question 8:<br><br>

##### Slicing a string with `String#slice`:

`String#slice` / `String#slice!`
- Can take multiple argument types:
	- `String#slice!(index)`
	- `String#slice!(start, length)`
	- `String#slice!(range)`
	- `String#slice!(substring)`
	- `String#slice!(regexp)`
- Returns the substring specified by the arguments.
- Without `!`, returns a copy of the substring and leaves the caller unmodified.
- With `!`, returns the removed substring / mutates the caller.

<br>

To shorten the following sentence:
```Ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```

So the `advice` variable is `"house training your pet dinosaur."`:
```Ruby
advice.slice!(..38)	# => "Few things in life are as important as "
advice	# => "house training your pet dinosaur."
```
or
```Ruby
advice.slice!(0, advice.index('house'))  # => "Few things in life are as important as "
advice	# => "house training your pet dinosaur."
```
