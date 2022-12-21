#### Easy 1 Question 1:

Expected Output:<br>
1<br>
2<br>
2<br>
3<br>

**Reason:**<br>
`numbers.uniq` is going to return a new array containing elements that are not duplicates,<br>
but include the first occurrence. However, this does not modify the numbers array directly<br>
(unless using the `!` bang suffix, `#uniq!`). When we reach the `#puts` statement it will<br>
iterate through each element and print that element on it's own line.
