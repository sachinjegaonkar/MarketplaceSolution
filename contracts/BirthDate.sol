pragma solidity ^0.5.0;

contract BirthDate {
    uint256 public birthdate;

    function set(uint256 _birthdate) public {
        birthdate = _birthdate;
    }

    function get() public view returns (uint _birthdate) {
        return birthdate;
    }
}
