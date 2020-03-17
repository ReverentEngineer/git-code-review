# git-code-review

[![Build Status](https://travis-ci.org/ReverentEngineer/git-code-review.svg?branch=master)](https://travis-ci.org/ReverentEngineer/git-code-review)

A code review tool built into the git objects.

# Usage

```
git code-review list [--closed]
git code-review open <name> <commit> <commit>
git code-review close <name>
git code-review view <name>
```

# List Code Reviews

To see open code reviews:
```
git code-review list
```

To see previous closed closed reviews:
```
git code-review list --closed
```

# Opening A Code Review

First, a code review author would run:
```
git code-review open <name> <first sha> <last sha>
```

It will then prompt the user for a code review message.

# Close A Code Review

After a code review is over, the code reviw author would run:
```
git code-review close <name>
```

# View A Code Review

 A code reviewer would run:
```
git code-review view <name>
```

The tool will iterate through all the diff hunks as well as comments. 
During each hunk or comment, a user will be prompted to (c)omment (s)skip or 
(q)uit.

