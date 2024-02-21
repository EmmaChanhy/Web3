//SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// Resources:
// link1: https://docs.alchemy.com/docs/how-to-create-an-erc-20-token-4-steps
// link2: https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol

contract newMojToken is ERC20 {

    address public owner;

    // Choose my token name and symbol
    constructor() ERC20("mojToken", "MOJ") {
        // Set a contract owner upon deployment
        owner = msg.sender;
    }

    // Implement an external mint() function
    function mint(address _to, uint256 _amount) external {
        // Can be called only from owner
        require(msg.sender == owner, "Not owner");
        _mint(_to, _amount);
    }
}