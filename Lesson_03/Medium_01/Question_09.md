#### Medium 1 - Question 9:<br><br>

##### More Method Calls:

<br>

Given these methods:
```ruby
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end
```

Find the return value of:
```ruby
bar(foo)
```

<br>

**Result:**<br>
`"no"` is what will be returned.

**Why?**
- `foo` is always going to return `"yes"` because that's the methods only line of code.
- Inside of `bar`, the result of `param == "no"` will be `false` since we're passing in a `yes`.
- Therefore, `"no"` is what we get as a return value.
