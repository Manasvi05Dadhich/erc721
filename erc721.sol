// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleERC721 {
    string public name = "SimpleNFT";
    string public symbol = "SNFT";

    mapping(uint256 => address) private _owners;
    mapping(address => uint256) private _balances;

    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    function ownerOf(uint256 tokenId) public view returns (address) {
        address owner = _owners[tokenId];
        require(owner != address(0), "Token does not exist");
        return owner;
    }

    function balanceOf(address owner) public view returns (uint256) {
        require(owner != address(0), "Zero address");
        return _balances[owner];
    }

    function mint(address to, uint256 tokenId) public {
        require(to != address(0), "Zero address");
        require(_owners[tokenId] == address(0), "Already minted");

        _owners[tokenId] = to;
        _balances[to] += 1;

        emit Transfer(address(0), to, tokenId);
    }
}



