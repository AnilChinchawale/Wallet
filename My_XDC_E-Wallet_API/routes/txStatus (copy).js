var express = require('express');
const Web3 = require('../web3_modules/initiateWeb3');
var router = express.Router();
var cors = require('cors');
var router = express.Router();

router.get('/', cors(), function(req, res) {
	console.log("in texStatus");
    var web3 = Web3.initiateWeb3();
    console.log("body::::::::::::: ");
    var receipt = web3.eth.getTransaction("0x1cf824662fda2bb33fb526e42c91a48a98f642494bdce398db10371eb04ee6d3");

    res.status(200).json(receipt);
});


module.exports = router;
