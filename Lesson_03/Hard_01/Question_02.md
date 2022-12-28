#### Hard 1 - Question 2:<br><br>

What happens on line 6:
```ruby
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings
```

<br>

Solution:
- `Hash[key]` returns the `value` associated with the given `key` (or `nil` if the `key` isn't found).
- Assigning this `value` creates a reference to that specific `value`.
- As we learned, the `<<` operator will mutate its caller (the referenced object).
- Therefore, using `<<` on `informal_greeting` will mutate the value it references: `greetings[:a]`.
- Line 6 Output: `{:a=>"hi there"}`

<br>

Options if you only wanted to modify the value of `informal_greeting`:
1. `informal_greeting` can be initialized to reference a new object holding the same value as `greetings[:a]`:
	- `informal_greeting = greetings[:a].clone`
	- `clone` will return a clone of the value held at `greetings[:a]` and reference a new object.
2. `String#+` can be used on `informal_greeting` rather than `<<`:
	- `informal_greeting = greetings[:a]`
	-  `informal_greeting = informal_greeting + " there"`
	- `String#+` returns a new String object.
	- If you wanted to you could also use `String#+` on the initialization of `informal_greeting`:
		- `informal_greeting = greetings[:a] + " there"`
