// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Singleton {
  address internal _module;

  constructor() { }

  function _executeModule(address module, bytes memory _data)
    private
    returns (bytes memory returnData)
  {
    bool success = true;
    (success, returnData) = module.delegatecall(_data);
    if (!success) {
      revert("Error Delegate Call");
    }
  }
}
