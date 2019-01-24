
<main class="tab-pane active" ng-if="globalService.currentTab==globalService.tabs.viewWalletInfo.id" ng-controller='viewWalletCtrl' ng-cloak>
  <style>

      h1 {
        font-size: 40px;
      }

    @media only screen and (min-width: 900px) {  
        h1 {
         font-size: 70px;
        }
    }
  </style>
  <!-- <article class="col-sm-6 collapse-container" style="padding-top: 110px;margin-top: 0px;"> -->
    <article class=" " style="padding-top: 40px;margin-top: 0px;">

   <!--  <div ng-click="wd = !wd" style="padding-top:0px;"> -->
    <div  style="padding-top:0px;">
      <!-- <a class="collapse-button">
        <span ng-show="wd">+</span><span ng-show="!wd">-</span>
      </a> -->
      
      <h1 translate="NAV_ViewWallet1" >
        View Wallet Details
      </h1>
    </div>

    <div ng-show="!wd" style="width:85%;" >
      <p translate="VIEWWALLET_Subtitle" style="font-size: 0.95rem;padding-top: 0px;width:50%;display:none;">
        This page allows you to download different versions of private keys and re-print your paper wallet. You may want to do this in order to [import your account into Geth/Mist](http://ethereum.stackexchange.com/questions/465/how-to-import-a-plain-private-key-into-geth/). If you want to check your balance, we recommend using a blockchain explorer like <a href="http://etherscan.io/" target="_blank" rel="noopener noreferrer">etherscan.io</a>.
      </p>
      <wallet-decrypt-drtv></wallet-decrypt-drtv>
    </div>

  </article>

  <article class="row" ng-show="wallet!=null" >

    @@if (site === 'cx' ) {  @@include( './viewWalletInfo-content.tpl', { "site": "cx" } )    }
    @@if (site === 'mew') {  @@include( './viewWalletInfo-content.tpl', { "site": "mew" } )   }

  </article>

</main>
