<section class="{{curNode.name}} {{curNode.service}} {{curNode.service}} nav-index-{{gService.currentTab}} hero-section" aria-label="header" ng-controller='tabsCtrl' >
<div class="col-xs-3">
 <a href="http://125.99.122.186:81/XinFin_new/dist/index.html">
  <img src="images/xinfin_logo.png" />
 </a>
</div>
<div class="col-xs-9">
<!-- red bar at top.
@@if (site === 'mew' ) {
  <div class="small announcement annoucement-danger">
    <div class="container">
      DON'T GET PHISHED, please! 🎣 Thank you! 🤗
      <br />
      1. BOOKMARK <a href="https://www.xdcewallet.com"> XDCEWALLET.COM </a>
      <span class="hidden-xs">
        &nbsp;&nbsp;&nbsp;&nbsp;
        2. INSTALL <a href="https://chrome.google.com/webstore/detail/etheraddresslookup/pdknmigbbbhmllnmgdfalmedcmcefdfn" target="_blank" rel="noopener noreferrer">EAL</a>
        or
        <a href="https://myetherwallet.github.io/knowledge-base/migration/moving-from-private-key-to-metamask.html" target="_blank" rel="noopener noreferrer">MetaMask</a>
        or
        <a href="https://chrome.google.com/webstore/detail/cryptonite-by-metacert/keghdcpemohlojlglbiegihkljkgnige" target="_blank" rel="noopener noreferrer">Cryptonite</a>
      </span>
    </div>
  </div>
}-->

