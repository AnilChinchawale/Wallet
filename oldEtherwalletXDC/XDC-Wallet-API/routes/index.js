var express = require('express');
const contract = require('../web3_modules/coin_abi');
const Web3 = require('../web3_modules/initiateWeb3');
var router = express.Router();
var cors = require('cors');

router.post('/getTransactionStatus', cors(), function(req, res) {
    var web3 = Web3.initiateWeb3();
    var receipt = web3.eth.getTransaction(req.body.txHash);
    res.status(200).json(receipt);
  });
  
  router.post('/test', cors(), function(req, res) {
          console.log(' body',req.body);
  
        var balance=contract.getCoinInstance().balanceOf(req.body.address);
        console.log('balance',balance,' body',req.body);
        res.status(200).json(balance);
  
  
  });

router.post('/sendRawTransaction', cors(), function(req, res) {
  var web3 = Web3.initiateWeb3();
  //checkEtherBalance(req.body.address);
  //Sending the transcation
  web3.eth.sendRawTransaction(req.body.rawTx, function(err, result) {
    console.log(result,"          ",err);
      if (!err) {
          console.log("Transaction completed");
          res.status(200).json({
              transactionHash: result
          });
      } else {
          console.log(err);
      }
  });
});

function checkEtherBalance(address) {
  var balance = web3.eth.getBalance(address);
  if (balance < 1000000000000000000) {
      var result = web3.eth.estimateGas({
          to: address,
          value:1000000000000000000
      });
  }
}

module.exports = router;
