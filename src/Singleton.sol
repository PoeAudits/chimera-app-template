// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Singleton {

    address internal _module;

    constructor() {}


    function _executeModule(address module, bytes memory _data) private returns (bytes memory returnData) {
        bool success = true;
        (success, returnData) = module.delegatecall(_data);
        if (!success) {
            revert("Error Delegate Call");
        }
    }

    function _viewModule(address module, bytes memory _data) private view returns (bytes memory returnData) {
        bool success = true;
        (success, returnData) = module.staticcall(_data);
        if (!success) {
            revert("Error Delegate Call");
        }
    }
}

