// SPDX-License-Identifier: MIT
    pragma solidity ^0.8.28;

    contract EventSubscriptionExample {
        event Transfer(address indexed from, address indexed to, uint amount);

        function transfer(address to, uint amount) public {
            emit Transfer(msg.sender, to, amount);
        }
    }