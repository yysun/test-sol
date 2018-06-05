pragma solidity ^0.4.19;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Photo721.sol";

contract TestPhoto721 {

  function testStoreId() public {
    Photo721 photo721 = Photo721(DeployedAddresses.Photo721());

    photo721.setId("89");

    string expected = "89";

    Assert.equal(photo721.getId(), expected, "It should store the id 89.");
  }
}
