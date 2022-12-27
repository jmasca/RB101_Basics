#### Medium 1 - Question 4:<br><br>

##### The Difference Between `Array#<<` and `Array#+`

There is a difference between the two methods given in this question besides the operator chosen.

`Array#<<`:
- Is a destructive method, meaning it will mutate the caller.
- Returns a reference to the object that was passed to the method.

`Array#+`:
- Is not destructive, meaning the caller will remain unmodified.
- Returns a new array object.

To choose which one to use depends on:
- Whether you want the Array being passed to the method to be modified or not.
- Whether you want a new object or a reference to the original object returned.

###### Note: Method 1 returns a meaningful value and has a side effect, this combination should be avoided.
