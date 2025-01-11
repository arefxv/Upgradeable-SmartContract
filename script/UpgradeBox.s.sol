// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {BoxV1} from "../src/BoxV1.sol";
import {BoxV2} from "../src/BoxV2.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";


/**
 * @title UpgradeBox
 * @author ArefXV
 * @notice This script facilitates the upgrade of an existing proxy contract to a new implementation.
 */
contract UpgradeBox is Script {

    /**
     * @notice Executes the upgrade process by deploying a new implementation and upgrading the proxy.
     * @return The address of the upgraded proxy.
     */
    function run() external returns (address){
        address mostRecentlyDeployedProxy = DevOpsTools.get_most_recent_deployment("ERC1967Proxy", block.chainid);

        vm.startBroadcast();
        BoxV2 newBox = new BoxV2();
        address proxy = upgradeBox(mostRecentlyDeployedProxy, address(newBox));
        vm.stopBroadcast();
        return proxy;
    }


 /**
     * @notice Upgrades the proxy contract to use the new implementation.
     * @param proxyAddress The address of the proxy contract.
     * @param newBox The address of the new implementation contract.
     * @return The address of the upgraded proxy.
     */
    function upgradeBox(address proxyAddress, address newBox) public returns (address) {
        vm.startBroadcast();
        BoxV1 proxy = BoxV1(payable(address(proxyAddress)));
        proxy.upgradeTo(address(newBox));
        vm.stopBroadcast();

        return address(proxy);
    }
}