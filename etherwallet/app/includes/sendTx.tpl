<style>

    h1 {
      font-size: 40px;padding-bottom:0px;
    }

@media only screen and (min-width: 900px) {  
    h1 {
     font-size: 70px;padding-bottom:0px;
    }
}
</style>

<main class=" col-sm-12 tab-pane active"
      ng-if="globalService.currentTab==globalService.tabs.sendTransaction.id"
      ng-controller='sendTxCtrl'
      ng-cloak style="padding-top: 50px;padding-left: 0px;margin-top:-10px;">

  <!-- Header : todo turn into warning notification-->
  <div class="alert alert-info" ng-show="hasQueryString">
    <p translate="WARN_Send_Link" >
      You arrived via a link that has the address, amount, gas or data fields filled in for you. You can change any information before sending. Unlock your wallet to get started.
    </p>
  </div>


  <!-- Unlock Wallet -->
  <article  >
 <!--  <article class="collapse-container" > -->
    <!-- <div ng-click="wd = !wd" style="width:65%;"> -->
    <div style="width:65%;">
      <!-- <a class="collapse-button"><span ng-show="wd">+</span><span ng-show="!wd">-</span></a> -->
      <h1 translate="NAV_SendEther1" >
        Send Tokens
      </h1>
    </div>
    
    <div ng-show="!wd" style="width:85%;">
        @@if (site === 'cx' )  {  <cx-wallet-decrypt-drtv></cx-wallet-decrypt-drtv>   }
        @@if (site === 'mew' ) {  <wallet-decrypt-drtv></wallet-decrypt-drtv>         }
    </div>
  </article>


  <!-- Send Tx Content -->
  <article class="row" ng-show="wallet!=null">
    @@if (site === 'mew' ) { @@include( './sendTx-content.tpl', { "site": "mew" } ) }
    @@if (site === 'cx'  ) { @@include( './sendTx-content.tpl', { "site": "cx"  } ) }

    @@if (site === 'mew' ) { @@include( './sendTx-modal.tpl',   { "site": "mew" } ) }
    @@if (site === 'cx'  ) { @@include( './sendTx-modal.tpl',   { "site": "cx"  } ) }
  </article>


</main>
