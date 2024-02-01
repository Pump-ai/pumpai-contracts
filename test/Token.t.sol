// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {Token} from "../src/Token.sol";

contract PumpAiTokenTest is Test {
    Token public token;

    function setUp() public {
        token = new Token(address(this));
    }

    function test_Balance() public {
        assertEq(token.balanceOf(address(this)), 2500000000 * 10**token.decimals());
    }

    function test_Transfer() public {
        token.transfer(address(0xdead), 1000);
        assertEq(token.balanceOf(address(0xdead)), 1000);
    }

    function test_Burn() public {
        token.burn(2500000000 * 10**token.decimals());
        
        assertEq(token.balanceOf(address(this)), 0);
    }
}