pragma solidity ^0.5.8;

contract Owned {
  // State variables
  address owner;

  //modifiers
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  // constructor
  constructor() public {
    owner = msg.sender;
  }
}
