// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import {ERC20} from "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract OurToken is ERC20 {
    constructor(uint intialsupply) ERC20("ourtoken", "otk") {
        _mint(msg.sender, intialsupply);
    }
}
