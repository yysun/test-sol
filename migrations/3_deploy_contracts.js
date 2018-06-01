var SafeMath = artifacts.require("./SafeMath.sol");
var PhotoOwnership = artifacts.require("./Photo721.sol");

module.exports = function(deployer) {
  deployer.deploy(SafeMath);
  deployer.link(SafeMath, PhotoOwnership);
  deployer.deploy(PhotoOwnership);
};
