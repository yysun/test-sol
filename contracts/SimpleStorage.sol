pragma solidity ^0.4.18;

contract SimpleStorage {
  uint storedData;
  string id;
  function set(uint x) public {
    storedData = x;
  }

  function get() public view returns (uint) {
    return storedData;
  }

  function setId(string identity) public {
    id = identity;
  }

  function getId() public view returns (string) {
    return id;
  }
}
