#### Easy 2 Question 7:<br><br>

##### Adding Multiple Items to an Array:

`Array#push` / `Array#concat`

<br>

`Array#push(*objects)`:
- Appends each argument in `objects` to the end of self.
- Arguments are separated by commas.
- Returns self / mutates the caller.

`Array#concat(*other_arrays)`:
- Adds all elements from each array in `other_arrays` to self.
- Arrays to be added are separated by commas.
- Returns self / mutates the caller.

<br>

To add "Dino" and "Hoppy" to:
```Ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

`Array#push(*objects)`:
```Ruby
flintstones.push("Dino", "Hoppy")	# => ["Fred",  "Barney",  "Wilma",  "Betty",  "BamBam",  "Pebbles", "Dino", "Hoppy"]
```

`Array#concat(*other_arrays)`:
```Ruby
flintstones.concat(%w(Dino Hoppy))	# => ["Fred",  "Barney",  "Wilma",  "Betty",  "BamBam",  "Pebbles", "Dino", "Hoppy"]
```
