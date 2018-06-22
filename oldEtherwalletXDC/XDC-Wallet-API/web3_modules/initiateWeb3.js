function initiateWeb3(){
	const Web3 = require('web3');
        if (typeof web3 !== 'undefined') {
            web3 = new Web3(web3.currentProvider);
        } else {
            web3 = new Web3(new Web3.providers.HttpProvider("http://78.129.229.22:8546"));
        }
        return web3;
}
module.exports.initiateWeb3=initiateWeb3;