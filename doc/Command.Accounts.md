# List addresses of accounts from Geth node key storage

Print addresses to the stdout, terminates with exit code 0
on success. Terminate with non zero exit code on any error.

## Summary

Run

```
ethester accounts --help
```

first to see brief usage description and available command line options.

## Example

To list available accounts as plain text, one address per line, do:

```
ethester accounts
```

To list available accounts as JSON array, do:

```
ethester accounts --json
```
