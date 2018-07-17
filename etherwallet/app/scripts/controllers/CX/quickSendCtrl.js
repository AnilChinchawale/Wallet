'use strict';
var quickSendCtrl = function($scope, $sce, darkList) {
	const Darklist = darkList();
	$scope.allWallets = [];
	$scope.selectedWallet = "";
	$scope.showConfirm = false;
	
    $scope.tx = {
        gasLimit: 2000000,
        data:'',
        to: '',
        unit: "ether",
        value: 0,
        nonce: null,
        gasPrice: null
    }

    $scope.tx1 = {
        to:"",
        value:""
	}
	

	$scope.$watch('tx1', function(newValue, oldValue) {
		if(oldValue.to != newValue.to)
		oldValue.to = newValue.to; 
		else(oldValue.value != newValue.value)
		oldValue.value = newValue.value; 
		$scope.tx.data = $scope.getTxData();
    	console.log("tx.data",$scope.tx.data,"new old ",newValue,oldValue);

    }, true);
    $scope.contract = {
        address:ajaxReq.abiList[1].address,
        abi:JSON.parse(ajaxReq.abiList[1].abi),
        functions: [],
        selectedFunc: null
    }
	$scope.setAllWallets = function() {
		cxFuncs.getWalletsArr(function(wlts) {
			$scope.allWallets = wlts;
			$scope.updateBalance('allWallets');
		});
	};
	$scope.updateBalance = function(varWal) {
		for (var i = 0; i < $scope[varWal].length; i++) {
			$scope.setBalance($scope[varWal][i].addr, i, varWal);
		}
	};
	$scope.setBalance = function(address, id, varWal) {
		ajaxReq.getBalance(address, function(data) {
			if (data.error) {
				$scope[varWal][id].balance = data.msg;
			} else {
				$scope[varWal][id].balance = etherUnits.toEther(data.data.balance, 'wei');
				$scope[varWal][id].balanceR = new BigNumber($scope[varWal][id].balance).toPrecision(5);
			}
		});
	};
	$scope.validateAddress = function() {
		if (ethFuncs.validateEtherAddress($scope.tx1.to)) {
			for(let i = 0; i < Darklist.length; i++) {
				if($scope.tx1.to.length > 0 && $scope.tx1.to.toLowerCase() === Darklist[i].address.toLowerCase()) {
					$scope.validateAddressStatus = Darklist[i].comment !== ""? $sce.trustAsHtml(globalFuncs.getDangerText(`${globalFuncs.phishingWarning[0] + Darklist[i].comment}`)) : $sce.trustAsHtml(globalFuncs.getDangerText(globalFuncs.phishingWarning[1]));
					return;
				} else {
					$scope.validateAddressStatus = $sce.trustAsHtml(globalFuncs.getSuccessText(globalFuncs.successMsgs[0]));
				}
			}
		} else {
			$scope.validateAddressStatus = $sce.trustAsHtml(globalFuncs.getDangerText(globalFuncs.errorMsgs[5]));
		}
	}
	$scope.transferAllBalance = function() {
		$scope.wallet = {};
		$scope.wallet.getAddressString = function() {
			return $scope.allWallets[$scope.selectedWallet].addr;
		}
        uiFuncs.transferAllBalance($scope.wallet.getAddressString(), $scope.tx.gasLimit, function(resp) {
			if (!resp.isError) {
				$scope.tx.unit = resp.unit;
				$scope.tx.value = resp.value;
			} else {
				$scope.validateTxStatus = $sce.trustAsHtml(resp.error);
			}
		});
    }
	
	$scope.getTxData = function() {
        //var abis = [{"constant":false,"inputs":[{"name":"_to","type":"address"},{"name":"_value","type":"uint256"}],"name":"transfer","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"}];
        var curFunc = $scope.contract.abi[0];
        console.log("curFunc in tx",curFunc);
        var fullFuncName = ethUtil.solidityUtils.transformToFullName(curFunc);
        console.log("fullFuncName in tx",fullFuncName);
        var funcSig = ethFuncs.getFunctionSignature(fullFuncName);
        console.log("funcSig in tx",funcSig);
        var typeName = ethUtil.solidityUtils.extractTypeName(fullFuncName);
        console.log("typeName in tx",typeName);
        var types = typeName.split(',');
        console.log("types 1 in tx",types);
        types = types[0] == "" ? [] : types;
        console.log("types 2 in tx",types);
        var values = [$scope.tx1.to,$scope.tx1.value*10000];
        console.log("values in tx",values,"types",types);
        return '0x' + funcSig + ethUtil.solidityCoder.encodeParams(types, values);
    }

	$scope.generateTx = function() {
        try {
            console.log($scope.wallet);
			$scope.showConfirm = true;
            if ($scope.wallet == null) throw globalFuncs.errorMsgs[3];
            else if (!ethFuncs.validateHexString($scope.tx.data)) throw globalFuncs.errorMsgs[9];
			else if (!globalFuncs.isNumeric($scope.tx.gasLimit) || parseFloat($scope.tx.gasLimit) <= 0) throw globalFuncs.errorMsgs[8];
			$scope.tx.data = $scope.getTxData();
			console.log("tx.data",$scope.tx.data);
			$scope.tx.data = ethFuncs.sanitizeHex($scope.tx.data);
            ajaxReq.getTransactionData($scope.wallet.getAddressString(), function(data) {
                if (data.error) $scope.notifier.danger(data.msg);
                data = data.data;
                $scope.tx.to ="0xa1ff1153f68d8f0a8377f2002d59b34034fcf719";
                $scope.tx.contractAddr ='0xa1ff1153f68d8f0a8377f2002d59b34034fcf719';
				var txData = uiFuncs.getTxData($scope);
				console.log($scope);
                uiFuncs.generateTx(txData, function(rawTx) {
                    if (!rawTx.isError) {
                        $scope.rawTx = rawTx.rawTx;
                        $scope.signedTx = rawTx.signedTx;

                        $scope.showRaw = true;
                    } else {
                        $scope.showRaw = false;
                        $scope.notifier.danger(rawTx.error);
                    }
                    if (!$scope.$$phase) $scope.$apply();
                });
            });
        } catch (e) {
			$scope.notifier.danger(e);
			$scope.prepTXStatus = $sce.trustAsHtml(globalFuncs.getDangerText(e));
        }
    }
	$scope.unlockAndSend = function() {
		try {
			$scope.decryptWallet();
			var txData = uiFuncs.getTxData($scope);
			console.log("txdata",txData,"scope",$scope.tx);
			uiFuncs.generateTx(txData, function(rawTx) {
				if (!rawTx.isError) {
					uiFuncs.sendTx(rawTx.signedTx, function(resp) {
						if (!resp.isError) {
							$scope.sendTxStatus = $sce.trustAsHtml(globalFuncs.getSuccessText(globalFuncs.successMsgs[2] + "<br />" + resp.data + "<br /><a href='http://etherscan.io/tx/" + resp.data + "' target='_blank' rel='noopener'> ETH TX via EtherScan.io </a>"));
							$scope.setBalance();
						} else {
							$scope.sendTxStatus = $sce.trustAsHtml(globalFuncs.getDangerText(resp.error));
						}
					});
					$scope.validateTxStatus = $sce.trustAsHtml(globalFuncs.getDangerText(''));
				} else {
					$scope.validateTxStatus = $sce.trustAsHtml(globalFuncs.getDangerText(rawTx.error));
				}
			});
		} catch (e) {
			$scope.validateTxStatus = $sce.trustAsHtml(globalFuncs.getDangerText(e));
		}
    }
    $scope.setVisibility = function(str) {
        $scope.visibility = str;
    }

   
	$scope.decryptWallet = function() {
		$scope.wallet = null;
		$scope.validateTxStatus = "";
		$scope.wallet = Wallet.getWalletFromPrivKeyFile($scope.allWallets[$scope.selectedWallet].priv, $scope.password);
	};

   // $scope.tx.data = $scope.getTxData();
    //console.log("tx.data",$scope.tx.data);
    console.log("$scope.tx",$scope.tx);
    $scope.tx.to = $scope.contract.address;
	$scope.setAllWallets();
};
module.exports = quickSendCtrl;
