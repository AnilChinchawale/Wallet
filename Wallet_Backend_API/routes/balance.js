var express = require('express');
const Web3 = require('../web3_modules/initiateWeb3');
const contract = require('../web3_modules/coin_abi');
var router = express.Router();
var cors = require('cors');
var router = express.Router();
var decToHex = require("dec-to-hex");
var bigInt = require("big-integer");
var BigNumber = require('bignumber.js');

router.post('/', cors(), function(req, res) {
    var web3 = Web3.initiateWeb3();
	console.log("eth balance:",web3.eth.getBalance(req.body.address));
	var coin = contract.getCoinInstance();
	var result = coin.balanceOf(req.body.address);
	var balance="";
	//console.log("web3 ",web3);
	for(var i=0; i<result.c.length;i++)
		balance =balance+result.c[i];
	balance=web3.eth.getBalance(req.body.address);
	console.log("Balance: ", result,"req.body.address ",req.body.address,"bignumber",BigNumber(result.c[0]));
	var hex = bigInt(balance).toString(16);
    res.status(200).json({status:1,message:"OK",result:"0x"+hex,tp:BigNumber(result.c[0])});
}); 

module.exports = router;
