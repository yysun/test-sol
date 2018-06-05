var SafeMath = artifacts.require("./SafeMath.sol");
var Photo721 = artifacts.require("./Photo721.sol");

module.exports = function(deployer) {
  deployer.deploy(SafeMath);
  deployer.link(SafeMath, Photo721);
  deployer.deploy(Photo721);
};
