# A custom cop

This custom cop detects the usage of explicit `return` statements inside a `begin...end` block in the context of assignments.

The issue is that `return` inside `begin..end` blocks in assignment contexts will not assign the desired value to the variable, but will return the value expected.

In case you're using memoization, the momoized variable will be always `nil` and the code inside the `begin..end` block will execute as many times as you access the memoized variable. Even if you're using an or-assingment, as the variable will be always `nil`, the code will execute.

In regular assingments, the code after the `begin..end` block will never execute in case of `return` is executed as it'll immediately return the execution flow to the caller instead of just exiting from the `begin..end` block as one might suppose.

### To veryfy the AST tree
```bash
ruby-parse foo.rb
```

### To test the issues
```bash
ruby testcase.rb
```

## How to use it
Require it in your Rubocop.yaml file like this:

```yaml
# Custom cops
require:
- ./rubocop/return_in_begin_end_blocks_not_allowed.rb
```
