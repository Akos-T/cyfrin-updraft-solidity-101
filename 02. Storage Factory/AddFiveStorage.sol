// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

// Inheritance: https://solidity-by-example.org/inheritance/
// Here we inherit SimpleStorage

contract AddFiveStorage is SimpleStorage {
    // We could add our extra functionality that is not present in SimpleStorage, e.g.:
    // function sayHello () public pure returns (string memory) {
    //     return "Hello";
    // }

    // `virtual` and `override` keywords
    // https://docs.soliditylang.org/en/latest/contracts.html#function-overriding

    function store(uint256 _newNumber) public override {
        myFavouriteNumber = _newNumber + 5;
    }
}
