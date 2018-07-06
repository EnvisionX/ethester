.PHONY: all clean

export HOME = $(shell pwd)
export ETHESTER_GETH_IPC = run/geth.ipc
export ETHESTER_CONTRACT_PATH = run/
export ETHESTER_LOGLEVEL = info

all: clean
	mkdir -p run
	solc -o run --bin --abi Contract.sol
	nohup geth --datadir=run --dev >> run/geth.log 2>&1 & echo $$! > run/pid
	sleep 3s
	../ethester exec "miner.start()" null && sleep 5s
	../ethester exec "eth.accounts[0]" -s > run/acc1
	../ethester balance @run/acc1 --expect-gt 3ether
	../ethester balance @run/acc1 --expect-ge 3ether
	! ../ethester balance @run/acc1 --expect 2ether
	! ../ethester balance @run/acc1 --expect-lt 3ether
	! ../ethester balance @run/acc1 --expect-le 3ether
	../ethester new-account -s > run/acc2
	../ethester balance @run/acc2 --expect 0
	../ethester send @run/acc1 @run/acc2 10ether
	../ethester balance @run/acc2 --expect 10ether
	../ethester deploy @run/acc2 Contract str1 @run/acc1 2ether -s > run/contract
	../ethester call @run/contract Contract.name --expect str1
	! ../ethester call @run/contract Contract.name --expect str2
	../ethester call @run/contract Contract.addr --expect @run/acc1
	! ../ethester call @run/contract Contract.addr --expect @run/acc2
	../ethester call @run/contract Contract.number --expect 2ether
	../ethester call @run/contract Contract.number --expect 2000milli
	! ../ethester call @run/contract Contract.number --expect 3ether
	../ethester call @run/contract Contract.number --expect-gt 1999milli
	! ../ethester call @run/contract Contract.number --expect-gt 2000milli
	../ethester call @run/contract Contract.number --expect-ge 2ether
	! ../ethester call @run/contract Contract.number --expect-ge 2001milli
	../ethester call @run/contract Contract.number --expect-lt 2001milli
	! ../ethester call @run/contract Contract.number --expect-lt 2000milli
	../ethester call @run/contract Contract.number --expect-le 2ether
	! ../ethester call @run/contract Contract.number --expect-le 1999milli
	../ethester tran @run/acc2 @run/contract Contract.setName str2
	../ethester call @run/contract Contract.name --expect str2
	! ../ethester call @run/contract Contract.name --expect str1
	../ethester tran @run/acc2 @run/contract Contract.setAddr @run/acc2
	../ethester call @run/contract Contract.addr --expect @run/acc2
	! ../ethester call @run/contract Contract.addr --expect @run/acc1
	../ethester tran @run/acc2 @run/contract Contract.setNumber 3ether
	../ethester call @run/contract Contract.number --expect 3ether
	../ethester call @run/contract Contract.number --expect 3000milli
	! ../ethester call @run/contract Contract.number --expect 2ether
	! ../ethester call @run/contract Contract.number --expect 2000milli
	../ethester tran @run/acc2 @run/contract Contract.setNumber 123456789012345678901234567890
	../ethester call @run/contract Contract.number --expect 123456789012345678901234567890
	../ethester tran @run/acc2 @run/contract Contract.setNumberRevert 123
	../ethester call @run/contract Contract.number --expect 123456789012345678901234567890
	../ethester tran @run/acc2 @run/contract Contract.setArray gwei
	../ethester call @run/contract Contract.arrA --expect gwei
	../ethester call @run/contract Contract.arrL --expect 0
	../ethester tran @run/acc2 @run/contract Contract.setArray 2gwei 10
	../ethester call @run/contract Contract.arrA --expect 2gwei
	../ethester call @run/contract Contract.arrL --expect 1
	../ethester call @run/contract Contract.getArrayElem 0 --expect 10
	../ethester tran @run/acc2 @run/contract Contract.setArray 3gwei 5wei 6wei 7wei
	../ethester call @run/contract Contract.arrA --expect 3gwei
	../ethester call @run/contract Contract.arrL --expect 3
	../ethester call @run/contract Contract.getArrayElem 0 --expect 5wei
	../ethester call @run/contract Contract.getArrayElem 1 --expect 6wei
	../ethester call @run/contract Contract.getArrayElem 2 --expect 7wei
	../ethester tran @run/acc2 @run/contract Contract.setArray 0 \
		1234567890123456789012345678901234567890123456789 \
		2345678901234567890123456789012345678901234567890 \
		3456789012345678901234567890123456789012345678901
	../ethester call @run/contract Contract.getArray \
		--expect-json-field 0=1234567890123456789012345678901234567890123456789
	! ../ethester call @run/contract Contract.getArray \
		--expect-json-field 0=12345678901234567890123456789012345678901234567890
	../ethester call @run/contract Contract.getArray \
		--expect-json-field 1=2345678901234567890123456789012345678901234567890
	! ../ethester call @run/contract Contract.getArray \
		--expect-json-field 1=23456789012345678901234567890123456789012345678901
	../ethester call @run/contract Contract.getArray \
		--expect-json-field 2=3456789012345678901234567890123456789012345678901
	! ../ethester call @run/contract Contract.getArray \
		--expect-json-field 2=34567890123456789012345678901234567890123456789012
	../ethester call @run/contract Contract.getAll \
		--expect-json-field 0=0
	../ethester call @run/contract Contract.getAll \
		--expect-json-field 1=3
	../ethester call @run/contract Contract.getAll \
		--expect-json-field 2.0=1234567890123456789012345678901234567890123456789
	../ethester call @run/contract Contract.getAll \
		--expect-json-field 2.1=2345678901234567890123456789012345678901234567890
	../ethester call @run/contract Contract.getAll \
		--expect-json-field 2.2=3456789012345678901234567890123456789012345678901
# test events API
	../ethester tran @run/acc2 @run/contract Contract.logSome 1 @run/acc2 3
	../ethester events -10 latest @run/contract --nice
	../ethester events 0 latest @run/contract --quiet --expect 1
	../ethester events 0 latest @run/contract --quiet --expect-ge 1
	../ethester events 0 latest @run/contract --quiet --expect-ge 0
	../ethester events 0 latest @run/contract --quiet --expect-gt 0
	../ethester events 0 latest @run/contract --quiet --expect-le 1
	../ethester events 0 latest @run/contract --quiet --expect-le 2
	../ethester events 0 latest @run/contract --quiet --expect-lt 2
	../ethester events 0 latest @run/contract --quiet --expect 0 --skip 1
	../ethester events 0 latest @run/contract --quiet --expect 0 --limit 0
	../ethester events 0 latest @run/contract --field 0.topics.0 > run/topic.json
	../ethester events 0 latest @run/contract --quiet --expect-json-field 0.topics.0=@run/topic.json
	../ethester events 0 latest @run/contract --event Contract.MyEvent --quiet --expect 1
	../ethester events 0 latest @run/contract --event Contract.MyEvent2 --quiet --expect 0
	! ../ethester events 0 latest @run/contract --event Contract.MyEvent3
	$(MAKE) clean

clean:
	test -f run/pid && kill -9 `cat run/pid` || true
	rm -rf -- run
