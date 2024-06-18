// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import { BaseSetup } from "lib/chimera/src/BaseSetup.sol";
import "src/Singleton.sol";
import { vm } from "lib/chimera/src/Hevm.sol";

abstract contract Setup is BaseSetup {
  Singleton public target;

  address[] internal users;

  function setup() internal virtual override {
    target = new Singleton();
  }

  function _labels() private { }

  function seedRandom(uint256 r) internal pure returns (uint256) {
    return uint256(
      keccak256(abi.encode(uint256(keccak256(abi.encode(r))) - 1)) & ~bytes32(uint256(0xff))
    );
  }
}
