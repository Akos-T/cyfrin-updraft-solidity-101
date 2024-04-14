# Storage Factory and AddFiveStorage

## Goals

- Factory pattern : StorageFactory contract deploying contracts and interacting with them.
- Reuse contracts : We don't want to copy code, also not maintainable, so how to reuse our contracts?
- Extend contracts : Maybe I don't just want to reuse a contracts, but slightly change its behaviour. How to do that?

## What I've learnt

- With `new` keyword, I can deploy contracts from other contracts
- Importing other contracts with `import`. E.g.: `import from './SimpleStorage.sol';`
- Named imports, e.g.: `import {SimpleStorage} from './SimpleStorage.sol';`
- Interact with other contracts using their `address` and `ABI` aka. `Application Binary Interface` (`function selector` will be discussed later)
- Imported contract type automatically comes with the address and ABI
- Child contract to inherit another contract's fields and behaviour we can use the `is` keyword. E.g.: `contract AddFiveStorage is SimpleStorage {}`. Of course this contract that we inherit from, needs to be imported.
- Override functions: Need the `virtual` and `override` keywords

## Useful links

- https://updraft.cyfrin.io/courses/solidity/storage-factory/factory-introduction
- https://github.com/cyfrin/remix-storage-factory-f23
- https://betterprogramming.pub/learn-solidity-the-factory-pattern-75d11c3e7d29
- https://solidity-by-example.org/import/
- https://docs.soliditylang.org/en/latest/control-structures.html#creating-contracts-via-new
- https://docs.soliditylang.org/en/latest/abi-spec.html
- https://solidity-by-example.org/inheritance/
- https://docs.soliditylang.org/en/latest/contracts.html#function-overriding
