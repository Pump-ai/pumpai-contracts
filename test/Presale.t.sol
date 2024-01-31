

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {Presale} from "../src/Presale.sol";
import {Token} from "../src/Token.sol";

contract PresaleTest is Test {
    Presale public presale;
    Token public token;

    function setUp() public {
        token = new Token(address(this));
        presale = new Presale(address(token), block.timestamp + 100000);

        // Transfer all tokens to presale
        token.transfer(address(presale), 2005000 * 10**token.decimals());
    }

    function test_balanceOf() public {
        assertEq(token.balanceOf(address(presale)), 2005000 * 10**token.decimals());
    }

    function test_Owner() public {
        assertEq(presale.owner(), address(this));
    }
 
    function test_UpdateDeadline() public {
        presale.updateDeadline(block.timestamp + 2000);
        assertEq(presale.deadline(), block.timestamp + 2000);
    }

    function test_Buy() public {
        // 1 BNB = 1000 tokens
        presale.buy{value: 1 ether}();
        
        assertEq(token.balanceOf(address(this)), 1000 * 10**token.decimals());
    }

    function test_Withdraw() public {
        presale.buy{value: 1 ether}();

        uint256 presaleBalance = address(presale).balance;
        assertEq(presaleBalance, 1 ether);
    }

    function test_WithdrawToken() public {
        presale.withdrawToken();
        assertEq(token.balanceOf(address(this)), 2005000 * 10**token.decimals());
    }

}