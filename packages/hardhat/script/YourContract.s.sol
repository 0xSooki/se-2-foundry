// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {YourContract} from "../contracts/YourContract.sol";

contract DeployYourContract is Script {
  function setUp() public {}

  function run() public {
    vm.startBroadcast();
    new YourContract(address(0x1));
    vm.stopBroadcast();
  }
}
