// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    address public admin;

    constructor(uint256 initialSupply) ERC20("MyToken", "MYT") {
        _mint(msg.sender, initialSupply);
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Error: You are not the admin");
        _;
    }

    function mint(address to, uint256 amount) external onlyAdmin {
        _mint(to, amount);
    }

    function burn(address from, uint256 amount) external {
        _burn(from, amount);
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        _transfer(msg.sender, to, amount);
        return true;
    }
}
