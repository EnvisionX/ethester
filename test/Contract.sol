pragma solidity ^0.4.20;

contract Contract {

    string public name;
    address public addr;
    uint public number;

    uint public arrA;
    uint public arrL;
    uint[] arrB;

    function Contract(string a, address b, uint c) public {
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
        number = a;
    }

    function setArray(uint a, uint[] b) external {
        arrA = a;
        arrL = b.length;
        arrB = b;
    }

    function getArrayElem(uint i) public view returns (uint) {
        return arrB[i];
    }

    function logSome(uint i, address a, uint b) external {
        emit MyEvent(i, a, b);
    }

    event MyEvent(uint indexed, address indexed, uint);
    event MyEvent2();
}
