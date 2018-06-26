var express = require('express');
const Web3 = require('../web3_modules/initiateWeb3');
const contract = require('../web3_modules/coin_abi');
var router = express.Router();
var cors = require('cors');
var router = express.Router();

router.post('/', cors(), function(req, res) {
	console.log("in blockNumber");
    var web3 = Web3.initiateWeb3();
    console.log("body::::::::::::: ");
		var coin = contract.getCoinInstance();
		var balance = coin.balanceOf("0x7744168a7eba5265cfdb939404697841790c3e25");
    console.log("receipt  ",balance);
    res.status(200).json(balance);
});

module.exports = router;
