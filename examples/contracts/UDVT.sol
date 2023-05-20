// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

type UserId is uint256;
type UFixed is uint256;

/// A minimal library to do fixed point operations on UFixed.
library FixedMath {
    uint constant multiplier = 10**18;

    /// Adds two UFixed numbers. Reverts on overflow, 
    /// relying on checked arithmetic on uint256.
    function add(UFixed a, UFixed b) internal pure returns (UFixed) {
        return UFixed.wrap(UFixed.unwrap(a) + UFixed.unwrap(b));
    }
    /// Multiplies UFixed and uint256. Reverts on overflow,
    /// relying on checked arithmetic on uint256.
    function mul(UFixed a, uint256 b) internal pure returns (UFixed) {
        return UFixed.wrap(UFixed.unwrap(a) * b);
    }
    /// Take the floor of a UFixed number.
    /// @return the largest integer that does not exceed `a`.
    function floor(UFixed a) internal pure returns (uint256) {
        return UFixed.unwrap(a) / multiplier;
    }
    /// Turns a uint256 into a UFixed of the same value.
    /// Reverts if the integer is too large.
    function toUFixed(uint256 a) internal pure returns (UFixed) {
        return UFixed.wrap(a * multiplier);
    }
}

contract Contract {
    using FixedMath for UFixed;

    mapping(UserId => User) public users;

    struct User {
        UserId id;
        string name;
    }

    function getUser(UserId userId) public view returns(User memory) {
        return users[userId];
    }

    function add(UFixed a, UFixed b) public pure returns(UFixed) {
        return a.add(b);
    }

}