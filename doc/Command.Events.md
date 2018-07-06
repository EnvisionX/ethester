# Read logs from the blockchain

This command read all emitted logs for one or more smart
contracts and print them to the stdout as JSON array.
Structure of the array described in details at
https://github.com/ethereum/wiki/wiki/JSON-RPC#returns-42

Terminates with exit code 0 on success. Terminate with non zero
exit code on any error (including failed assertions).

## Summary

Run

```
ethester events --help
```

first to see brief usage description and available command line options.

## Example

Lets say you have two smart contracts:

* 0x0e7ced82cf63c867ed4b7ce74ca2ef46bfef3515;
* 0x60aa63d8388b31778c2af6522fc9ea0541e29662.

These addresses stored in files ``c1.addr`` and ``c2.addr`` respectively.

To read all logs for first smart contract, starting from the
generic block and up to the latest mined block, do:

```
ethester events 0 latest @c1.addr
```

To read all logs for both smart contracts, starting from block
12345 and up to block 12350:

```
ethester events 12345 12350 @c1.addr @c2.addr
```

Now lets say source code for these smart contracts is:

```
pragma solidity ^0.4.20;

contract MyCon {
    ...
    event MyEvent1(uint, address);
    event MyEvent2(string);
}
```

You can filter fetched logs by event name like this:

```
ethester events --event MyCon.MyEvent2 12345 12350 @c1.addr
```

Also you can:

* skip a few first logs by using ``--skip`` command line option;
* limit total logs count by using ``--limit`` command line option.

## Assertions

There are a plenty of ``expect`` command line options:

* ``--expect VALUE`` - assert fetched logs count is COUNT;
* ``--expect-gt VALUE`` - assert fetched logs count is greater
 than VALUE;
* ``--expect-ge VALUE`` - assert fetched logs count is greater
 or equal to VALUE;
* ``--expect-lt VALUE`` - assert fetched logs count is less
 than VALUE;
* ``--expect-le VALUE`` - assert fetched logs count is less
 or equal to VALUE;
* ``--expect-json-field ASSERTION`` - assert value of exact field.
 ASSERTION is of format KEY=VALUE, where KEY is dot separated
 path inside JSON document, VALUE is an exact value to test with.
 Example: ``--expect-json-field 0.address=@c1.addr``
 which means ``address`` field of the first fetched log message
 expected to be equal to contents of the file ``c1.addr`` which
 in our case is ``0x0e7ced82cf63c867ed4b7ce74ca2ef46bfef3515``.
