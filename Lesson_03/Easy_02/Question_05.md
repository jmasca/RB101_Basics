#### Easy 2 Question 5:<br><br>

##### Shortcut to Creating an Array of Strings:
`%w(*elements)`
- Creates an array of strings.
- `elements` are without `""` and are separated by spaces.
- Example: `%w(a b c)	=> ["a", "b", "c"]`

<br>

An easier way to write the array:
```Ruby
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
```

Would be with `%w(*elements)`:
```Ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```
