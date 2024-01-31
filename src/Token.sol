// SPDX-License-Identifier: MIT
// The official ERC-20 implementation for Pump.ai token
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Token is ERC20, ERC20Burnable, Ownable {
    constructor(address initialOwner)
        ERC20("Pump.ai", "PUMPAI")
        Ownable(initialOwner)
    {
        _mint(msg.sender, 2005000 * 10 ** decimals());
    }
}