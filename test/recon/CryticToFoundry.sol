// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import { Test, console2 as console } from "forge-std/Test.sol";
import { TargetFunctions } from "./TargetFunctions.sol";
import { FoundryAsserts } from "lib/chimera/src/FoundryAsserts.sol";
import { Logger } from "./Logger.sol";

contract CryticToFoundry is Test, TargetFunctions, FoundryAsserts, Logger {
  function setUp() public {
    setup();

    targetContract(address(target));
  }

  function test_crytic() public {
    // TODO: add failing property tests here for debugging
  }
}
