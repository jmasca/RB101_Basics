#### Easy 1 Question 2:

###### The difference between `!` and `?` in Ruby:

In the following scenarios:

1. `!=` is an equality operator and more specifically, the `not equal to` operator. You<br>
would use it in a conditional statement when you wanted to test that some *thing* was not<br>
equal to another *thing*.

2. putting `!` before something, like `!user_name` is asking for the opposite of what<br>
boolean value it currently holds. It is used to turn any object into the opposite of their boolean value equivalent.

3. putting `!` after something, like `words.uniq!` is considered the `bang suffix`. When<br>
it's after a method name it is often used to identify that that method is mutating its caller, but `!` is only part of the name and does not necessarily mean its mutating the caller.

4. `?` before something is the fastest way to write a string of a single character. If you<br>
want a single character string simply use `?c`, where `c` represents any single character,<br>
and the return value will be the characters string representation (ie. "c").<br>
`?` can also be used as part of the ternary if...else.<br>
The full syntax for a ternary if...else is: `expressions ? if true : else`

5. `?` after something, specifically a method, will usually indicate that the method is going<br>
to return a boolean value, `true` or `false`. However, again, the `?` will only be a part of<br>
the method name and does not necessarily mean this is how the method will behave.

6. `!!` before something, like `!!user_name` is used to turn any object into their boolean value equivalent.
