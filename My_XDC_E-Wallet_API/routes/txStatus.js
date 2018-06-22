var express = require('express');
const Web3 = require('../web3_modules/initiateWeb3');
var router = express.Router();
var cors = require('cors');
var router = express.Router();

router.post('/', cors(), function(req, res) {
	console.log(req.body);
    var web3 = Web3.initiateWeb3();
    var receipt = web3.eth.getTransaction(req.body.txHash);
    console.log("body", req.body," ::::::::::::: ", receipt);
    res.status(200).json(receipt);
});


module.exports = router;
