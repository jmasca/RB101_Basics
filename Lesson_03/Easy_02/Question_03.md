#### Easy 2 Question 3:<br><br>

##### Combining a Hash with an Existing Hash:

`Hash#merge(*other_hashes)` / `Hash#merge!(*other_hashes)`
- A new hash is formed by combining/merging each of `other_hashes` into a copy of self.
- Each argument must be a hash.
- The given hashes are merged left to right.
- Each new-key entry is added at the end.
- Each duplicate-key entry’s value overwrites the previous value.
- Can take a block (see documentation: [merge](https://docs.ruby-lang.org/en/master/Hash.html#method-i-merge)).
- With no `!` and:
	- no arguments: returns a copy of self.
	- arguments: returns the new Hash that was formed by merging each successive Hash.
- With `!` and:
	- no arguments: returns self, unmodified.
	- arguments: returns self after the given hashes are merged into it / mutates the caller.

<br>

If we have most of the Munster family in an `ages` hash:
```Ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
```
and we want to add a hash with Marilyn and Spot to the existing hash:
```Ruby
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
```

`Hash#merge!(*other_hashes)`
```Ruby
ages.merge!(additional_ages)	# => {"Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237}
```
