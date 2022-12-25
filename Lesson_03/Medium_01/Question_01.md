#### Medium 1 - Question 1:<br><br>

##### Outputting Multiple Times (One-liner):
`Integer#times {|i| ...}`
- Takes a block, where `i` represents the integer iteration from 0 to self-1.
- The return value is the given Integer (self).
	- With `5.times {|i| ...}`, `i` will be 0 on the first iteration and 4 on the last iteration (self-1). Returns 5.

Then I used `String#prepend` - Notes: [Easy 1 - Question 6](https://github.com/jmasca/RB101---Programming-Foundations/blob/2664ea2a99338849db4da5cea54c7969cf921a30/Lesson_03/Easy_01/Question_06.md).

<br>

To write a one-line program that creates output 10 times, with the subsequent line indented 1 space to the right:
```ruby
10.times { |i| puts "The Flintstones Rock!".prepend(' ' * i) }
```

This can also be accomplished with the following line:
```ruby
10.times { |i| puts (" " * i) + "The Flintstones Rock!" }
```
