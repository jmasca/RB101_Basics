#### Easy 1 Question 3:

Replace the word "important" with the word "urgent" in the given string:<br>
```Ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```

##### Solution:
Option 1: `String#sub` will replace the first occurence of the word we want to replace.<br>
Option 2: `String#gsub` will replace all occurrences of the word we want to replace.<br>
Syntax: `String#sub(pattern, replacement)`

Note: Both of these will return a new string. In order to mutate the caller directly we need to include<br>
the `!` bang. (`#gsub!`)

Since there is only one occurrence of the word "important", I'm choosing to use the `String#sub!` method.

```Ruby
advice.sub!('important', 'urgent')
```
