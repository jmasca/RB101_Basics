#### Medium 2 - Question 1:<br><br>

**`object_id`:**
- Returns a numerical value that uniquely identifies the object it was called on.
- Can be used to determine whether two variables are pointing to the same object.

With the following code:
```ruby
a = "forty two"
b = "forty two"
c = a

puts a.object_id
puts b.object_id
puts c.object_id
```

`a` and `c` are both referencing the same object, but `b` is representing its own object.

<br>

#### Medium 2 - Question 2:<br><br>

With this code:
```ruby
a = 42
b = 42
c = a

puts a.object_id
puts b.object_id
puts c.object_id
```

`a`, `b`, and `c` are all referencing the same object.

##### Explanation:
- Integers are immutable and each integer is a single immutable object.
- There can always only be one object per integer; one integer `1` object, one integer `2` object, etc.
- Any operation on an integer returns a new integer object.
