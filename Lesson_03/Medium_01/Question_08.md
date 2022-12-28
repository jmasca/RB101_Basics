#### Medium 1 - Question 8:<br><br>

##### Method Calls:

<br>

Given this method:
```ruby
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end
```

Find the result of the following call:
```ruby
puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
```

<br>

**step 1:**

puts rps(rps(`rps("rock", "paper")`, rps("rock", "scissors")), "rock")<br>
 `rps("rock", "paper")	=> "paper"`
 
**result:**
```ruby
puts rps(rps("paper", rps("rock", "scissors")), "rock")
```

<br>

**step 2:**

puts rps(rps("paper", `rps("rock", "scissors")`), "rock")<br>
 `rps("rock", "scissors")    => "rock"`
 
**result:**
```ruby
puts rps(rps("paper", "rock"), "rock")
```

<br>

**step 3:**

puts rps(`rps("paper", "rock")`, "rock")<br>
 `rps("paper", "rock")	=> "paper"`
 
**result:**
```ruby
puts rps("paper", "rock")
```

<br>

**step 4:**

puts `rps("paper", "rock")`<br>
 `rps("paper", "rock")	=> "paper`
 
**result:**
```ruby
puts "paper"
```

<br>

**Output Result:** `paper`
