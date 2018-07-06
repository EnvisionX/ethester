# Execute custom JavaScript code on Geth node

Print returned value to the stdout, terminates with exit
code 0 on success. Terminate with non zero exit code on any
error (including failed expectations).

## Summary

Run

```
ethester exec --help
```

first to see brief usage description and available command line options.

## Example

```
$ ethester exec 3
3

$ ethester exec eth.blockNumber
6323433

$ ethester exec 'eth.getBalance(eth.accounts[1])'
1100000000
```
