# Upgradeable Smart Contracts with UUPS Pattern

This repository demonstrates the implementation of **Upgradeable Smart Contracts** using the **UUPS (Universal Upgradeable Proxy Standard)** pattern. The project includes two versions of a smart contract (`BoxV1` and `BoxV2`) deployed via an **ERC1967 Proxy**. It showcases how to upgrade contract logic seamlessly while maintaining the contract's state

---

## Features
- **Upgradeable Smart Contract Architecture**: Enables the addition of new functionality without redeploying the contract or losing stored data.
- **BoxV1**: Initial version of the contract with basic functionality.
- **BoxV2**: Upgraded version with added features, including the ability to set a new value.
- **UUPS Pattern**: Ensures secure and efficient upgrades.
- **Testing**: Includes scripts to validate the upgrade process and ensure the contract's reliability.

---

## Contracts
### 1. BoxV1
- **Functionality**:
  - Stores a single `uint256` value (`number`).
  - Provides a `getNumber` function to retrieve the stored value.
  - Includes `getVersion` to return the version (1).
  - Implements `_authorizeUpgrade` to control upgrade access.

### 2. BoxV2
- **Functionality**:
  - Extends `BoxV1` functionality by adding `setNumber` to modify the stored value.
  - Updates `getVersion` to return version (2).

### 3. UpgradeBox Script
- Automates the process of upgrading the proxy contract to the latest implementation.
- Ensures a smooth transition from `BoxV1` to `BoxV2`.

---

## How to Use
### Prerequisites
- Foundry installed on your system.
- A basic understanding of Solidity and upgradeable contracts.

### Deployment Steps
1. Deploy `BoxV1` via the `ERC1967Proxy` using the provided script.
2. Use the `UpgradeBox` script to replace `BoxV1` with `BoxV2`.

### Testing
Run the tests to validate:
- The initial deployment of `BoxV1`.
- The upgrade process from `BoxV1` to `BoxV2`.
- The new functionality in `BoxV2`.

---

## Scripts
- **DeployBox**: Handles the deployment of `BoxV1` through an ERC1967 Proxy.
- **UpgradeBox**: Automates the upgrade from `BoxV1` to `BoxV2`.
- **DeployAndUpgradeTest**: Comprehensive test suite to ensure the upgrade process is reliable.

---

## Example Usage
### Initial Deployment
```bash
forge script script/DeployBox.s.sol --rpc-url <RPC_URL> --private-key <PRIVATE_KEY> --broadcast
```

### Upgrading
```bash
forge script script/UpgradeBox.s.sol --rpc-url <RPC_URL> --private-key <PRIVATE_KEY> --broadcast
```

### Running Tests
```bash
forge test
```

---

## Security Considerations
- **Access Control**: `_authorizeUpgrade` ensures only authorized entities can perform upgrades.
- **Proxy Safety**: The implementation contract does not store state directly, ensuring state integrity during upgrades.

___

# **Thank you for checking it out!**# Upgradeable-SmartContract
