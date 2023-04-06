// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../../contracts/YourContract.sol";

contract YourContractTest is Test {
  address test = address(0x123);
  YourContract public yourContract;

  function setUp() public {
    yourContract = new YourContract(test);
  }

  function testDeployment() public {
    assertEq(yourContract.greeting(), "Building Unstoppable Apps!!!");
  }

  function testSetGreetig(string memory greeting) public {
    yourContract.setGreeting(greeting);
    assertEq(yourContract.greeting(), greeting);
  }
}
