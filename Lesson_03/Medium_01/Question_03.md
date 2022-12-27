#### Medium 1 - Question 3:<br><br>

`while` loop:
- Executes the loop while a condition is true.

`% - modulo`:
- Used to determine if there is a remainder as a result of a division.
- If there is no remainder (modulo is 0) that means the number is an integer.

<br>

To correct the method in this question we'll use a while loop:
```ruby
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
```

<br>

Bonus 1:
Using the `%` will tell us if the result of the division is an integer value (no remainder).

Bonus 2:
Line 8 is used as the implicit return value for the method. Without this line the method will return nil rather than the factors array.
