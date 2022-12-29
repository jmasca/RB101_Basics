#### Hard 1 - Question 4:<br><br>

`String#split(field_sep = $;, limit = nil)`:<br>
- Returns an array of substrings of `self` that are the result of splitting `self`.
- `self` is split at each occurrence of the given field separator `field_sep`.
- `self` is split at each space character if no argument is provided for `field_sep`.

<br>

The following code needs to be fixed so that:
- The Array size is exactly 4.
- A `false` value is returned when the condition is `false`.

```ruby
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end
```

<br>

**Step 1:**
We need to test the array size after splitting the string:
```ruby
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4	# added code
```

<br>

**Step 2:**
We need to use `return false` to exit the loop rather than `break`:
```ruby
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)		# corrected code
  end
```

<br>

**Final code:**
```ruby
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4
  
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end
```

###### Note: The last line can simply be `true` due to Ruby's implicit return of the last evaluated expression.
