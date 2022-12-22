#### Easy 1 Question 1:

Expected Output:<br>
1<br>
2<br>
2<br>
3<br>

**Reason:**<br>
`numbers.uniq` is going to return a new array containing elements that are not duplicates, but include the<br>
first occurrence. However, this does not modify the numbers array directly (unless using the `!` bang suffix,<br>
`#uniq!`). When we reach the `#puts` statement it will iterate through each element of the array and print<br>
that element on it's own line.