<section class="bg-gradient header-branding " >
  <section class="container ">
    @@if (site === 'mew' ) {
      <a class="brand" href="/" aria-label="Go to homepage">
        <!-- <img src="images/xinfinewallet_transparent.png"   height="64px" width="245px" alt="XinFinEWallet" /> -->
        <!--<p class="small visible-xs">3.21.13</p>-->
      </a>
    }
    @@if (site === 'cx'  ) {
      <a class="brand" href="/cx-wallet.html" aria-label="Go to homepage">
       <!--  <img src="images/xinfinewallet_transparent.png" height="64px" width="245px" alt="XinFinEWallet" /> -->
        <!--<p class="small visible-xs">3.21.13</p>-->
      </a>
    }
    <div class="tagline" >

    <!--<span class="hidden-xs">3.21.13</span>-->

    <span class="dropdown dropdown-lang" ng-cloak style="padding-right: 80px;color:#000;">
      <a tabindex="0"  aria-haspopup="true" aria-expanded="false" aria-label="change language. current language {{curLang}}" class="dropdown-toggle  btn btn-white" ng-click="dropdown = !dropdown" style="
    border: 1px solid  #16D0C5;border-radius: 20px;">{{curLang}}<i class="caret"></i></a>
      <ul class="dropdown-menu" ng-show="dropdown" style="background: linear-gradient(-100deg, #16D0C5,#16D0C5, #20509E, #20509E);color:#fff;">
        <li ><a ng-class="{true:''}[curLang=='Català']" ng-click="changeLanguage('ca','Català'         )"  style="color:#fff;"> Català  </a></li>
        <li ><a ng-class="{true:''}[curLang=='Deutsch']"         ng-click="changeLanguage('de','Deutsch'        )" style="color:#fff;"> Deutsch         </a></li>
        <li ><a ng-class="{true:''}[curLang=='Ελληνικά']"        ng-click="changeLanguage('el','Ελληνικά'       )" style="color:#fff;"> Ελληνικά        </a></li>
        <li ><a ng-class="{true:''}[curLang=='English']"         ng-click="changeLanguage('en','English'        )" style="color:#fff;"> English         </a></li>
        <li ><a ng-class="{true:''}[curLang=='Español']"         ng-click="changeLanguage('es','Español'        )" style="color:#fff;"> Español         </a></li>
        <li><a ng-class="{true:''}[curLang=='Farsi']"           ng-click="changeLanguage('fa','Farsi'          )" style="color:#fff;"> Farsi           </a></li>
        <li><a ng-class="{true:''}[curLang=='Suomi']"           ng-click="changeLanguage('fi','Suomi'          )" style="color:#fff;"> Suomi           </a></li>
        <li><a ng-class="{true:''}[curLang=='Français']"        ng-click="changeLanguage('fr','Français'       )" style="color:#fff;"> Français        </a></li>
        <li><a ng-class="{true:''}[curLang=='Magyar']"          ng-click="changeLanguage('hu','Magyar'         )" style="color:#fff;"> Magyar          </a></li>
        <li><a ng-class="{true:''}[curLang=='Haitian Creole']"  ng-click="changeLanguage('ht','Haitian Creole' )" style="color:#fff;"> Haitian Creole  </a></li>
        <li><a ng-class="{true:''}[curLang=='Indonesian']"      ng-click="changeLanguage('id','Indonesian'     )" style="color:#fff;"> Bahasa Indonesia</a></li>
        <li><a ng-class="{true:''}[curLang=='Italiano']"        ng-click="changeLanguage('it','Italiano'       )" style="color:#fff;"> Italiano        </a></li>
        <li><a ng-class="{true:''}[curLang=='日本語']"           ng-click="changeLanguage('ja','日本語'          )" style="color:#fff;"> 日本語          </a></li>
        <li><a ng-class="{true:''}[curLang=='한국어']"            ng-click="changeLanguage('ko','한국어'          )" style="color:#fff;"> 한국어           </a></li>
        <li><a ng-class="{true:''}[curLang=='Nederlands']"      ng-click="changeLanguage('nl','Nederlands'     )" style="color:#fff;"> Nederlands      </a></li>
        <li><a ng-class="{true:''}[curLang=='Norsk Bokmål']" ng-click="changeLanguage('no','Norsk Bokmål'   )" style="color:#fff;"> Norsk Bokmål    </a></li>
        <li><a ng-class="{true:''}[curLang=='Polski']"          ng-click="changeLanguage('pl','Polski'         )" style="color:#fff;"> Polski          </a></li>
        <li><a ng-class="{true:''}[curLang=='Português']"       ng-click="changeLanguage('pt','Português'      )" style="color:#fff;"> Português       </a></li>
        <li><a ng-class="{true:''}[curLang=='Русский']"         ng-click="changeLanguage('ru','Русский'        )" style="color:#fff;"> Русский         </a></li>
        <li><a ng-class="{true:''}[curLang=='ภาษาไทย']"         ng-click="changeLanguage('th','ภาษาไทย'        )" style="color:#fff;"> ภาษาไทย         </a></li>
        <li><a ng-class="{true:''}[curLang=='Türkçe']"          ng-click="changeLanguage('tr','Türkçe'         )" style="color:#fff;"> Türkçe          </a></li>
        <li><a ng-class="{true:''}[curLang=='Tiếng Việt']"      ng-click="changeLanguage('vi','Tiếng Việt'     )" style="color:#fff;"> Tiếng Việt      </a></li>
        <li><a ng-class="{true:''}[curLang=='简体中文']"         ng-click="changeLanguage('zhcn','简体中文'      )" style="color:#fff;"> 简体中文         </a></li>
        <li><a ng-class="{true:''}[curLang=='繁體中文']"         ng-click="changeLanguage('zhtw','繁體中文'      )" style="color:#fff;"> 繁體中文         </a></li>
        <li role="separator" class="divider"></li>
        <li><a data-toggle="modal" data-target="#disclaimerModal" translate="FOOTER_4"> Disclaimer </a></li>
      </ul>
    </span>

    <!--<span class="dropdown dropdown-gas" ng-cloak>
      <a tabindex="0" aria-haspopup="true" aria-label="adjust gas price" class="dropdown-toggle  btn btn-white" ng-click="dropdownGasPrice = !dropdownGasPrice">
        <span translate="OFFLINE_Step2_Label_3">Gas Price</span>:
          {{gas.value}} Gwei
          <i class="caret"></i>
      </a>
      <ul class="dropdown-menu" ng-show="dropdownGasPrice">
        <div class="header--gas">
          <span translate="OFFLINE_Step2_Label_3">Gas Price</span>:
          {{gas.value}} Gwei
          <input type="range" ng-model="gas.value" min="{{gas.min}}" max="{{gas.max}}" step="{{gas.step}}" ng-change="gasChanged()"/>
          <p class="small col-xs-4 text-left">--> <!--translate="GAS_Price_1"-->
            <!--Really, really slow
          </p>
          <p class="small col-xs-4 text-center">--> <!--translate="GAS_Price_2"-->
            <!--Maybe Fast?
          </p>
          <p class="small col-xs-4 text-right">--> <!--translate="GAS_Price_3"-->
            <!--Fast
          </p>
          <br />
          <p class="small" style="white-space:normal;font-weight:300;margin: 2rem 0 0;" translate="GAS_PRICE_Desc"></p>
          <a class="small"
             translate="x_ReadMore"
             href="https://myetherwallet.github.io/knowledge-base/gas/what-is-gas-ethereum.html"
             target="_blank"
             rel="noopener noreferrer"></a>
        </div>
      </ul>-->
      <!--<p class="dropdown-gas__msg"
         ng-show="gasPriceMsg"
         ng-hide="ajaxReq.type!='ETH'">
        The network is really full right now. Check
        <a href="https://ethgasstation.info/"
           target="_blank" rel="noopener noreferrer">Eth Gas Station</a>
        for gas price to use.
      </p>-->
    <!--</span>-->

    <!-- Warning: The separators you see on the frontend are in styles/etherwallet-custom.less. If you add / change a node, you have to adjust these. Ping tayvano if you're not a CSS wizard -->
    <span class="dropdown dropdown-node" ng-cloak style="color:#000;">
      <a tabindex="0"
         aria-haspopup="true"
         aria-label="change node. current node {{curNode.name}} node by {{curNode.service}}"
         class="dropdown-toggle  btn btn-white"
         ng-click="dropdownNode = !dropdownNode" style="border: 1px solid  #16D0C5;border-radius: 20px;">
           <span translate="X_Network">Network:</span>
           {{curNode.name}}
           <small>({{curNode.service}})</small>
           <i class="caret"></i>
      </a>
      <ul class="dropdown-menu" ng-show="dropdownNode" style=" background: linear-gradient(-100deg, #16D0C5, #16D0C5, #20509E, #20509E);">
        <li ng-repeat="(key, value) in nodeList" >
          <a ng-class="{true:'active'}[curNode == key]" ng-click="changeNode(key)" style="color:#fff;">
            {{value.name}}
            <small> ({{value.service}}) </small>
            <img ng-show="value.service=='Custom'" src="images/icon-remove.svg" class="node-remove" title="Remove Custom Node" ng-click="removeNodeFromLocal(value.name)"/>
          </a>
        </li>
        <li style="color:#fff;">
          <a ng-click="customNodeModal.open(); dropdownNode = !dropdownNode;" translate="X_Network_Custom" style="color:#fff;">
            Add Custom Network / Node
          </a>
        </li>
      </ul>
    </span>

    </div>
  </section>
