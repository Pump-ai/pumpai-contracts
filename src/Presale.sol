// Create a token presale smart contract

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./interfaces/IERC20.sol";

contract Presale {
    address public owner;
    uint256 public deadline;
    uint256 public price = 125000; // 1 BNB = 125000 tokens
    IERC20 public token;

    constructor(address _tokenAddress, uint256 _deadline) {
        owner = msg.sender;
        deadline = _deadline; // Deadline in unix timestamp
        token = IERC20(_tokenAddress);
    }

    function updatePrice(uint256 _price) public {
        require(msg.sender == owner);
        price = _price;
    }

    function buy() public payable {
        // The amount of tokens should be less than the amount of tokens in the presale 0.000008 BNB/token
        require(msg.value * price <= token.balanceOf(address(this)), "Not enough tokens in the presale");
        require(msg.value >= 0.001 ether, "Minimum amount is 0.001 BNB");
        require(block.timestamp < deadline, "Deadline has passed");

        token.transfer(msg.sender, msg.value * price);
    }

    function withdraw() public {
        require(msg.sender == owner);
        require(address(this).balance > 0);
        payable(owner).transfer(address(this).balance);
    }

    function withdrawToken() public {
        require(msg.sender == owner);
        token.transfer(owner, token.balanceOf(address(this)));
    }

    function updateDeadline(uint256 _deadline) public {
        require(msg.sender == owner);
        deadline = _deadline;
    }
}