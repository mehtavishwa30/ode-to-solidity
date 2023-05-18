// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// import "hardhat/console.sol";

import { UnauthorizedUser, calc } from "./Function.sol";

contract Import{
    function calc(uint a) view returns(uint) {
    return a % 10;
    }
}