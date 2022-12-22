#### Easy 1 Question 2:

###### The difference between `!` and `?` in Ruby:

In the following scenarios:

1. `!=` is an equality operator and more specifically, the 'not equal to' operator. You would use it in a<br>
conditional statement when you wanted to test that some *thing* was not equal to another *thing*.

2. putting `!` before something, like `!user_name` is asking for the opposite of what boolean value it<br>
currently holds. It is used to turn any object into the opposite of their boolean value equivalent.

3. putting `!` after something, like `words.uniq!` is considered the bang suffix. When it's after a method<br>
name it is often used to identify that that method is mutating its caller, but `!` is only part of the name<br>
and does not necessarily mean its mutating the caller.

4. `?` before something is the fastest way to write a string of a single character. If you want a single<br>
character string simply use `?c`, where `c` represents any single character, and the return value will be the<br>
characters string representation (ie. "c").<br>
`?` can also be used as part of the ternary if...else. The full syntax for a ternary if...else is:<br>
`expressions ? if true : else false`

5. `?` after something, specifically a method, will usually indicate that the method is going to return a<br>
boolean value, `true` or `false`. However, again, the `?` will only be a part of the method name and does not<br>
necessarily mean this is how the method will behave.

6. `!!` before something, like `!!user_name` is used to turn any object into their boolean value equivalent.
