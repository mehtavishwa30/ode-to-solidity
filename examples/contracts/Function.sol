// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// import "hardhat/console.sol";

// custom error
error UnauthorizedUser();

// external function
function calc(uint a) view returns(uint) {
    return a % 10;
}

contract Modulo {
    function result() external view returns(uint) {
        return calc(694);
    }
}