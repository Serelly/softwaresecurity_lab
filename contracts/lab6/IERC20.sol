// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

 interface ERC20Interface {
        function transfer(address to, uint256 value) external;
        function approve(address spender, uint256 value) external;
        function getAllowance(address from, address spender) external view;
        function minting(address _initAdd, address _toAdd, uint _mintAmount) external;
        function burning(address _initAdd, address _toAdd, uint _burAmount) external;
    }
