#### Easy 2 Question 4:<br><br>

##### Searching a String:

`String#include?` / `String#match?`

<br>

`String#include?(other_string)`
- Returns `true` if self contains `other_string`, `false` otherwise.



`String#match?(pattern, offset = 0)`
- Returns `true` or `false` based on whether a match is found between self and `pattern`.
- Can take RegExp as an argument.
- If the integer argument `offset` is given, the search begins at index `offset`.

<br>

To see if the name "Dino" appears in the string:
```Ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```

`String#include?(other_string)`:
```Ruby
advice.include?("Dino")		# => false
```

`String#match?(pattern, offset = 0)`:
```Ruby
advice.match?("Dino")		# => false
```

###### Note: These are not perfect solutions as it would match any substring with Dino in it.
