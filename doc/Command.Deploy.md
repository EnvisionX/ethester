# Deploy smart contract to network

Print deployed smart contract address to the stdout,
terminates with exit code 0 on success. Terminate with non zero
exit code on any error.

## Summary

Run

```
ethester deploy --help
```

first to see brief usage description and available command line options.

## Example

Lets say you have Solidity contract:

```
pragma solidity ^0.4.20;

contract MyCon {
    string public name;
    address public addr;
    uint public number;
    uint[] arrB;
    function MyCon(string a, address b, uint c, uint[] d) public {
        name = a;
        addr = b;
        number = c;
        arrB = d;
    }
}
```

Assume it already compiled to bytecode and ABI to directory _/home/user/mycontracts_.

So, to deploy the contract to the network:

```
export ETHESTER_CONTRACT_PATH=/home/user/mycontracts
ethester deploy 0x60aa63d8388b31778c2af6522fc9ea0541e29662 MyCon myString 0x0e7ced82cf63c867ed4b7ce74ca2ef46bfef3515 123456 1 2 3 4 5
```

Where:
* 0x60aa63d8388b31778c2af6522fc9ea0541e29662 - account address used to sign the transaction;
* myString - value for first constructor parameter (string);
* 0x0e7ced82cf63c867ed4b7ce74ca2ef46bfef3515 - value for second constructor parameter (Ethereum address);
* 123456 - value for third constructor parameter (uint);
* 1, 2, 3, 4, 5 - values for fourth constructor parameter (array of uint)

Will print JSON string to the stdout on success. If you want to output result as a plain string, give "-s" ("--string") command line option.

## Diagnostics

When *info* loglevel is enabled, _Ethester_ will print short transaction receipt to the stderr, like follows:

```
export ETHESTER_LOGLEVEL=info
ethester deploy @run/account.addr MyContract -s > run/contract.addr
2018-09-04 04:22:41 ethester     INFO transaction info:
     block:      1234
     block hash: 0xe6d7212a4b3c4a0c46768e91667a371ca2bb8a8c80e638f6b9c3f4172aefe177
     tx hash:    0xd0ebfc5ae8ad3f524bad9661f7e056b84b54aa25a7fe8804485fc0d498de8548
     gas used:   1820033
     status:     0x1 - OK
     address:    0x68ddbd0e22052d1bf09e52103b349a6819b3eb8e
```

To write transaction receipt as JSON object to a file, use *--write-receipt* command line option.
