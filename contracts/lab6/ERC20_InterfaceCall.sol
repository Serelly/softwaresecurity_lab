// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "./IERC20.sol";

contract xzy {
    ERC20Interface token;
    address public owner = msg.sender;

    constructor(address _tokenAddress) {
        token = ERC20Interface(_tokenAddress);
    }

    function sellToken(address _to, uint _amount) public {
        token.transfer(_to, _amount);
    }
}