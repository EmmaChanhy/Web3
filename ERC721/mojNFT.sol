// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// Resources
// link1: https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol

contract MojNFT is ERC721 {

    uint256 immutable public  maxSupply = 10000;
    uint256 immutable public mintPrice = 0.1 ether;
    uint256 public currentSupply = 0;

    // Token name and symbol
    constructor() ERC721("mojNFT","MOJ"){}

    function mint() external payable returns(uint256) {
        require(msg.value == mintPrice, "Minimum price is 0.1 ether");
        require(currentSupply < maxSupply, "Reached maximum supply");
        currentSupply += 1;
        _safeMint(msg.sender, currentSupply);
        return currentSupply;
    }
}