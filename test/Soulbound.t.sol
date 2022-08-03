// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "foundry-huff/HuffConfig.sol";
import "forge-std/Test.sol";

interface Huffbound {
    function name() external view returns (bytes32);

    function symbol() external view returns (bytes32);

    function tokenURI(uint256) external view returns (bytes32);
}

contract HuffboundTest is Test {
    /// @dev System under test
    Huffbound public sut;
    HuffConfig public huffDepl;

    string nameString = "Huffbound";
    string symbolString = "HBTKN";

    // Sample URI
    string uriString =
        "ipfs://QmPMc4tcBsMqLRuCQtPmPe84bpSjrC3Ky7t3JWuHXYB4aS/0";

    /// @dev Setup the testing environment.
    function setUp() public {
        bytes memory name = bytes(nameString);
        bytes memory symbol = bytes(symbolString);
        bytes memory uri = bytes(uriString);

        huffDepl = HuffDeployer.config();

        bytes memory args = bytes.concat(
            bytes32(name),
            bytes32(symbol),
            bytes32(uri),
            abi.encode(address(this))
        );

        sut = Huffbound(huffDepl.with_args(args).deploy("Soulbound"));
    }

    function testDeployment() public {
        assert(address(sut) != address(0));
    }

    function testName() public {
        bytes memory name = bytes(nameString);
        assert(bytes32(abi.encodePacked(sut.name())) == bytes32(name));
    }

    function testSymbol() public {
        bytes memory symbol = bytes(symbolString);
        assert(bytes32(abi.encodePacked(sut.symbol())) == bytes32(symbol));
    }

    function testTokenURI() public {
        bytes memory tokenURI = bytes(uriString);
        assert(bytes32(abi.encodePacked(sut.tokenURI(0))) == bytes32(tokenURI));
    }
}
