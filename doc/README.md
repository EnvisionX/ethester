# Ethester documentation

## Synopsis and usage

In general, _Ethester_ command syntax is:

```
ethester [common_options] command [command_options] [command_args] [expectations]
```

## Configuration

All available settings for ``ethester`` executable described in a table below:

Environment variable name | Command line option | Units, valid values | Default value | Description
--- | --- | --- | --- | ---
`ETHESTER_LOGLEVEL` | `--loglevel` | debug, info, warning, error, critical | info | logging threshold
`ETHESTER_GETH_IPC` | `--ipc` | | ~/.ethereum/geth.ipc | path to a IPC socket of running ``Geth`` node
`ETHESTER_CONTRACT_PATH` | `--contract-path` | | .:build:contracts | colon separated paths to a directory where compiled smart contract and their ABIs are searched
`ETHESTER_TIMEOUT` | `--timeout` | uint, seconds | 120 | how long to wait for a particular Ethereum transaction to be mined
`ETHESTER_GETH_TIMEOUT` | `--geth-timeout` | uint, seconds | timeout x2 | how long to wait for a response from ``Geth`` node
`ETHESTER_GAS_LIMIT` | `--gas-limit` | uint | 21000 for send, 5000000 for deploy/call | gas limit for transaction
`ETHESTER_GAS_PRICE` | `--gas-price` | ether | 2gwei | gas price
`ETHESTER_ACCOUNT_PASSWORD` | `--password` | | | password to unlock account for transaction
`ETHESTER_DUMP_DIR` | `--dump-dir` | path | | if set, all transaction scripts will be dumped to this directory

Note command line options take precedence over values defined in environment variables.

## Arguments substitution

_Ethester_ can substitute options/arguments values with contents of a file.
It works with all options and arguments. For example:

```
ethester balance 0x60aa63d8388b31778c2af6522fc9ea0541e29662
```

and

```
echo 0x60aa63d8388b31778c2af6522fc9ea0541e29662 > tmp/account.addr
ethester balance @tmp/account.addr
```

are the two ways of doing the same thing.

With this feature you can save output of one ethester run to a file and
use this file as an argument to later ethester invocation.

## Numeric arguments format

By default all numbers are treated as big 256bit integers. Default unit is ``wei``. This can be changed using suffixes, for example:

* 1 -> 1;
* 1wei -> 1;
* wei -> 1;
* 23szabo -> 23000000000000;
* szabo -> 1000000000000;
* 3ether -> 3000000000000000000;
* ether -> 1000000000000000000.

All valid units listed below:

Unit | Factor | Amount in wei
--- | --- | ---
wei        | 10^0 | 1
kwei       | 10^3 | 1000
ada        | 10^3 | 1000
femtoether | 10^3 | 1000
mwei       | 10^6 | 1000000
babbage    | 10^6 | 1000000
picoether  | 10^6 | 1000000
gwei       | 10^9 | 1000000000
shannon    | 10^9 | 1000000000
nanoether  | 10^9 | 1000000000
nano       | 10^9 | 1000000000
szabo      | 10^12 | 1000000000000
microether | 10^12 | 1000000000000
micro      | 10^12 | 1000000000000
finney     | 10^15 | 1000000000000000
milliether | 10^15 | 1000000000000000
milli      | 10^15 | 1000000000000000
ether      | 10^18 | 1000000000000000000
kether     | 10^21 | 1000000000000000000000
grand      | 10^21 | 1000000000000000000000
einstein   | 10^21 | 1000000000000000000000
mether     | 10^24 | 1000000000000000000000000
gether     | 10^27 | 1000000000000000000000000000
tether     | 10^30 | 1000000000000000000000000000000

## Example initial configuration

Lets assume you already have _Ethester_ installed into your ``/usr/bin``.
As far as it doesn't need any extra dependencies except Python (2.x), it
can be easily accomplished with

```
sudo cp ethester /usr/bin/
```

Now you have to point _Ethester_ to IPC socket file of running geth node. You
can do it supplying ``--ipc FILE`` option to each ``ethester`` invocation, but
much more convenient is to export environment variable:

```
export ETHESTER_GETH_IPC=/path/to/geth.ipc
```

Another useful setting is a path to compiled smart contracts and their ABIs.
There are two options too:

1. Give ``--contract-path COLON_SEPERATED_PATHS`` command line option on
 each ``ethester`` invocation;
2. Export environment variable like one below:

```
export ETHESTER_CONTRACT_PATH=/my/dir1:/my/dir2
```

Logging. By default _Ethester_ logs only warnings, errors and critical errors.
If you're going to do some assertions on returned values, these diagnostics
will not be shown unless ``info`` loglevel is set. Ethereum transaction receipts
are printed only when loglevel is at least ``info``. Two options:

1. Give ``--loglevel info`` command line option on each ``ethester`` invocation;
2. Export environment variable:

```
export ETHESTER_LOGLEVEL=info
```

## Commands

* [new-account](Command.NewAccount.md) - create new Ethereum account;
* [balance](Command.Balance.md) - get balance for account or smart contract;
* [accounts](Command.Accounts.md) - list accounts stored in a Geth node;
* [exec](Command.Exec.md) - execute custom JavaScript code on Geth node;
* [deploy](Command.Deploy.md) - deploy smart contract;
* [call](Command.Call.md) - call public method of a deployed smart contract
 without issuing a transaction;
* [send](Command.Send.md) - send some Ether from one account to another;
* [tran](Command.Tran.md) - call external method of a deployed smart
 contract, issuing a new transaction;
* [get-code](Command.GetCode.md) - get byte code of deployed smart contract;
* [events](Command.Events.md) - fetch events (logs) from the blockchain.
