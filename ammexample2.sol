pragma solidity ^0.8.0;

contract AMM {
    // Define token balances for each user
    mapping(address => uint256) public balances;

    // Define the constructor function
    constructor() public {
        // Set an initial balance for the contract owner
        balances[msg.sender] = 1000000;
    }

    // Define a function for trading tokens
    function trade(uint256 amountIn, uint256 amountOut) public {
        // Get the balance of the user making the trade
        uint256 userBalance = balances[msg.sender];

        // Calculate the new balance after the trade
        uint256 newBalance = userBalance - amountIn + amountOut;

        // Update the balance for the user
        balances[msg.sender] = newBalance;
    }
}
