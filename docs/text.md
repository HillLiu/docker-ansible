# Text

## Concat string
* https://stackoverflow.com/questions/31186874/proper-way-to-concatenate-variable-strings

### Clean cli color
```
msg: "{{ cli.stderr_lines | map('regex_replace', '\\\u001b\\[0;m', '') }}"
```
