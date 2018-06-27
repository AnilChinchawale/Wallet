var express = require('express');
const Web3 = require('../web3_modules/initiateWeb3');
const contract = require('../web3_modules/coin_abi');
var router = express.Router();
var cors = require('cors');
var router = express.Router();


router.post('/', cors(), function(req, res) {

	 var receipt = web3.eth.getGasPrice();
    console.log("receipt  ",receipt);
    res.status(200).json(receipt);
});

module.exports = router;
