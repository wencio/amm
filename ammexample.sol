pragma solidity ^0.8.0;

contract AMM {
    // Variables to keep track of the pool of assets
    mapping(address => uint256) public balances;
    uint256 public totalSupply;

    // Function to add funds to the pool
    function deposit(uint256 amount) public {
        // Increment the balance of the caller
        balances[msg.sender] += amount;
        // Increment the total supply
        totalSupply += amount;
    }

    // Function to trade one asset for another
    function trade(uint256 sellAmount, uint256 minBuyAmount) public {
        // Calculate the price of the asset based on the constant product formula
        uint256 buyAmount = sellAmount * totalSupply / balances[msg.sender];

        // Ensure that the buy amount is not less than the minimum buy amount
        require(buyAmount >= minBuyAmount, "Trade failed: insufficient liquidity");

        // Decrement the balance of the caller
        balances[msg.sender] -= sellAmount;
        // Increment the balance of the caller
        balances[msg.sender] += buyAmount;
        // Decrement the total supply
        totalSupply -= sellAmount;
        // Increment the total supply
        totalSupply += buyAmount;
    }
}
