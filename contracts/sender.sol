pragma solidity 0.8.13;

contract sender{
    address payable public receiver = payable (0x26b989b9525Bb775C8DEDf70FeE40C36B397CE67);

    constructor() payable{

    }

    function sendToReceiver() public{
        receiver.send(15);
    }

    function transferToReceiver() public {
        receiver.transfer(12);
    }

    function callToReceiver() public {
        receiver.call{value: 10}("");
    }


    function getMyBalance() public view returns(uint256 balance){
        return address(this).balance;
    }
}