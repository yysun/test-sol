pragma solidity ^0.4.19;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/MetaCoin.sol";

contract TestMetacoin {

  function testInitialBalanceUsingDeployedContract() public {
    MetaCoin meta = MetaCoin(DeployedAddresses.MetaCoin());

    uint expected = 10000;

    Assert.equal(meta.getBalance(tx.origin), expected, "Owner should have 10000 MetaCoin initially");
  }

  function testInitialBalanceWithNewMetaCoin() public {
    MetaCoin meta = new MetaCoin();

    uint expected = 10000;

    Assert.equal(meta.getBalance(tx.origin), expected, "Owner should have 10000 MetaCoin initially");
  }
}

var account_one = "0x627306090abab3a6e1400e9345bc60c78a8bef57"; // an address
var account_two = "0xf17f52151ebef6c7334fad080c5704d77216b732"; // another address

var meta;
PhotoOwnership.deployed().then(function(instance) {
  meta = instance;
  return meta.transfer(account_two, 10, {from: account_one});
}).then(function(result) {
  // If this callback is called, the transaction was successfully processed.
  console.log("Transaction successful!")
}).catch(function(e) {
  console.log(e)
})