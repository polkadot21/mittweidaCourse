pragma solidity 0.8.13;


contract receiver{

    uint256 public counter = 0;

    receive() external payable{
        counter++;
    }

    function getBalance() public view returns(uint256 balance){
        return address(this).balance;
    }
}