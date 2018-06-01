var Photo721 = artifacts.require("./Photo721.sol");

contract('Photo721', function(accounts) {
  it("should get balance in the first account", function() {
    return Photo721.deployed().then(function(instance) {
      return instance.balanceOf.call(accounts[0]);
    }).then(function(Photo721) {
      assert.equal(Photo721.valueOf(), 0, "0 wasn't in the first account");
    });
  });
});
