// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Manualtoken {
    mapping(address => uint) private s_balances;
    string public name = "kalpshah";

    function totalsupply() public pure returns (uint) {
        return 100 ether;
    }

    function decimals() public pure returns (uint) {
        return 18;
    }

    function mint(address _to) public {
        s_balances[_to] = 100;
        
    }

    function balanceof(address _owner) public view returns (uint) {
        return s_balances[_owner];
    }

    function transfer(address _to, uint _amount) public {
        uint previousbalance = balanceof(msg.sender) + balanceof(_to);
        s_balances[msg.sender] -= _amount;

        s_balances[_to] += _amount;
        require(
            balanceof(msg.sender) + balanceof(_to) == previousbalance,
            "not matching"
        );
    }
}
