# Get byte code of deployed smart contract from the blockchain

Print byte code of deployed smart contract to the stdout.
Terminates with exit code 0 on success. Terminate with non
zero exit code on any error.

## Summary

Run

```
ethester get-code --help
```

first to see brief usage description and available command line options.

## Example

Assume you're already have deployed smart contract at address
0x0e7ced82cf63c867ed4b7ce74ca2ef46bfef3515.

To get the byte code as hex, do:

```
ethester get-code --hex 0x0e7ced82cf63c867ed4b7ce74ca2ef46bfef3515
```

To get the byte code as JSON string, do:

```
ethester get-code --json 0x0e7ced82cf63c867ed4b7ce74ca2ef46bfef3515
```

To get the byte code as native binary, do:

```
ethester get-code --bin 0x0e7ced82cf63c867ed4b7ce74ca2ef46bfef3515
```
