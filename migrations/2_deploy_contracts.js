var ConvertLib = artifacts.require("./ConvertLib.sol");
var MetaCoin = artifacts.require("./Shopfront.sol");

module.exports = function(deployer) {
  deployer.deploy(ConvertLib);
  deployer.deploy(Shopfront);
};
