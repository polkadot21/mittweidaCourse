// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";

contract Owner{

    address private owner;

    event ownerSet(address indexed oldOwner, address indexed newOwner);

    modifier isOwner() {

        require(msg.sender == owner,
        "This can be run only by owner!");
        _;
    }

    constructor() {
        owner = msg.sender;
        console.log(address(0));
        emit ownerSet(address(0), owner);
    }


    function changeOwner(address newOwner) public isOwner {
        console.log("msg.sender :", msg.sender);
        emit ownerSet(owner, newOwner);
        owner = newOwner;
    }

}