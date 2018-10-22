pragma solidity ^0.4.20;

contract Contract {

    string public name;
    address public addr;
    uint public number;

    uint public arrA;
    uint public arrL;
    uint[] arrB;
    address[] aa;

    function Contract(string a, address b, uint c) public {
        require(c != 99);
        name = a;
        addr = b;
        number = c;
    }

    function () external payable {
        revert();
    }

    function setName(string a) external {
        name = a;
    }

    function setAddr(address a) external {
        addr = a;
    }

    function setNumber(uint a) external {
        require(a != 99);
        number = a;
    }

    function setNumberRevert(uint a) external {
        number = a;
        revert();
    }

    function setArray(uint a, uint[] b) external {
        arrA = a;
        arrL = b.length;
        arrB = b;
    }

    function getArray() public view returns (uint[]) {
        return arrB;
    }

    function getArrayElem(uint i) public view returns (uint) {
        return arrB[i];
    }

    function getAll() public view returns (uint, uint, uint[]) {
        return (arrA, arrL, arrB);
    }

    function setAddrArr(address[] a) external {
        aa = a;
    }

    function getAddrArr() public view returns (address[]) {
        return aa;
    }

    function getArrays(uint n, uint[] a) public pure returns (uint[], uint[]) {
        uint[] memory res1 = new uint[](a.length);
        uint[] memory res2 = new uint[](a.length);
        for (uint i; i < a.length; i++) {
            res1[i] = a[i]*n*2;
            res2[i] = a[i]*n;
        }
        return (res1, res2);
    }

    function logSome(uint i, address a, uint b) external {
        emit MyEvent(i, a, b);
    }

    event MyEvent(uint indexed, address indexed, uint);
    event MyEvent2();
}
