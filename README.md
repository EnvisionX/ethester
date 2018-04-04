# Command line interface to Ethereum node web3 API

## Summary

_Ethester_ is a command line tool which can be used to automate
and/or test tasks like:

* create new accounts;
* check account's balance;
* send ether from one account to another;
* deploy new contract;
* call contract's public and/or external methods.

## Requirements

* python 2.7;
* _Ethester_ cannot work alone. Every command invocation (except for
``-h/--help`` option) requires running ``geth`` node and ``geth.ipc``
socket readable and writable by current user. Last version of ``geth``
can be found [here](https://github.com/ethereum/go-ethereum/);
* probably, you'll need
[Solidity compiler](https://github.com/ethereum/solidity)
in order to work with smart contracts.

## Installation

Install _Ethester_ executable to ``/usr/bin/``:

```
sudo make install
```

## Synopsis and usage

In general, _Ethester_ command syntax is:

```
ethester [common_options] command [command_options] [command_args] [expectations]
```

For more details type

```
ethester --help
```

## Using _Ethester_ for testing

Good example can be used in ``test/Makefile``.

## License

2-clause BSD. Full license text can be found in ``LICENSE`` file.

## Run unit tests

Requirements:

* geth - [go-ethereum](https://github.com/ethereum/go-ethereum/) executable;
* solc - [Solidity compiler](https://github.com/ethereum/solidity).

To run tests type:

```
make test
```
