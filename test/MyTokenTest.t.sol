// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {Test, console} from "forge-std/Test.sol";
import {DeployMyToken} from "../script/DeployMyToken.s.sol";
import {MyToken} from "../src/MyToken.sol";

contract MyTokenTest is Test {
    MyToken myToken;

    address public Januepr = makeAddr("Jaunepr");
    address public Murph = makeAddr("Murph");

    uint256 public constant JAUNEPR_INIT_BALANCE = 100 ether;
    uint256 public constant TRANSFER_AMOUNT = 500;

    function setUp() external {
        DeployMyToken deployMyToken = new DeployMyToken();
        myToken = deployMyToken.run();

        vm.prank(msg.sender);
        myToken.transfer(Januepr, JAUNEPR_INIT_BALANCE);
    }

    function testJanueprBalance() public {
        assertEq(myToken.balanceOf(Januepr), JAUNEPR_INIT_BALANCE);
    }

    function testTransfer() public {
        vm.prank(Januepr);
        myToken.transfer(Murph, TRANSFER_AMOUNT);
        assertEq(myToken.balanceOf(Murph), TRANSFER_AMOUNT);
        assertEq(
            myToken.balanceOf(Januepr),
            JAUNEPR_INIT_BALANCE - TRANSFER_AMOUNT
        );
    }

    function testAllowance() public {
        vm.prank(Januepr);
        myToken.approve(Murph, TRANSFER_AMOUNT);
        assertEq(myToken.allowance(Januepr, Murph), TRANSFER_AMOUNT);
    }

    function testTransferFrom() public {
        vm.prank(Januepr);
        myToken.approve(Murph, TRANSFER_AMOUNT);
        vm.prank(Murph);
        myToken.transferFrom(Januepr, Murph, TRANSFER_AMOUNT);
        assertEq(myToken.balanceOf(Murph), TRANSFER_AMOUNT);
        assertEq(
            myToken.balanceOf(Januepr),
            JAUNEPR_INIT_BALANCE - TRANSFER_AMOUNT
        );
        assertEq(myToken.allowance(Januepr, Murph), 0);
    }
}
