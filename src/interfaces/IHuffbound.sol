// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

interface Huffbound {
    function name() external view returns (bytes32);

    function symbol() external view returns (bytes32);

    function tokenURI(uint256) external view returns (bytes32);

    function owner() external view returns (address);

    function balanceOf(address) external view returns (uint256);

    function isApprovedForAll(address, address) external view returns (bool);

    function mint(address, uint256) external;

    function transfer(address, uint256) external;

    function transferFrom(
        address,
        address,
        uint256
    ) external;

    function approve(address, uint256) external;

    function setApprovalForAll(address, bool) external;

    function getApproved(uint256) external view returns (address);
}