</section>
</div>

<nav role="navigation" aria-label="main navigation" class="container nav-container overflowing" style="padding: 10px;">
  <!--<a aria-hidden="true" ng-show="showLeftArrow" class="nav-arrow-left" ng-click="scrollLeft(100);" ng-mouseover="scrollHoverIn(true,2);" ng-mouseleave="scrollHoverOut()">&#171;</a>-->
  <div class=" col-sm-6 nav-scroll" style="text-align: right;width:50%">
    <ul class="nav-inner" >
      @@if (site === 'mew' ) {
      <li ng-repeat="tab in tabNames track by $index" \
          class="nav-item {{tab.name}}" \
          ng-class="{active: $index==gService.currentTab}"
          ng-show="tab.mew"
          ng-click="tabClick($index)" >
            <a tabindex="0" aria-label="nav item: {{tab.name | translate}}" translate="{{tab.name}}" style="color:#fff;font-weight:bold;"></a>
      </li>
      }
      @@if (site === 'cx' ) {
      <li ng-repeat="tab in tabNames track by $index" \
          class="nav-item {{tab.name}}" \
          ng-class="{active: $index==gService.currentTab}"
          ng-show="tab.cx"
          ng-click="tabClick($index)">
            <a tabindex="0" aria-label="nav item: {{tab.name | translate}}" translate="{{tab.name}}" style="color:#fff;font-weight:bold;"></a>
      </li>
      }
      <!--
      <li class="nav-item help">
        <a href="https://myetherwallet.github.io/knowledge-base/" target="_blank" rel="noopener noreferrer">
          <span translate="NAV_Help">
            Help
          </span>
        </a>
      </li>-->
    </ul>
  </div>
  <!--
  <a aria-hidden="true"
     ng-show="showRightArrow"
     class="nav-arrow-right"
     ng-click="scrollRight(100);"
     ng-mouseover="scrollHoverIn(false,2);"
     ng-mouseleave="scrollHoverOut()">&#187;</a>-->
