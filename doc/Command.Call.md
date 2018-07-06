# Call smart contract public method, without transaction

Print method returned value (or values) to the stdout,
terminates with exit code 0 on success. Terminate with non zero
exit code on any error (including failed assertions).

## Summary

Run

```
ethester call --help
```

first to see brief usage description and available command line options.

## Example

Lets say you have Solidity contract, deployed
at address 0x0e7ced82cf63c867ed4b7ce74ca2ef46bfef3515:

```
pragma solidity ^0.4.20;

contract MyCon {
    uint public myConst;
    function MyCon(uint a) public {
        myConst = a;
    }
    function calc(uint b) public view returns (uint) {
        return a * b;
    }
}
```

Assume it already compiled to bytecode and ABI to directory _/home/user/mycontracts_.

First, deploy the contract and save its address
to the ``contract.addr`` file:

```
$ ethester deploy @account.addr MyCon 4 -s > contract.addr
```

Now we're calling MyCon.calc() public method:

```
$ ethester call @contract.addr MyCon.calc 5
20
```

Result of the method call is printed to the stdout as JSON.

## Assertions

* ``--expect VALUE`` - assert text representation of returned
 value equals to VALUE;
* ``--expect-gt VALUE`` - assert returned value is number and is
 greater than VALUE;
* ``--expect-ge VALUE`` - assert returned value is number and is
 greater or equal to VALUE;
* ``--expect-lt VALUE`` - assert returned value is number and is
 less than VALUE;
* ``--expect-le VALUE`` - assert returned value is number and is
 less or equal to VALUE;
* ``--expect-json-field ASSERTION`` - can be used when method
 returns more than one value or an array. ASSERTION is of
 format KEY=VALUE, where KEY is dot separated path inside
 JSON document, VALUE is an exact value to test with. Example:
 ``--expect-json-field 1=3`` which means returned value is
 expected to be an array and second element of the array
 expected to be ``3``.
