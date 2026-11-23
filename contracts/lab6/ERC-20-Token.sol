// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract MyToken {
    string public name;
    string public symbol;
    uint8 public decimals = 18;
    uint256 public totalSupply;
    address public owner;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor(string memory _name, string memory _symbol, uint256 _initialSupply) {
        owner = msg.sender;
        name = _name;
        symbol = _symbol;

        // Scala l'offerta iniziale con i 18 decimali standard ERC-20
        uint256 scaledSupply = _initialSupply * (10 ** uint256(decimals));
        totalSupply = scaledSupply;
        balanceOf[msg.sender] = scaledSupply;

        emit Transfer(address(0), msg.sender, scaledSupply);
    }

    function transfer(address to, uint256 value) public returns (bool) {
        require(to != address(0), "Invalid recipient");
        require(balanceOf[msg.sender] >= value, "Insufficient balance");

        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;

        emit Transfer(msg.sender, to, value);
        return true;
    }

    function approve(address spender, uint256 value) public returns (bool) {
        require(spender != address(0), "Invalid spender");
        allowance[msg.sender][spender] = value;

        emit Approval(msg.sender, spender, value);
        return true;
    }

    function getAllowance(address from, address spender) public view returns (uint256) {
        return allowance[from][spender];
    }

    function minting(address _initAdd, address _toAdd, uint256 _mintAmount) public {
        require(msg.sender == owner && _initAdd == owner, "Only owner can mint");
        require(_toAdd != address(0), "Invalid recipient");

        totalSupply += _mintAmount;
        balanceOf[_toAdd] += _mintAmount;

        emit Transfer(address(0), _toAdd, _mintAmount);
    }

    function burning(address _initAdd, address _toAdd, uint256 _burAmount) public {
        require(msg.sender == owner && _initAdd == owner, "Only owner can burn");
        require(balanceOf[_toAdd] >= _burAmount, "Insufficient balance to burn");

        balanceOf[_toAdd] -= _burAmount;
        totalSupply -= _burAmount;

        emit Transfer(_toAdd, address(0), _burAmount);
    }
}
