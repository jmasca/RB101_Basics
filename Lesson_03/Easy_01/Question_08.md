#### Easy 1 Question 8:<br>

##### Creating a Two Element Array from a Hash:
<br>

##### Long way (see notes for the drawbacks):

`Hash#select!` -> `Hash#to_a` -> `Hash#flatten`
<br><br>

`Hash#select {|key, value| ... }` / `Hash#select! {|key, value| ... }`
- Takes a block with two variables.
- Returns a new hash whose entries are those for which the block returns a truthy value.
- With no `!`, `#select` will return a new hash.
- With  `!`,  `#select!`  will return self / mutates the caller.

```Ruby
h = {a: 0, b: 1, c: 2}
h.select! {|key, value| value < 2 }	# => {:a=>0, :b=>1}
```

`Hash#to_a`
- Returns a new array of two-element arrays.
- Each nested array will contain a key-value pair from self.

```Ruby
h = {a: 0, b: 1, c: 2}
h.to_a		# => [[:a, 0], [:b, 1], [:c, 2]]
```

<br>

To make:
```Ruby
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
```

Into an array containing only two elements (Barney's name and Barney's number):
```Ruby
flintstones.select! {|k, v| k == "Barney"}	# => {"Barney"=>2}
flintstones = flintstones.to_a.flatten		# => ["Barney", 2]
```

###### Notes:
###### 	- `#select` returns a hash the size of however many truthy values were returned from the block, not necessarily just one key-value pair.
###### 	- `#to_a` returns a nested array that needs to be flattened.
###### 	- This is the solution I came up with before knowing about the better option...

<br><br>

##### Shorter/Best Way:
<br>

`Hash#assoc(key)`
- If the given key is found, returns a two-element array containing that key and its value.
- Returns nil if the key is not found.
- Leaves the caller unmodified.

```Ruby
h = {a: 0, b: 1, c: 2}
h.assoc(:b)	# => [:b, 1]
```

<br>

To make:
```Ruby
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
```

Into an array containing only two elements (Barney's name and Barney's number):
```Ruby
flintstones = flintstones.assoc("Barney")	# => ["Barney", 2]
```
