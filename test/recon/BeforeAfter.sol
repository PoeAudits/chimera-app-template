// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import { Setup } from "./Setup.sol";

struct Vars {
  uint256 placeholder;
}
// ghost variables for tracking state variable values before and after function calls

abstract contract BeforeAfter is Setup {
  Vars internal _before;
  Vars internal _after;
  address internal sender;

  modifier GetSender() {
    sender = msg.sender;
    _;
  }

  // _before.placeholder = target.placeholder();
  function __before(uint256 index) internal {
    __before();
  }

  function __before(address user) internal {
    __before();
  }

  function __before() internal { }

  // _after.placeholder = target.placeholder();
  function __after(uint256 index) internal {
    __after();
  }

  function __after(address user) internal {
    __after();
  }

  function __after() internal { }
}
