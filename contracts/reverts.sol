// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract RevertContract{


    error WrongNumber(uint256 threshold, uint256 number);
    string public status;
    uint256 myThershold = 100;

    function revertString(uint256 _number) public {

        status = "not ok";
        if (_number > myThershold) {
            revert("Number is too big");
        }
        status = "ok";
    }
    function revertCustomError(uint256 _number) public {

        status = "not ok";
        if (_number > myThershold) {

            revert WrongNumber({
            threshold: myThershold,
            number: _number
            });
        }
        status = "ok";
    }
}