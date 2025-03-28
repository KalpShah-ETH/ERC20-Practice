// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Manualtoken} from "../src/Manualtoken.sol";
import {OurToken} from "../src/Ourtoken.sol";

contract deployscript is Script {
    // Manualtoken manualtoken;

    // function setUp() public {}

    // function run() public {
    //     vm.startBroadcast();

    //     manualtoken = new Manualtoken();

    //     vm.stopBroadcast();
    //     console.log(msg.sender); //anvil first account  0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
    //     console.log(
    //         "address where contract is deployed:",
    //         address(manualtoken)
    //     );
    // }

    function run() external returns (OurToken) {
        vm.startBroadcast();

        OurToken ourtoken = new OurToken(1000 ether);
        vm.stopBroadcast();
        return ourtoken;
    }
}
