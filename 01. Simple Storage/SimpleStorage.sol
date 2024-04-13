// SPDX-License-Identifier: MIT
pragma solidity 0.8.18; // this is the solidity version
// pragma solidity ^0.8.18;            // this means that any version above 0.8.18 is OK, includinc 0.8.18
// pragma solidity >=0.8.18 <0.9.0;    // this defines a range of versions that are valid

contract SimpleStorage {
    ///////////////////////////////////////////////////////
    /// Basic Types: boolean, uint, int, address, bytes ///
    ///////////////////////////////////////////////////////

    // bool hasFavouriteNumber = true; // = false or = true
    uint256 myFavouriteNumber; // We can define how many bits we want, eg.: uint256 which is the biggest it can be. uint == uint256
    // If we don't assign value, the default value is 0!
    // int256 favouriteInt = -88;  // int same as uint, but signed, so it can be negative as well, e.g.: -88
    // string favouriteNumberInText = "eighty-eight";    // text
    // address myAddress = 0xF16b4C16e7377e7c05a2Fd77B9E4016f80518fbe;
    // bytes32 favouriteBytes32 = "cat";   // string is bytes under the hood, easy to convert from string to bytes.
    //                                     // Similar to (u)int, it can have size, max is 32. Without size ("bytes") it is a bit different...
    //                                     // bytes != bytes32, they are DIFFERENT!

    //uint256[] listOfFavouriteNumbers;   // E.g.: [0, 78, 90] List of values with the same type, in this case uint256
    //                                    //        0.  1.  2.  => Index starts from 0.

    struct Person {
        uint256 favouriteNumber;
        string name;
    }

    // Person public myFriend = Person(4, "Akos");  // Declare and define a var with Person type. Params are in order as they are defined in the struct.
    // Person public akos = Person({favouriteNumber: 4, name: "Akos"});    // Same as above, but with more explicitness about which value belongs to which field.
    // Person public tom = Person({favouriteNumber: 2, name: "Tom"});
    // Person public mandy = Person({favouriteNumber: 26, name: "Mandy"});

    // dynamic array: Size can grow and shrink
    Person[] public listOfPeople; // Default value is: [] - empty array

    // static array: fixed size, max 3
    // Person[3] public listOfPeople;

    // Maps string to uint256
    // E.g.: mandy -> 26
    mapping(string => uint256) public nameToFavouriteNumber;

    /////////////////////////////////////////////////////////////////
    /// Visibility Specifiers: private, public, internal, external ///
    /////////////////////////////////////////////////////////////////
    // https://docs.soliditylang.org/en/latest/cheatsheet.html#function-visibility-specifiers
    // If ommitted, the default is: internal
    // On chain, everyting is public data, so using private is not a good way to hide the value of the given variable...
    // Public: Visible internally and externally, creates a getter to state/storage variables
    // Private: Only current contract can see/call it (no public getter is created)
    // External: Only for functions. Only from outside can be called. Another function in the contract cannot call it.
    // Internal: Only current contract AND CHILD CONTRACTS can see/call it

    function store(uint256 _favouriteNumber) public {
        myFavouriteNumber = _favouriteNumber;
    }

    //////////////////////////////////////
    /// Modifiers: view, pure, etc. ///
    //////////////////////////////////////
    // https://docs.soliditylang.org/en/latest/cheatsheet.html#modifiers
    // View: The function only reads state from the blockchain, no need to send a transaction for gas fee to call it
    // Pure: Similar to view, but these functions don't even read state from the blockchain (here for example favouriteNumber)
    // Others will be detailed later...

    // There is a cost associated with view/pure function as well, if they are called from a function that do cost gas,
    // for example if store calls retrieve than calling retrieve adds to the gas fee.

    function retrieve() public view returns (uint256) {
        return myFavouriteNumber;
    }

    // EVM can access and store information in: Stack, Memory, Storage, Calldata, Code, Logs
    // For now: memory, calldata, storage
    // Calldata and memory both means the data is temporarily available
    // Memory variables are mutable, calldata ones are not
    // Most variables in a function default to memory, string is **special**, so there we need memory or calldata.
    // It has to do with how arrays are handled in memory, more details later.
    // Storage: Permanent variables that can be modified. Cannot be used for input variables.
    // myFavouriteNumber is storage variable implicitly because it was defined in contract scope as state var.

    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        // Person memory newPerson = Person(_favouriteNumber, _name);
        // listOfPeople.push(newPerson);

        // listOfPeople.push(Person({name: _name, favouriteNumber: _favouriteNumber}));
        listOfPeople.push(Person(_favouriteNumber, _name));

        // Add the value to the mapping as well
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }

    // Deploy to testnet
    // 1. In Remix, "Deploy & Run Transactions" tab, choose "Injected Provider - MetaMask"
    // 2. In MetaMask, make sure you are on Sepolia testnet
    // 3. Use the faucets if you need SepoliaETH (faucets.chain.link)
    // 4. Click on Deploy button on the "Deploy & Run Transactions" tab
    // 5. MetaMask will pop up as you need to sign the transaction. Confirm it!
    // 6. When it is successful, we will see it in the same left pane at the bottom
    // Address: 0xD06AED29e9EC2844F7287ebA0e1A0aCAC589ee6E
    // 7. Optionally the transaction (contract deployment) can be checked on sepolia etherscan, the link can be found in the terminal
    //    saying "view on etherscan". Or go to sepolia.etherscan.io and search for the contract address
}
