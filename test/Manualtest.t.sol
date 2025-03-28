// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
// import {Manualtoken} from "../src/Manualtoken.sol";

import {deployscript} from "../script/DeployManualtoken.s.sol";
import {OurToken} from "../src/Ourtoken.sol";

contract erc2test is Test {
    deployscript public ds;
    OurToken public ourtoken;
    address bob = makeAddr("bob");
    address alice = makeAddr("alice");

    function setUp() external {
        ds = new deployscript();
        ourtoken = ds.run();
        vm.prank(msg.sender);
        ourtoken.transfer(bob, 1000 ether);
    }

    function testbobbalance() public view {
        assertEq(100 ether, ourtoken.balanceOf(bob));
    }

    function testallownaceswork() public {
        vm.prank(bob);
        ourtoken.approve(alice, 1000 ether);

        vm.prank(alice);
        ourtoken.transferFrom(bob, alice, 500 ether);
        assertEq(ourtoken.balanceOf(alice), 500 ether);
        assertEq(ourtoken.balanceOf(bob), 500 ether);
    }

    // function testcontract() public {
    //     vm.startPrank(user);
    //     uint totalsupply = manualtoken.totalsupply();
    //     uint decimals = manualtoken.decimals();
    //     assertEq(totalsupply, 100 ether);
    //     assertEq(decimals, 18);
    //     manualtoken.mint(0x70997970C51812dc3A010C7d01b50e0d17dc79C8);
    //     uint balance = manualtoken.balanceof(
    //         0x70997970C51812dc3A010C7d01b50e0d17dc79C8
    //     );
    //     assertEq(balance, 100);
    //     vm.stopPrank();
    //     vm.startPrank(userr);
    //     manualtoken.mint(userr);

    //     manualtoken.transfer(one, 1);
    //     uint balance1 = manualtoken.balanceof(one);
    //     assertEq(balance1, 1);
    //     uint balance2 = manualtoken.balanceof(userr);
    //     assertEq(balance2, 99);

    //     vm.expectRevert();

    //     manualtoken.transfer(two, 1000);

    //     vm.stopPrank();
    // }
}
