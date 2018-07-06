# Send some Ether from one account to another

Send funds from one Ethereum account to another. Terminates
with exit code 0 on success. Terminate with non zero exit code
on any error.

## Summary

Run

```
ethester send --help
```

first to see brief usage description and available command line options.

## Example

Suppose you have two accounts:

* 0x0e7ced82cf63c867ed4b7ce74ca2ef46bfef3515 - have 3 Ether on balance;
* 0x60aa63d8388b31778c2af6522fc9ea0541e29662.

To send 0.01 ether, do:

```
ethester send 0x0e7ced82cf63c867ed4b7ce74ca2ef46bfef3515 0x60aa63d8388b31778c2af6522fc9ea0541e29662 10finney
```

## Diagnostics

When *info* loglevel is enabled, _Ethester_ will print short transaction receipt to the stderr, like follows:

```
export ETHESTER_LOGLEVEL=info
ethester send @acc1.addr @acc2.addr 10finney
2018-09-04 04:22:41 ethester     INFO transaction info:
     block:      1234
     block hash: 0xe6d7212a4b3c4a0c46768e91667a371ca2bb8a8c80e638f6b9c3f4172aefe177
     tx hash:    0xd0ebfc5ae8ad3f524bad9661f7e056b84b54aa25a7fe8804485fc0d498de8548
     gas used:   21000
     status:     0x1 - OK
```

To write transaction receipt as JSON object to a file, use *--write-receipt* command line option.