</nav>


@@if (site === 'mew' ) { @@include( './header-node-modal.tpl', { "site": "mew" } ) }
@@if (site === 'cx'  ) { @@include( './header-node-modal.tpl', { "site": "cx"  } ) }

</section>

<main class="tab-pane block--container active"
      ng-if="globalService.currentTab==globalService.tabs.generateWallet.id"
      ng-controller='walletGenCtrl'
      role="main"
      ng-cloak>

  <!-- <article class="block__wrap gen__1" ng-show="!wallet && !showGetAddress">
    <section class="block__main gen__1--inner"> -->
<style>
    p {
        /*background-color: lightblue;*/
        font-size: 40px;   
    }
    article{
        padding-top: 50px;
    }
  @media only screen and (min-width: 900px) {  
    p {
      /*background-color: lightgreen;*/
      font-size: 70px;
    }
    article{
        padding-top: 50px;
    }
  }
</style>
  <article class="" ng-show="!wallet && !showGetAddress" >
    <section >
     <div class="col-sm-6">
      <p translate="NAV_GenerateWallet" aria-live="polite"  style="margin-bottom:45px;"></p> 
      <!-- <h4 translate="GEN_Label_1">
        Enter password
      </h4> -->
      <div class=" input-group" >
        <style>
            
            span{
                border-radius: 40px;
            }

          @media only screen and (min-width: 900px) {  
            
            span{
                border-radius: 40px;
            }
          }
        </style>
          <input name="password"
               class="form-control "
               type="{{showPass && 'password' || 'text'}}"
               placeholder="{{'GEN_Placeholder_1' | translate }}"
               ng-model="password"
               ng-class="isStrongPass() ? 'is-valid' : 'is-invalid'"
               aria-label="{{'GEN_Label_1' | translate}}" style="border-color:#16D0C5;
                border-radius: 40px;"
               />
          <span  tabindex="0"
                aria-label="make password visible"
                role="button"
                class=" input-group-addon eye span"
                ng-click="showPass=!showPass" >
          </span>
        </div>
         <!-- <a tabindex="0"
           role="button"
           class=" btn btn-primary site-btn sb-gradients hero-subscribe-from"
           ng-click="genNewWallet()"
           translate="NAV_GenerateWallet" style="margin-top: 35px;margin-bottom: 35px;">
             Generate Wallet
        </a> -->
        <a tabindex="0"
           role="button"
           class=" btn btn-primary site-btn sb-gradients "
           ng-click="genNewWallet()" translate="NAV_GenerateWallet1" style="margin-top: 35px;margin-bottom: 35px;">
            Create New Wallet
        </a>
       @@include('./apple-mobile-modal.tpl', { "site": "" } )
      <p style="float: left;font-size:15px;" translate="x_PasswordDesc"></p> 
      
      <!-- <div class="text-center">
        <strong>
          <a href="https://myetherwallet.github.io/knowledge-base/getting-started/creating-a-new-wallet-on-myetherwallet.html"
             target="_blank"
             rel="noopener noreferrer"
             translate="GEN_Help_5">
               How to Create a Wallet
          </a>
          &nbsp;&nbsp;&middot;&nbsp;&nbsp;
          <a href="https://myetherwallet.github.io/knowledge-base/getting-started/getting-started-new.html"
             target="_blank"
             rel="noopener noreferrer"
             translate="GEN_Help_6">
               Getting Started
          </a>
        </strong>
      </div> -->
      
    </div>
    <div class="col-sm-6">

      <!-- <img src="images/wallet.png" style="margin-left: 50px;"> -->

    </div>
    </section>

    <!-- <section class="block__help"> -->
