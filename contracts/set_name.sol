// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract SetName{

    address public owner;
    string public name;

    constructor() {
        owner = msg.sender;
    }

    modifier isOwner() {
        require(owner == msg.sender,
            "This contract can be run by the owner only!");
        _;
    }


    function setName(string memory _name) public isOwner {
        name = _name;
    }
}