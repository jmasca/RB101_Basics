#### Medium 2 - Question 6:<br>

##### Simplify Methods:

Methods will `implicitly` return the result of the last line executed in its definition.

<br>

Given the following code:
```ruby
def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end
```

We can identify a couple of things:
- The method will only return either `true` or `false`.
- The `if/else` statement is the only code inside of the method definition.

<br>

Knowing that methods have implicit return values:
- `color == "blue" || color == "green"` can be evaluated as the only line of code.
- `color == "blue" || color == "green"` will implicitly return its result.

<br>

Therefore, the method definition can be simplified to:
```ruby
def color_valid(color)
  color == "blue" || color == "green"
end
```

###### Note: Both methods will do the exact same thing, the latter is just simplified into an easier to read method definition.
