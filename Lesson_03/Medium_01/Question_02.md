#### Medium 1 - Question 2:<br><br>

##### Concatenation and Interpolation:

`String#+`
- `string` + `other_string` returns a new concatenated string.
	- `"Hello" + " there."	=> "Hello there."`
- Leaves the caller unmodified.

<br>

`#to_s`
- Returns self converted into a string, or self if self is already a string.
	- `9.to_s	=> "9"`
- Leaves the caller unmodified.

<br>

`interpolation #{}`
- Used to include other variables, values, expressions, or results inside of a string.
- Acts as a placeholder that references the object.
- Must use double-quotes `""` to utilize string interpolation.
	- `"2 + 2 is #{2 + 2}"`

<br><br>

The following statement returns an error:
```ruby
puts "the value of 40 + 2 is " + (40 + 2)
```

###### Why? Because string concatenation only works between strings.

<br>

Two ways to fix the concatenation error:

`#to_s`:
```ruby
puts "the value of 40 + 2 is " + (40 + 2).to_s
```

`interpolation #{}`:
```ruby
puts "the value of 40 + 2 is #{40 + 2}"
```
