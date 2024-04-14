// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// How does one contract know about another one?
// 1. We could copy the contract code in this file. Of course this way, the file could grow big very quickly 
//    and it would be difficult to maintain
// 2. Using import statements. https://solidity-by-example.org/import/
//    It basically does the same, copies the code for us, but only compile time and this way we only need to maintain SimpleStorage in 1 place.

// import "./SimpleStorage.sol";
import {SimpleStorage/*, SimpleStorage2*/ } from './SimpleStorage.sol'; // Named import will import only what we need
// If we import the whole file, we might import things that we don't need and it makes the deploment bigger => more expensive!
// So prefer named imports!

contract StorageFactory {
    SimpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorageContract() public {
        // Using new on a contract will deploy a new instance of that contract
        // https://docs.soliditylang.org/en/latest/control-structures.html#creating-contracts-via-new
        SimpleStorage newSimpleStorage = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorage);
    }

    // Save a value in a sample storage
    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public  {
        // To interact with a contract we need: Contract Address + ABI
        // ABI = Application Binary Interface - This tells our code how it can exactly interact with the other contract
        // Later we will learn about `Function Selectors`, which can be used intead of ABI
        // https://docs.soliditylang.org/en/latest/abi-spec.html

        // SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        // mySimpleStorage.store(_newSimpleStorageNumber);

        // Shorter version of the above code
        listOfSimpleStorageContracts[_simpleStorageIndex].store(_newSimpleStorageNumber);
    }

    // To get the value of a simple storage
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        // SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        // return mySimpleStorage.retrieve();

        // Shorter version of the above code
        return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
    }
}