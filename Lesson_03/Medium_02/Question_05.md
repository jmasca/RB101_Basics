#### Medium 2 - Question 5:<br>

##### Strings vs Arrays when Passed as Arguments (part 3):

It can be difficult to predict what is going on when modifying objects inside of a method.

<br>

Given this code:
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

How can we change it so that there are no mutations inside of the method, but:
- `my_string` becomes: `"maplesyrup"`
- `my_array` becomes: `["maple", "syrup"]`

<br>

##### Step 1:<br>
Inside of the method, make sure neither operation is mutating the original.
```ruby
a_string_param += "syrup"
an_array_param += ["syrup"]
  ```

###### Both of these are assignment operations and will create new objects.

<br>

##### Step 2:<br>
Since `a_string_param` and `an_array_param` are now pointing to new objects:
```ruby
return a_string_param, an_array_param
```

###### We return the new objects back to the original code outside of the method (next, we'll reassign them there).

<br>

##### Step 3:<br>
Add an assignment statement before the method call:
```ruby
my_string, my_array = tricky_method(my_string, my_array)
```

###### `my_string` and `my_array` are reassigned to the new objects that are returned from the method.<br>
###### This will cause both variables to point to/reference the new objects from the method and discard their previously referenced objects.

<br>

The new code altogether will look something like:
```ruby
def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "syrup"
  an_array_param += ["syrup"]

  return a_string_param, an_array_param
end

my_string = "maple"
my_array = ["maple"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```

The output:
```console
My string looks like this now: maplesyrup
My array looks like this now: ["maple", "syrup"]
```

###### Note: Again, neither of these were mutated inside of the method, but both values have been altered.
