#### Easy 1 Question 5:<br><br>

##### Ruby's Range Class:

- `Range` objects represent a collection of values that are between given begin and end values `(1..3)` or `(1...3)`.
- `..` is used to include the given end value, `(1..5)`.
- `...` is used to exclude the given end value, `(1...5)`.
- `Range` objects can be beginless: `(..5)` or endless: `(1..)` - both of which may be used to slice an array.
<br>

`Range#include?(obj)` will return `true` if the obj is an element of self, `false` otherwise.<br>
`Range#cover?(obj)` will return `true` if the given argument is within self, `false` otherwise.<br><br>

If begin and end are numeric, `#include?` and `#cover?` will behave the same:
```Ruby
(1..3).include?(1.5)	# => true
(1..3).cover?(1.5)	# => true
```
But when they're not numeric the two methods may differ:
```Ruby
('a'..'d').include?('cc')	# => false
('a'..'d').cover?('cc')		# => true
```
<br><br>
To determine if 42 lies between 10 and 100:
```Ruby
(10..100).include?(42)	# => true
(10..100).cover?(42)	# => true
