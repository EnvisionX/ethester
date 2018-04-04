pragma solidity ^0.4.20;

contract Contract {

    string public name;
    address public addr;
    uint public number;

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
}
