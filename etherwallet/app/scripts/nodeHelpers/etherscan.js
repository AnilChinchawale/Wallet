'use strict';
var xinfin = function() {}
xinfin.SERVERURL = "http://localhost:3000/";
xinfin.pendingPosts = [];
xinfin.config = {
    headers: {
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
    }
};

xinfin.getCurrentBlock = function(callback) {
    this.post({
        module: 'proxy',
        action: 'blockNumber'
    }, function(data) {
        if (data.error) callback({ error: true, msg: data.error.message, data: '' });
        else callback({ error: false, msg: '', data: new BigNumber(data.result).toString() });
    });
}
xinfin.getBalance = function(addr, callback) {
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
xinfin.getTransaction = function(txHash, callback) {
    this.post({
        module: 'proxy',
        action: 'transactionByHash',
        txhash: txHash,
    }, function(data) {
        if (data.error) callback({ error: true, msg: data.error.message, data: '' });
        else callback({ error: false, msg: '', data: data.result });
    });
}
xinfin.getTransactionData = function(addr, callback) {
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
            action: 'gasPrice'
        }, function(data) {
            if (data.error) {
                callback({ error: true, msg: data.error.message, data: '' });
                return;
            }
            response.data.gasprice = data.result;
            parentObj.post({
                module: 'proxy',
                address: addr,
                action: 'getTransactionCount',
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
xinfin.sendRawTx = function(rawTx, callback) {
    this.post({
        module: 'proxy',
        action: 'sendRawTransaction',
        hex: rawTx
    }, function(data) {
        if (data.error) callback({ error: true, msg: data.error.message, data: '' });
        else callback({ error: false, msg: '', data: data.result });
    });
}
xinfin.getEstimatedGas = function(txobj, callback) {
    this.post({
        module: 'proxy',
        action: 'estimateGas',
        to: txobj.to,
        value: txobj.value,
        data: txobj.data,
        from: txobj.from
    }, function(data) {
        if (data.error) callback({ error: true, msg: data.error.message, data: '' });
        else callback({ error: false, msg: '', data: data.result });
    });
}
xinfin.getEthCall = function(txobj, callback) {
    this.post({
        module: 'proxy',
        action: 'call',
        to: txobj.to,
        data: txobj.data
    }, function(data) {
        if (data.error) callback({ error: true, msg: data.error.message, data: '' });
        else callback({ error: false, msg: '', data: data.result });
    });
}
xinfin.queuePost = function() {
    var data = this.pendingPosts[0].data;
    var callback = this.pendingPosts[0].callback;
    var parentObj = this;
    data.apikey = 'DSH5B24BQYKD1AD8KUCDY3SAQSS6ZAU175';
    ajaxReq.http.post(this.SERVERURL+data.action, ajaxReq.postSerializer(data), this.config).then(function(data) {
        callback(data.data);
        parentObj.pendingPosts.splice(0, 1);
        if (parentObj.pendingPosts.length > 0) parentObj.queuePost();
    }, function(data) {
        callback({ error: true, msg: "connection error", data: "" });
    });
}
xinfin.post = function(data, callback) {
    this.pendingPosts.push({
        data: data,
        callback: function(_data) {
            callback(_data);
        }
    });
    if (this.pendingPosts.length == 1) this.queuePost();
}
module.exports = xinfin;