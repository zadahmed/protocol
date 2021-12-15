// SPDX-License-Identifier: MIT
pragma solidity ^0.6.7;

import "../strategy-wanna-base.sol";

contract StrategyWannaUsdtNearLp is StrategyWannaFarmBase {
    // Token/ETH pool id in MasterChef contract
    uint256 public wanna_usdt_near_poolid = 2;
    // Token addresses
    address public wanna_usdt_near_lp =
        0x7E9EA10E5984a09D19D05F31ca3cB65BB7df359d;
    address public usdt = 0x4988a896b1227218e4A686fdE5EabdcAbd91571f;

    constructor(
        address _governance,
        address _strategist,
        address _controller,
        address _timelock
    )
        public
        StrategyWannaFarmBase(
            usdt,
            near,
            wanna_usdt_near_poolid,
            wanna_usdt_near_lp,
            _governance,
            _strategist,
            _controller,
            _timelock
        )
    {
        swapRoutes[near] = [wanna, near];
        swapRoutes[usdt] = [wanna, usdt];
    }

    // **** Views ****

    function getName() external pure override returns (string memory) {
        return "StrategyWannaUsdtNearLp";
    }
}
