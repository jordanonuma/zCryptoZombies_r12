pragma solidity ^0.6.7;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";

contract PriceConsumerV3 is VRFConsumerbase {
    AggregatorV3Interface public priceFeed;

    constructor() public {
        priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8);
    } //end constructor{}

    function getLatestPrice() public view returns(int) {
        (,int price,,,) = priceFeed.latestRoundData();
        return price;
    } //end function getLatestPrice()

    function getDecimals() public view returns(uint8) {
        uint8 decimals = priceFeed.decimals();
        return decimals;
    } //end function getDecimals()
} //end contract PriceConsumerV3{}