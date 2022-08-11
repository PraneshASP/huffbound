// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Script.sol";

import {Huffbound} from "../src/interfaces/IHuffbound.sol";

contract Deploy is Script {
    string nameString = "Huffbound";
    string symbolString = "HBTKN";
    // Sample URI
    string uriString =
        "ipfs://QmPMc4tcBsMqLRuCQtPmPe84bpSjrC3Ky7t3JWuHXYB4aS/0";

    function run() public returns (Huffbound huffbound) {
        bytes memory name = bytes(nameString);
        bytes memory symbol = bytes(symbolString);
        bytes memory uri = bytes(uriString);

        bytes memory args = bytes.concat(
            bytes32(name),
            bytes32(symbol),
            bytes32(uri),
            abi.encode(address(this))
        );
        //vm.startBroadcast();
        huffbound = Huffbound(
            HuffDeployer.broadcast_with_args("Soulbound", args)
        );
        //vm.stopBroadcast();
        console2.log("Huffbound contract deployed to: ", address(huffbound));
    }
}
