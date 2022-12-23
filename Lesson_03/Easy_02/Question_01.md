#### Easy 2 Question 1:<br><br>

##### Searching a Hash for a Specified Key:

`Hash#include?(key)` / `Hash#key?(key)` / `Hash#member?(key)`
- All of these methods are aliases of each other.
- Searches to see if the specified `key` is a key in self.
- Returns `true` if `key` is a key in self, `false` otherwise.

<br>

To see if "Spot" is present in a hash of people and their age:
```Ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
```

`Hash#include?(key)`
```Ruby
ages.include?("Spot")	# => false
```

`Hash#key?(key)`
```Ruby
ages.key?("Spot")	# => false
```

`Hash#member?(key)`
```Ruby
ages.member?("Spot")	# => false
```
