#### Hard 1 - Question 1:<br><br>

##### Uninitialized Variables:

Whenever a variable is called before it is initialized (assigned to an initial value) there will be an "undefined local variable or method" error.<br>
###### * A variable must be initialized before it can be used. *

<br>

What happens in the last line of this code?
```ruby
if false
  greeting = "hello world"
end

greeting
```

<br>



`if false`:
- Initializes the `greeting` variable to the string `"hello world"`.
- Will never run due to the condition being `false`.

`greeting`:
- Per the code, the `if` statement never runs, thus it does not initialize the `greeting` variable.
- Per the rule above, a variable must be assigned/initialized before it can be used or an exception will be raised.

- ***However***, when a local variable is initialized within an `if` clause, even if that `if` clause is never executed, the local variable is initialized to `nil`.

- **Therefore:**
	- The `if` statement never executes.
	- The `greeting` variable is initialized to `nil`.
	- No errors or exceptions are raised.
