// Get funds from users
// Withdraw funds
// Set a minimmum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";


contract FundMe {

    uint256 public minimumUSD = 5;

    function fund() public payable {
        // Allows users to send $
        // Have a minimum $ of $5.00
        require(msg.value >= minimumUSD, "Didn't seen enough ETH");

    }

    //function withdraw() public {}

    function getPrice() public view returns(uint256){
        // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 price,,,) = priceFeed.latestRoundData();
        // Price of ETH in terms of USD
        return uint256(price * 1e10);
    }

    function getConversionRate() public {}
}