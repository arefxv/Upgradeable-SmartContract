// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

/**
 * @title BoxV2
 * @author ArefXV
 * @notice BoxV2 extends BoxV1 by adding the ability to set the stored number.
 */
contract BoxV2 is UUPSUpgradeable {

    uint256 internal number;

    /**
     * @notice Sets the stored number to a new value.
     * @param _number The new uint256 value to store.
     */
    function setNumber(uint256 _number) external {
        number = _number;
    }

    function getNumber() external view returns (uint256){
        return number;
    }

    function getVersion() external pure returns (uint256) {
        return 2;
    }

     function _authorizeUpgrade(address newImplementation) internal override{}
}