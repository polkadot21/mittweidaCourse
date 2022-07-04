// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.0;

contract Calculator {

    address payable public owner;
    uint256 public fee;

    constructor() {
        fee = 1 wei;
        owner = payable(msg.sender);
    }

    modifier isEnoughFunds() {
        require(msg.value >= fee,
            "You do not have enough fees!"
        );
        _;
    }

    modifier isOwner() {

        require(msg.sender == owner,
            "Only owner can execute this!"
        );
        _;
    }


    function calculate(uint256 a, uint256 b) public payable isEnoughFunds returns (uint256 _sum) {
        return a + b;
    }

    function withdraw() public payable isOwner returns (bool success) {

        (bool success, bytes memory data) = owner.call{value: address(this).balance}("");

        return success;
    }

    function getBalance() public view returns (uint balance) {
        return address(this).balance;
    }

}
