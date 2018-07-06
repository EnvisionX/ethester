# Create new Ethereum account

Print address of the created account to the stdout,
terminates with exit code 0 on success. Terminate with non
zero exit code on any error.

## Summary

Run

```
ethester new-account --help
```

first to see brief usage description and available command line options.

## Example

To create new Ethereum account on a connected Geth node, do:

```
ethester new-account -s > account.addr
```

This will write address of the created account to ``account.addr``
file as a plain string.
