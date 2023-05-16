// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// import "hardhat/console.sol";

// custom error declaration
error InsufficientBalance(uint256 available, uint256 required);

contract Token {
    mapping(address => uint256) private balances;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) external {
        uint256 balance = balances[msg.sender];
        if (balance < amount) {
            // throw custom error in case of insufficient funds
            revert InsufficientBalance({
                available: balance, 
                required: amount 
                });
        }
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    function getBalance() external view returns (uint256) {
        return balances[msg.sender];
    }
}
