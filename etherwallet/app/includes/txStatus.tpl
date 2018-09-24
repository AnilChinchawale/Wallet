<style>

    h1 {
      font-size: 40px;padding-bottom:0px;text-align: left;
    }

@media only screen and (min-width: 900px) {  
    h1 {
     font-size: 70px;padding-bottom:0px;text-align: left;
    }
}
</style>
<main class="tab-pane block--container active" ng-if="globalService.currentTab==globalService.tabs.txStatus.id" ng-controller='txStatusCtrl' role="main" ng-cloak>

  <!-- Section 1 -->
  
    
  <section class="col-sm-8 block txstatus__1" style="padding-top:40px;margin-left: 0px;padding-left: 10px;">
    <article class="" style="margin-left: 0px;padding-left: 0px;padding-top: 0px;margin-top: 0px;">
      <section class=" col-sm-offset-2 text-center" style="margin-left: 0px;padding-left: 0px;color:#000;padding-top: 0px;">
        <h1 translate="NAV_CheckTxStatus1" >
          Check TX Status
        </h1>
        <p translate="tx_Summary" style="text-align: justify;padding-top: 0px;width:75%;color:#000;"></p>
      </section>

      <section class="col-xs-12 col-sm-8 col-sm-offset-3 text-center" style="margin-left: 0px;padding-left: 0px;color:#000;">
          <input
             class="form-control"
             type="text"
             placeholder="0x3f0efedfe0a0cd611f2465fac9a3699f92d6a06613bc3ead4f786856f5c73e9c"
             ng-model="txInfo.hash"
             ng-keyup="$event.keyCode == 13 && checkTxStatus()"
             aria-label="{{'x_TxHash' | translate}}" ng-class="Validator.isValidTxHash(txInfo.hash) ? 'is-valid' : 'is-invalid'" style="border-radius: 40px;margin: 0px;border:1px solid #16D0C5;"/>
          <button tabindex="0"
                  role="button"
                  class="btn btn-primary site-btn sb-gradients hero-subscribe-from"
                  ng-click="checkTxStatus()"
                  translate="NAV_CheckTxStatus" style="margin: 20px;"> Check TX Status </button>
      </section>
    </article>
  </section>
  <!-- / Section 1 -->
  

  
  
  <!-- Section 2: Current State -->
  <section class="block txstatus__2" ng-show="txInfo.status==txStatus.mined || txInfo.status==txStatus.notFound || txInfo.status==txStatus.found" >
   

    <div class="col-sm-7"></div>
     <style>

        dl {
          padding-left: 140px;margin-left:650px;float:right;height: 308px;margin-top:-450px;
           color:#fff;margin-bottom:-140px;
          
        }
       
      @media only screen and (max-width: 900px) {  
        dl {
          padding-left: 0px;margin-left:5px;float:left;height: 300px;margin-top:0px;
          }
          
      }
    </style>
     
  <!-- <div class="col-sm-5 " style="padding-left: 50px;display: block;background-image: url(images/lap-top2.png);background-repeat: no-repeat;margin-left:585px;margin-top:-520px;height: 308px;"> --> 
  <!-- <table class="col-sm-5 " style="padding-left: 140px;margin-left:585px;float:right;height: 308px;margin-top:-450px;"> -->
  <dl class="col-sm-5 " >
    <style>

        h3,h5,a,p {
          color:#fff;
          
        }
       
      @media only screen and (max-width: 900px) {  
        h3,h5,a,p {
           color:#000;
          }
          
      }
    </style>
    
    <div class=" cont-md" ng-show="txInfo.status == txStatus.mined" >
      <h3  translate="tx_FoundOnChain" style="padding:10px;padding-left: 0px;"> Transaction Found </h3>
      <h5 > <a href="https://etherscan.io/tx/{{ tx.hash }}" target="_blank" rel="noopener noreferrer" > {{ tx.hash }} </a> </h5>
      <p ><strong translate="tx_FoundOnChain_1" ></strong></p>
      <ul style="display:none;">
        <li translate="tx_FoundOnChain_2"></li>
        <li translate="tx_FoundOnChain_3"></li>
      </ul>
    </div>
  </dl>

 

    <div class="cont-md" ng-show="txInfo.status == txStatus.notFound" style="display:none;">
      <h3 class="text-danger" translate="tx_notFound">
        Transaction Not Found
      </h3>
      <p>
        <strong translate="tx_notFound_1"></strong>
      </p>
      <ul>
        <li translate="tx_notFound_2"></li>
        <li translate="tx_notFound_3"></li>
        <li translate="tx_notFound_4"></li>
      </ul>
    </div>

    <div class="cont-md" ng-show="txInfo.status == txStatus.found" style="display:none;">
      <h3 class="text-warning" translate="tx_foundInPending" >
        Pending Transaction Found
      </h3>
      <ul>
        <li translate="tx_foundInPending_1"></li>
        <li translate="tx_foundInPending_2"></li>
        <li translate="tx_foundInPending_3"></li>
      </ul>
    </div>

    <div ng-show="txInfo.status == txStatus.found || txInfo.status == txStatus.mined" style="width: 75%;float: left;overflow: auto;color:#000;">
      <h4 translate="tx_Details" class="cont-md" style="color:#000;">
        Transaction Details
      </h4>
      <br />
      <table class="table table-striped txstatus__2 cont-md"  > <!-- ng-show="tx.status=='foundOnChain' || foundInPending'"-->
        <tbody>
          <tr>
            <td translate="x_TxHash" style="color:#000;">
              TX Hash
            </td>
            <td>
              <a href="https://etherscan.io/tx/{{ txInfo.hash }}" target="_blank" rel="noopener noreferrer" style="color:#000;">
                {{ txInfo.hash }}
              </a>
            </td>
          </tr>
          <tr>
            <td translate="OFFLINE_Step1_Label_1" style="color:#000;">
              From Address
            </td>
            <td>
              <a href="https://etherscan.io/address/{{ txInfo.from }}" target="_blank" rel="noopener noreferrer" style="color:#000;">
                {{ txInfo.from }}
              </a>
            </td>
          </tr>
          <tr>
            <td translate="OFFLINE_Step2_Label_1" style="color:#000;">
              To Address
            </td>
            <td>
              <a href="https://etherscan.io/address/{{ txInfo.to }}" target="_blank" rel="noopener noreferrer" style="color:#000;">
                {{ txInfo.to }}
              </a>
            </td>
          </tr>
          <tr>
            <td translate="SEND_amount_short" style="color:#000;">
              Amount
            </td>
            <td style="color:#000;"> 
              {{ txInfo.valueStr }}
            </td>
          </tr>
          <tr>
            <td>
              <a class="account-help-icon"
                 href="https://myetherwallet.github.io/knowledge-base/transactions/what-is-nonce.html"
                 target="_blank"
                 rel="noopener noreferrer" style="color:#000;">
                   <img src="images/icon-help.svg" class="help-icon" />
                  <p class="account-help-text" translate="NONCE_Desc" style="color:#000;"></p>
              </a>
              <span translate="OFFLINE_Step2_Label_5">
                Nonce
              </span>
            </td>
            <td>
              {{ txInfo.nonce }}
            </td>
          </tr>
          <tr>
            <td>
              <a class="account-help-icon"
                 href="https://myetherwallet.github.io/knowledge-base/gas/what-is-gas-ethereum.html"
                 target="_blank"
                 rel="noopener noreferrer" style="color:#000;">
                    <img src="images/icon-help.svg" class="help-icon" />
                    <p class="account-help-text" translate="GAS_LIMIT_Desc" style="color:#000;"></p>
              </a>
              <span translate="OFFLINE_Step2_Label_4">
                Gas Limit
              </span>
            </td>
            <td>
              {{ txInfo.gasLimit }}
            </td>
          </tr>
          <tr>
            <td>
              <a class="account-help-icon"
                 href="https://myetherwallet.github.io/knowledge-base/gas/what-is-gas-ethereum.html"
                 target="_blank"
                 rel="noopener noreferrer">
                   <img src="images/icon-help.svg" class="help-icon" />
                   <p class="account-help-text" translate="GAS_PRICE_Desc"></p>
              </a>
              <span translate="OFFLINE_Step2_Label_3">
                Gas Price
              </span>
            </td>
            <td>
              {{ txInfo.gasPrice.gwei }} GWEI
              <small>
                ({{ txInfo.gasPrice.wei }} WEI)
              </small>
            </td>
          </tr>
        <!--
          <tr>
            <td>
              <a class="account-help-icon"
                 href="https://myetherwallet.github.io/knowledge-base/gas/what-is-gas-ethereum.html"
                 target="_blank"
                 rel="noopener noreferrer">
                   <img src="images/icon-help.svg" class="help-icon" />
                   <p class="account-help-text" translate="TXFEE_Desc"></p>
              </a>
              <span translate="x_TXFee">
                TX Fee
              </span>
            </td>
            <td>
              ({{ txFee.eth }} ETH)
              <small>({{ txFee.usd }} USD)</small>
            </td>
          </tr>
        -->
          <tr>
            <td translate="OFFLINE_Step2_Label_6">
              Data
            </td>
            <td>
              {{ txInfo.data }}
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </section>
  <!-- / Section 2: Current State -->
  

  <!-- Section 3:  Unlock -->
  <section class="txstatus__3" ng-show="txInfo.status == txStatus.found">

    <br><br>

    <h1 class="text-center" translate="x_CancelReplaceTx">
      Cancel or Replace Transaction
    </h1>

    <section class="clearfix collapse-container">
      <div class="text-center" ng-click="wd = !wd">
        <a class="collapse-button"><span ng-show="wd">+</span><span ng-show="!wd">-</span></a>
        <h4 class="text-danger text-center">
          Unlock your wallet to replace your transaction. (But, please be careful)
        </h4>
      </div>
      <div ng-show="!wd">
          @@if (site === 'mew' ) {  <wallet-decrypt-drtv></wallet-decrypt-drtv>         }
          @@if (site === 'cx' )  {  <cx-wallet-decrypt-drtv></cx-wallet-decrypt-drtv>   }
      </div>
    </section>
  </section>
  <!-- / Section 3:  Unlock -->

  <!-- Send Tx Content -->
 <section class="row" ng-show="wallet!=null" ng-controller='sendTxCtrl'>
    <div ng-show="wallet.getChecksumAddressString() == txInfo.from">
      @@if (site === 'mew' ) { @@include( './sendTx-content.tpl', { "site": "mew" } ) }
      @@if (site === 'cx'  ) { @@include( './sendTx-content.tpl', { "site": "cx"  } ) }

      @@if (site === 'mew' ) { @@include( './sendTx-modal.tpl',   { "site": "mew" } ) }
      @@if (site === 'cx'  ) { @@include( './sendTx-modal.tpl',   { "site": "cx"  } ) }
    </div>
    <div class="col-xs-12 block block--danger" ng-show="wallet.getChecksumAddressString()!=txInfo.from">
      <h5 translate="ENS_WrongAddress_2">
        Please unlock the wallet with address
      </h5>
      {{ txInfo.from }}
    </div>
  </section>
