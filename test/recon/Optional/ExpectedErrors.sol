// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import "./Errors.sol";
import {Asserts} from "lib/chimera/src/Asserts.sol";

abstract contract ExpectedErrors is Asserts {
    bool internal success;
    bytes internal returnData;

    bytes4[] internal PLACEHOLDER_ERRORS;


    constructor() {
        
        PLACEHOLDER_ERRORS.push(ERC20Errors.ERC20InsufficientBalance.selector);
  
        // SET_USER_CONFIGURATION_ERRORS N/A
    }

    modifier checkExpectedErrors(bytes4[] storage errors) {
        success = false;
        returnData = bytes("");

        _;

        if (!success) {
            bool expected = false;
            for (uint256 i = 0; i < errors.length; i++) {
                if (errors[i] == bytes4(returnData)) {
                    expected = true;
                    break;
                }
            }
            t(expected, "DOS: Denial of Service");
            precondition(false);
        }
    }
}
