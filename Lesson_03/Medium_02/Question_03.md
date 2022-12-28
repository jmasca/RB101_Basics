#### Medium 2 - Question 3:<br>

##### Strings vs Arrays when Passed as Arguments (part 1):

<br>

We'll start with the following code:
```ruby
def tricky_method(a_string_param, an_array_param)
  a_string_param += "syrup"
  an_array_param << "syrup"
end

my_string = "maple"
my_array = ["maple"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```

Our output will be:
```console
My string looks like this now: maple
My array looks like this now: ["maple", "syrup"]
```

###### Despite both arguments being treated the same way, our String was not modified, but our Array was.

<br>

##### What happens?
- Ruby passes the arguments "by value", but the value passed is a reference to some object.
	- The string argument is passed as a reference to an object of type String.
	- The array argument is passed as a reference to an object of type Array.
- When the reference is passed, two things happen:
	- The method initializes new local variables for both the string and the array.
	- Each reference is assigned to its respective new local variable.
	- ###### Note: These new local variables have method scope and only live within the scope of the method definition.

<br>

##### So why are they behaving differently in our output?
**`String#+=`**:
- This operation is re-assignment and creates a **new String object.**
- The new String object is assigned to the local/method variable `a_string_param`.
- The local/method variable `a_string_param` now points to "maplesyrup", not "maple".
	- This means `my_string` and `a_string_param` no longer point to the same object.
	- Since they no longer point to the same object, we do not see these changes outside of the method definition.

**`Array#<<`**:
- One Array object can have any number of elements.
- When we attach an additional element using the `<<` operator:
	- Ruby continues to use the same object that was passed in.
	- Ruby appends the new element to the object passed in.
- `an_array_param` continues to point to the original object.
	- Both `my_array` and `an_array_param` still point to the same, original object.
	- Since they both continue to point to the same object, we see the changes outside of the method definition.
