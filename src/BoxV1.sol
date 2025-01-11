// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

/**
 * @title BoxV1
 * @author ArefXv
 * @notice BoxV1 is an upgradeable contract that stores a single uint256 value.
 * It uses the UUPS proxy pattern for upgradability.
 */
contract BoxV1 is Initializable, OwnableUpgradeable, UUPSUpgradeable {
    // State variable to store a number
    uint256 internal number;

    /**
     * @notice Constructor disables initializers to prevent implementation contract misuse.
     */
    constructor() {
        _disableInitializers();
    }

    /**
     * @notice Initializes the contract by setting up Ownable and UUPS features.
     */
    function initialize() public initializer {
        __Ownable_init();
        __UUPSUpgradeable_init();
    }

    /**
     * @notice Returns the stored number.
     * @return The stored uint256 number.
     */
    function getNumber() external view returns (uint256) {
        return number;
    }

    /**
     * @notice Returns the version of the contract.
     * @return The uint256 version number (1 for this version).
     */
    function getVersion() external pure returns (uint256) {
        return 1;
    }

    /**
     * @dev Required by UUPSUpgradeable to authorize upgrades.
     * Only the owner can upgrade the contract.
     * @param newImplementation The address of the new implementation contract.
     */
    function _authorizeUpgrade(address newImplementation) internal override {}
}