<!--      <section >
      
      <img src="../app/images/wallet.png" style="margin-left:200px;"> -->

      <!-- <h2 translate="GEN_Help_0">
        Already have a wallet somewhere?
      </h2>

      <ul>
        <li>
          <p>
            <strong>
              Ledger / TREZOR / Digital Bitbox / Secalot
            </strong>:
            <span translate="GEN_Help_1">
              Use your
            </span>
            <a ng-click="globalService.currentTab=globalService.tabs.sendTransaction.id">
              hardware wallet
            </a>.
            <span translate="GEN_Help_3">
              Your device * is * your wallet.
            </span>
          </p>
        </li>
      </ul>

      <ul>
        <li>
          <p>
            <strong>
              MetaMask
            </strong>
            <span>
              Connect via your
            </span>
            <a ng-click="globalService.currentTab=globalService.tabs.sendTransaction.id">
              MetaMask Extension
            </a>.
            <span translate="GEN_Help_MetaMask">
              So easy! Keys stay in MetaMask, not on a phishing site! Try it today.
            </span>
          </p>
        </li>
      </ul>

      <ul>
        <li>
          <p>
            <strong>
              Jaxx / imToken
            </strong>
            <span translate="GEN_Help_1">Use your</span>
            <a ng-click="globalService.currentTab=globalService.tabs.sendTransaction.id" translate="x_Mnemonic">
              Mnemonic Phrase
            </a>
            <span translate="GEN_Help_2">
              to access your account.
            </span>
        </p>
        </li>
      </ul>

      <ul>
        <li>
          <p>
            <strong>
              Mist / Geth / Parity:
            </strong>
            <span translate="GEN_Help_1">
              Use your
            </span>
            <a ng-click="globalService.currentTab=globalService.tabs.sendTransaction.id" translate="x_Keystore2">
              Keystore File (UTC / JSON)
            </a>
            <span translate="GEN_Help_2">
              to access your account.
            </span>
          </p>
        </li>
      </ul> -->

    <!-- </section> -->

  </article>


  <article role="main" class="block__wrap gen__2" ng-show="wallet && !showPaperWallet" style="margin-bottom: 200px;"> <!-- -->
    <div class="col-sm-6"  style="padding-top: 20px;padding-left:0px;">
    <section class=" block__main gen__2--inner" >
       <style>
            
            p{
               font-size: 40px;
               text-align: left;
               margin-bottom: 0px;
            }
            h1{
              
              text-align: left;
              margin-bottom:20px;
              margin-top: 0px;
            }
            
          @media only screen and (min-width: 900px) {  
            
            p{
               font-size: 70px;
               text-align: left;
               margin-bottom: 0px;
            }
            h1{
             
              text-align: left;
              margin-bottom:0px;
              margin-top: 0px;
            }
            
          }
        </style>
     
      <p translate="NAV_GenerateWallet" aria-live="polite" ></p> 
      
      <h1 translate="GEN_Label_2" style="font-size:25px;">
        <!-- Save your Keystore File (UTC / JSON) -->
      </h1>

      <a tabindex="0" role="button"
         class=" btn btn-primary site-btn sb-gradients hero-subscribe-from"
         href="{{blobEnc}}"
         download="{{encFileName}}"
         aria-label="{{'x_Download'|translate}} {{'x_Keystore'|translate}}"
         aria-describedby="x_KeystoreDesc"
         ng-click="downloaded()"
         rel="noopener noreferrer" style="float: left;width: 100%;">
        <span translate="x_Download">
          DOWNLOAD
        </span>
        <span translate="x_Keystore2">
          Keystore File (UTC / JSON)
        </span>
      </a>
    </br>

      <div class="warn" style="text-align:left;font-size:20px;">
        <p class="GEN_Warning_1" style="text-align:left;font-size:15px;">
          **Do not lose it!** It cannot be recovered if you lose it.
        </p>
        <p class="GEN_Warning_2" style="text-align:left;font-size:15px;">
          **Do not share it!** Your funds will be stolen if you use this file on a malicious/phishing site.
        </p>
        <p class="GEN_Warning_3" style="text-align:left;font-size:15px;">
          **Make a backup!** Secure it like the millions of dollars it may one day be worth.
        </p>
      </div>

      
      <p>
        <a tabindex="0"
           role="button"
           class="btn btn-danger"
           ng-class="fileDownloaded ? '' : 'disabled' "
           ng-click="continueToPaper()" style="border-radius:40px;width:100%;">
            <span translate="GET_ConfButton" >
              I understand. Continue.
            </span>
        </a>
      </p>

    </section>

    <!-- <section class="block__help">
      <h2 translate="GEN_Help_8">
        Not Downloading a File?
      </h2>
      <ul>
        <li translate="GEN_Help_9">
          Try using Google Chrome
        </li>
        <li translate="GEN_Help_10">
          Right click &amp; save file as. Filename:
        </li>
        <input value="{{encFileName}}" class="form-control input-sm" />
      </ul>

      <h2 translate="GEN_Help_11">
        Don't open this file on your computer
      </h2>
      <ul>
        <li translate="GEN_Help_12">
          Use it to unlock your wallet via MyEtherWallet (or Mist, Geth, Parity &amp; other wallet clients.)
        </li>
      </ul>

      <h2 translate="GEN_Help_4">Guides &amp; FAQ</h2>
      <ul>
        <li>
          <a href="https://myetherwallet.github.io/knowledge-base/getting-started/backing-up-your-new-wallet.html" target="_blank" rel="noopener noreferrer">
            <strong translate="GEN_Help_13">
              How to Back Up Your Keystore File
            </strong>
          </a>
        </li>
        <li>
          <a href="https://myetherwallet.github.io/knowledge-base/private-keys-passwords/difference-beween-private-key-and-keystore-file.html" target="_blank" rel="noopener noreferrer">
            <strong translate="GEN_Help_14">
              What are these Different Formats?
            </strong>
          </a>
        </li>
      </ul>

    </section> -->
  </div>
  </article>


  <article role="main" class="block__wrap gen__3" ng-show="showPaperWallet" style="margin-bottom: 200px;">
    <div class="col-sm-6"  style="padding-top: 20px;padding-left:0px;">
    <section class="block__main gen__3--inner">

      <style>
            
            p{
              font-size: 40px;
              text-align:left;
            }
            h1{
              
              text-align:left;
              margin: 0px;
              height:25px;
            }
            text{
              width: 100%;margin: auto;margin-left: 0px;border-radius: 40px;border: 1px solid #16D0C5;margin-bottom: 20px;border-radius: 40px;
            }
          @media only screen and (min-width: 900px) {  
            
            p{
             font-size: 70px;
             text-align:left;
            }
            h1{
              
              text-align:left;
              margin: 0px;
              height:50px;
            }
            text{
              width: 100%;margin: auto;margin-left: 0px;border-radius: 40px;border: 1px solid #16D0C5;margin-bottom: 20px;border-radius: 40px;
            }
          }
        </style>

      
      <p translate="NAV_GenerateWallet" aria-live="polite" ></p> 
      
      <h1 translate="GEN_Label_5" style="font-size: 25px;"> <!-- Save your Private Key --></h1>
      <textarea aria-label="{{'x_PrivKey'|translate}}"
             aria-describedby="{{'x_PrivKeyDesc'|translate}}"
             class="form-control"
             readonly="readonly"
             rows="2"
             style="width: 100%;margin: auto;margin-left: 0px;border-radius: 45px;border: 1px solid #16D0C5;margin-bottom: 20px;border-radius: 40px;">{{wallet.getPrivateKeyString()}}</textarea>
     

      <a tabindex="0"
         aria-label="{{'x_Print'|translate}}"
         aria-describedby="x_PrintDesc"
         role="button"
         class="btn btn-primary site-btn sb-gradients hero-subscribe-from"
         ng-click="printQRCode()"
         translate="x_Print" style="margin-bottom:20px;">
          PRINT
      </a>

      <div class="warn" style="text-align:left;font-size:15px;">
        <p style="text-align:left;font-size:15px;">
          **Do not lose it!** It cannot be recovered if you lose it.
        </p>
        <p style="text-align:left;font-size:15px;">
          **Do not share it!** Your funds will be stolen if you use this file on a malicious/phishing site.
        </p>
        <p style="text-align:left;font-size:15px;">
          **Make a backup!** Secure it like the millions of dollars it may one day be worth.
        </p>
      </div>

      <a class="btn btn-default btn-sm" ng-click="getAddress()" style="border-radius: 40px;">
        <span translate="GEN_Label_3"> Save your Address </span> →
      </a>

    </section>

    <!-- <section class="block__help">
      <h2 translate="GEN_Help_4">
        Guides &amp; FAQ
      </h2>
      <ul>
        <li><a href="https://myetherwallet.github.io/knowledge-base/getting-started/backing-up-your-new-wallet.html" target="_blank" rel="noopener noreferrer">
          <strong translate="HELP_2a_Title">
            How to Save & Backup Your Wallet.
          </strong>
        </a></li>
        <li><a href="https://myetherwallet.github.io/knowledge-base/getting-started/protecting-yourself-and-your-funds.html" target="_blank" rel="noopener noreferrer">
          <strong translate="GEN_Help_15">Preventing loss &amp; theft of your funds.</strong>
        </a></li>
        <li><a href="https://myetherwallet.github.io/knowledge-base/private-keys-passwords/difference-beween-private-key-and-keystore-file.html" target="_blank" rel="noopener noreferrer">
          <strong translate="GEN_Help_16">What are these Different Formats?</strong>
        </a></li>
      </ul>

      <h2 translate="GEN_Help_17">
        Why Should I?
      </h2>
      <ul>
        <li translate="GEN_Help_18">
          To have a secondary backup.
        </li>
        <li translate="GEN_Help_19">
          In case you ever forget your password.
        </li>
        <li>
          <a href="https://myetherwallet.github.io/knowledge-base/offline/ethereum-cold-storage-with-myetherwallet.html" target="_blank" rel="noopener noreferrer" translate="GEN_Help_20">Cold Storage</a>
        </li>
      </ul>

      <h2 translate="x_PrintDesc"></h2>

    </section> -->
  </div>
  </article>

  <article class="text-left" ng-show="showGetAddress" style="margin-bottom: 200px;">
    <!-- <div class=" col-sm-8 clearfix collapse-container" style="padding-top: 50px;">-->
    <div class=" clearfix collapse-container" style="padding-top: 50px;margin-left:10px;">

      <!-- <div  ng-click="wd = !wd"> -->
      <div  >
        <style>
            
            p{
              font-size: 40px;
              text-align:left;
            }
            h1{
              
              text-align:left;
              margin: 0px;
              height:25px;
            }
            
          @media only screen and (min-width: 900px) {  
            
            p{
             font-size: 70px;
             text-align:left;
            }
            h1{
             
              text-align:left;
              margin: 0px;
              height:50px;
            }
            
          }
        </style>
         <p translate="NAV_GenerateWallet" aria-live="polite" ></p>
       <!--  <a class="collapse-button"><span ng-show="wd">+</span><span ng-show="!wd">-</span></a> -->
        <h1  traslate="GEN_Unlock" style="font-size: 20px;">Unlock your wallet to see <span style="color:#16D0C5;">your address</span></h1>
        <p translate="x_AddessDesc" style="text-align: justify;display:none;"></p>
      </div>

      <div ng-show="!wd" >
          @@if (site === 'mew' ) {  <wallet-decrypt-drtv></wallet-decrypt-drtv>         }
          @@if (site === 'cx' )  {  <cx-wallet-decrypt-drtv></cx-wallet-decrypt-drtv>   }
      </div>
    </div>

    <!-- <div class="row" ng-show="wallet!=null" ng-controller='viewWalletCtrl'>
      @@if (site === 'cx' ) {  @@include( './viewWalletInfo-content.tpl', { "site": "cx" } )    }
      @@if (site === 'mew') {  @@include( './viewWalletInfo-content.tpl', { "site": "mew" } )   }
    </div> -->

  </article>
</main>
