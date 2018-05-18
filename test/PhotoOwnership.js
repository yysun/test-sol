var PhotoOwnership = artifacts.require("./PhotoOwnership.sol");

contract('PhotoOwnership', function(accounts) {
  it("should get balance in the first account", function() {
    return PhotoOwnership.deployed().then(function(instance) {
      return instance.balanceOf.call(accounts[0]);
    }).then(function(photoOwnership) {
      assert.equal(photoOwnership.valueOf(), 0, "0 wasn't in the first account");
    });
  });
});
