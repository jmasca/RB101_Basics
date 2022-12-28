#### Medium 2 - Question 4:<br>

##### Strings vs Arrays when Passed as Arguments (part 2):

<br>

This time we'll start with the following code:
```ruby
def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'syrup'
  an_array_param = ['maple', 'syrup']
end

my_string = "maple"
my_array = ["maple"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```

Our output will be:
```console
My string looks like this now: maplesyrup
My array looks like this now: ["maple"]
```

###### Despite both arguments being treated the same way, our String was modified, but our Array was not.

<br>

##### So why are they behaving differently in our output?
**`String#<<`**:
- This operation is concatenating the new object to self.
	- Ruby uses the same self object that was passed in.
	- Ruby concatenates the desired object to self, mutating self directly.
- `a_string_param` continues to point to the original object.
	- Both `a_string_param` and `my_string` will continue to point to the same, original object.
	- Since they both continue to point to the same object, we see the changes outside of the method definition.

**`Array#=`**:
- This is an assignment operation.
- Assignment operations create a new variable that is locally scoped to where it is created.
- Creating this new variable changes where `an_array_param` points.
	- `an_array_param` now points to a new local/method scoped object.
	- `my_array` continues to point to the original object that was passed in.
- Since they both point at different objects now, we will not see these changes outside of the method definition.
