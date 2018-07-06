# Call smart contract public method, issuing a transaction

Issue a transaction to the Ethereum network, calling external
public method of a deployed smart contract.
Terminates with exit code 0 on success. Terminate with non
zero exit code on any error.

## Summary

Run

```
ethester tran --help
```

first to see brief usage description and available command line options.

## Example

Lets say you have Solidity contract, deployed
at address 0x0e7ced82cf63c867ed4b7ce74ca2ef46bfef3515:

```
pragma solidity ^0.4.20;

contract MyContract {
    uint public myVar;
    function MyContract(uint a) public {
        myVar = a;
    }
    function setN(uint b) external {
        myVar = b;
    }
}
```

Assume it already compiled to bytecode and ABI to directory _/home/user/mycontracts_.

First, deploy the contract and save its address
to the ``contract.addr`` file:

```
$ ethester deploy @account.addr MyContract 4 -s > contract.addr
```

Now we're calling MyCon.setN(uint) public method:

```
$ ethester tran @account.addr @contract.addr MyContract.setN 5
```

On success ``myVar`` internal variable of the smart contract
will change its value from initial 4 to new 5.

## Diagnostics

When *info* loglevel is enabled, _Ethester_ will print short transaction receipt to the stderr, like follows:

```
export ETHESTER_LOGLEVEL=info
ethester tran @account.addr @contract.addr MyContract.setN 5
2018-09-04 04:22:41 ethester     INFO transaction info:
     block:      1234
     block hash: 0xe6d7212a4b3c4a0c46768e91667a371ca2bb8a8c80e638f6b9c3f4172aefe177
     tx hash:    0xd0ebfc5ae8ad3f524bad9661f7e056b84b54aa25a7fe8804485fc0d498de8548
     gas used:   23454
     status:     0x1 - OK
```

To write transaction receipt as JSON object to a file, use *--write-receipt* command line option.
