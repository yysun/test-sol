pragma solidity ^0.4.18;

contract SimpleStorage {
  uint storedData;
  string image;
  function set(uint x) public {
    storedData = x;
  }

  function get() public view returns (uint) {
    return storedData;
  }

  function setImage(string url) public {
    image = url;
  }

  function getImage() public view returns (string) {
    return image;
  }
}
