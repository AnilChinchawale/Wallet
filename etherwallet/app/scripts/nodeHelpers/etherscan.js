'use strict';
var etherscan = function() {}
etherscan.SERVERURL = "https://api.etherscan.io/api";
etherscan.pendingPosts = [];
etherscan.config = {
    headers: {
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
    }
};

etherscan.getCurrentBlock = function(callback) {
    this.post({
        module: 'proxy',
        action: 'eth_blockNumber'
    }, function(data) {
        if (data.error) callback({ error: true, msg: data.error.message, data: '' });
        else callback({ error: false, msg: '', data: new BigNumber(data.result).toString() });
    });
}
etherscan.getBalance = function(addr, callback) {
    this.post({
        module: 'account',
        action: 'balance',
        address: addr,
        tag: 'latest'
    }, function(data) {
        if (data.message != 'OK') callback({ error: true, msg: data.message, data: '' });
        else callback({ error: false, msg: '', data: { address: addr, balance: data.result } });
    });
}
etherscan.getTransaction = function(txHash, callback) {
    this.post1({
        module: 'proxy',
        action: 'eth_getTransactionByHash',
        txhash: txHash,
    }, function(data) {
        console.log("data eth_getTransactionByHash :::::::::::::::::::  ",data);
        /*{
  "blockHash": "0xe3738974a0587a5d426aea1d486fd9df4f41b88c8b0d958d374cdb11f59dd98d",
  "blockNumber": "0x594478",
  "from": "0x3a456874fc9dd9867d14ca9fead9719010958468",
  "gas": "0x5208",
  "gasPrice": "0xee6b2800",
  "hash": "0x429c7db6fab7d98db464512c76849db8cfb36d7f2de043d3f24cdb59cea3c81e",
  "input": "0x",
  "nonce": "0xa",
  "to": "0x915d7915f2b469bb654a7d903a5d4417cb8ea7df",
  "transactionIndex": "0x64",
  "value": "0x1f0d9be587bb0000",
  "v": "0x26",
  "r": "0x54e52032e76186986dafb1d06673c88e747846c5b6a044128b1251f4aff8fc6",
  "s": "0x2f285e554b89fc6c61442d23b7869129a7f760617e778fc9140e8a17ed3c92df"
}*/
        if (data.error) callback({ error: true, msg: data.error.message, data: '' });
        else callback({ error: false, msg: '', data: data});
    });
}
etherscan.getTransactionData = function(addr, callback) {
    var response = { error: false, msg: '', data: { address: addr, balance: '', gasprice: '', nonce: '' } };
    var parentObj = this;
    parentObj.getBalance(addr, function(data) {
        if (data.error) {
            callback({ error: true, msg: data.msg, data: '' });
            return;
        }
        response.data.balance = data.data.balance;
        parentObj.post({
            module: 'proxy',
            action: 'eth_gasPrice'
        }, function(data) {
            if (data.error) {
                callback({ error: true, msg: data.error.message, data: '' });
                return;
            }
            response.data.gasprice = data.result;
            parentObj.post({
                module: 'proxy',
                address: addr,
                action: 'eth_getTransactionCount',
                tag: 'latest'
            }, function(data) {
                if (data.error) {
                    callback({ error: true, msg: data.error.message, data: '' });
                    return;
                }
                response.data.nonce = data.result;
                callback(response);
            });
        });
    });
}
etherscan.sendRawTx = function(rawTx, callback) {
    this.post({
        module: 'proxy',
        action: 'eth_sendRawTransaction',
        hex: rawTx
    }, function(data) {
        if (data.error) callback({ error: true, msg: data.error.message, data: '' });
        else callback({ error: false, msg: '', data: data.result });
    });
}
etherscan.getEstimatedGas = function(txobj, callback) {
    this.post({
        module: 'proxy',
        action: 'eth_estimateGas',
        to: txobj.to,
        value: txobj.value,
        data: txobj.data,
        from: txobj.from
    }, function(data) {
        if (data.error) callback({ error: true, msg: data.error.message, data: '' });
        else callback({ error: false, msg: '', data: data.result });
    });
}
etherscan.getEthCall = function(txobj, callback) {
    this.post({
        module: 'proxy',
        action: 'eth_call',
        to: txobj.to,
        data: txobj.data
    }, function(data) {
        if (data.error) callback({ error: true, msg: data.error.message, data: '' });
        else callback({ error: false, msg: '', data: data.result });
    });
}
etherscan.queuePost = function() {
    var data = this.pendingPosts[0].data;
    var callback = this.pendingPosts[0].callback;
    var parentObj = this;
    data.apikey = 'DSH5B24BQYKD1AD8KUCDY3SAQSS6ZAU175';
    
    console.log("this.SERVERURL"   , this.SERVERURL,"data"   , data, "this .config   ", this.config);
    ajaxReq.http.post(this.SERVERURL, ajaxReq.postSerializer(data), this.config).then(function(data) {
        callback(data.data);
        parentObj.pendingPosts.splice(0, 1);
        if (parentObj.pendingPosts.length > 0) parentObj.queuePost();
    }, function(data) {
        callback({ error: true, msg: "connection error", data: "" });
    });
}
etherscan.post = function(data, callback) {
    this.pendingPosts.push({
        data: data,
        callback: function(_data) {
            callback(_data);
        }
    });
    if (this.pendingPosts.length == 1) this.queuePost();
}

etherscan.queuePost1 = function() {
    var data = this.pendingPosts[0].data;
    var callback = this.pendingPosts[0].callback;
    var parentObj = this;
    data.apikey = 'DSH5B24BQYKD1AD8KUCDY3SAQSS6ZAU175';
    
    var SERVERURL="http://90.0.0.68:35108/txStatus";
    console.log("this.SERVERURL::::::::::"   , this.SERVERURL,"data"   , data, "this .config   ", this.config);
    ajaxReq.http.post(SERVERURL, ajaxReq.postSerializer(data), this.config).then(function(data) {
        callback(data.data);
        parentObj.pendingPosts.splice(0, 1);
        if (parentObj.pendingPosts.length > 0) parentObj.queuePost1();
    }, function(data) {
        callback({ error: true, msg: "connection error", data: "" });
    });
}
etherscan.post1 = function(data, callback) {
    this.pendingPosts.push({
        data: data,
        callback: function(_data) {
            callback(_data);
        }
    });
    if (this.pendingPosts.length == 1) this.queuePost1();
}


module.exports = etherscan;
