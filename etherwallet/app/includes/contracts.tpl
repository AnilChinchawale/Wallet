<main class="tab-pane SendToken active" ng-if="globalService.currentTab==globalService.tabs.SendToken.id" ng-controller='contractsCtrl' ng-cloak ng-init="initContract()">

  <!-- Title -->
  <div class=" block text-center" >
    <h1>
      <a 
         ng-class="{'isActive': visibility=='interactView'}"
         ng-click="setVisibility('interactView')">
          Send Token
      </a>
      <!--or
      <a translate="NAV_DeployContract"
         ng-class="{'isActive': visibility=='deployView'}"
         ng-click="setVisibility('deployView')">
          Deploy Contract
      </a>-->
    </h1>
  </div>
<<<<<<< HEAD
  <!-- Title -->

  <!-- Interact Contracts -->
  <!--<article class="row block" ng-show="visibility=='interactView'">

    @@if (site === 'mew' ) { @@include( '../includes/contracts-interact-1.tpl', { "site": "mew" } ) }
    @@if (site === 'cx'  ) { @@include( '../includes/contracts-interact-1.tpl', { "site": "cx"  } ) }

  </article>-->
=======
 
>>>>>>> beta2.0

  

  <article ng-show="visibility=='interactView'" id="particles-js">

    @@if (site === 'mew' ) { @@include( '../includes/contracts-interact-modal.tpl', { "site": "mew" } ) }
    @@if (site === 'cx'  ) { @@include( '../includes/contracts-interact-modal.tpl', { "site": "cx"  } ) }

  </article>



<<<<<<< HEAD


  <!-- Deploy Contract -->
=======
>>>>>>> beta2.0
  <article class="row block" ng-show="visibility=='deployView'">

    @@if (site === 'mew' ) { @@include( '../includes/contracts-deploy-1.tpl', { "site": "mew" } ) }
    @@if (site === 'cx'  ) { @@include( '../includes/contracts-deploy-1.tpl', { "site": "cx"  } ) }

  </article>

  <article class="form-group"
           ng-show="(!wd && visibility=='deployView') || (!wd && visibility=='interactView' && contract.selectedFunc && !contract.functions[contract.selectedFunc.index].constant)">
      <article class="block decrypt-drtv clearfix">

  <!-- Column 1 - Select Type of Key -->
  <section class="col-md-4 col-sm-6">

    <h4 translate="decrypt_Access">
      How would you like to access your wallet?
    </h4>

    <!-- View Balance Only -->
    <label aria-flowto="aria1"
           class="radio"
           ng-show="globalService.currentTab==globalService.tabs.sendTransaction.id || globalService.currentTab==globalService.tabs.viewWalletInfo.id">
      <input aria-flowto="aria1"
             aria-label="address"
             type="radio"
             ng-model="walletType"
             value="addressOnly" />
        View w/ Address Only
    </label>

    <!-- MetaMask -->
    <label aria-flowto="aria2"
           class="radio">
      <input aria-flowto="aria2"
             type="radio"
             aria-label="MetaMask / Mist"
             ng-model="walletType"
             value="metamask" />
      <span translate="x_MetaMask">
        MetaMask / Mist
      </span>
    </label>

    <!-- Ledger -->
    <label aria-flowto="aria3"
           class="radio"
           ng-show="ajaxReq.type=='ETH'||ajaxReq.type=='ETC'||ajaxReq.type=='ROPSTEN ETH'||ajaxReq.type=='RINKEBY ETH'||ajaxReq.type=='KOVAN ETH'||ajaxReq.type=='EXP'||ajaxReq.type=='UBQ'||ajaxReq.type=='POA'||ajaxReq.type=='TOMO'">
      <input aria-flowto="aria3"
             type="radio"
             aria-label="Ledger Hardware Wallet"
             ng-model="walletType"
             value="ledger"/>
      Ledger Wallet
    </label>

    <!-- TREZOR -->
    <label class="radio"
           aria-flowto="aria4"
           ng-show="ajaxReq.type=='ETH'||ajaxReq.type=='ETC'||ajaxReq.type=='ROPSTEN ETH'||ajaxReq.type=='RINKEBY ETH'||ajaxReq.type=='KOVAN ETH'||ajaxReq.type=='EXP'||ajaxReq.type=='UBQ'||ajaxReq.type=='RSK'||ajaxReq.type=='POA'||ajaxReq.type=='TOMO'||ajaxReq.type=='ELLA'||ajaxReq.type=='EGEM'||ajaxReq.type=='CLO'||ajaxReq.type=='ETSC'||ajaxReq.type=='MUSIC'||ajaxReq.type=='YAP'||ajaxReq.type=='GO'||ajaxReq.type=='EOSC'">
      <input aria-flowto="aria4"
             type="radio"
             aria-label="Trezor Hardware Wallet"
             ng-model="walletType"
             value="trezor" />
      TREZOR
    </label>

    <!-- Digital Bitbox -->
    <label aria-flowto="aria5"
           class="radio"
           ng-show="ajaxReq.type=='ETH'||ajaxReq.type=='ETC'||ajaxReq.type=='ROPSTEN ETH'||ajaxReq.type=='RINKEBY ETH'||ajaxReq.type=='KOVAN ETH'||ajaxReq.type=='EXP'">
      <input aria-flowto="aria5"
             type="radio"
             aria-label="Digital Bitbox hardware wallet"
             ng-model="walletType"
             value="digitalBitbox"/>
      Digital Bitbox
    </label>

    <!-- Secalot -->
    <label aria-flowto="aria5"
           class="radio"
           ng-show="ajaxReq.type=='ETH'||ajaxReq.type=='ETC'||ajaxReq.type=='ROPSTEN ETH'||ajaxReq.type=='RINKEBY ETH'||ajaxReq.type=='KOVAN ETH'||ajaxReq.type=='EXP'">
      <input aria-flowto="aria5"
             type="radio"
             aria-label="Secalot hardware wallet"
             ng-model="walletType"
             value="secalot"/>
      Secalot
    </label>

    <!-- Keystore / JSON File -->
    <label aria-flowto="aria6"
           class="radio">
      <input aria-flowto="aria6"
             aria-label="Keystore JSON file"
             type="radio"
             ng-model="walletType"
             value="fileupload" />
      Keystore / JSON File
      <a href="https://myetherwallet.github.io/knowledge-base/private-keys-passwords/difference-beween-private-key-and-keystore-file.html"
         target="_blank"
         rel="noopener noreferrer">
        <img src="images/icon-help-3.svg" width="16px" height="16px" style="margin: 0 5px 5px">
      </a>
    </label>

    <!-- Mnemonic Phrase -->
    <label aria-flowto="aria7"
           class="radio">
      <input aria-flowto="aria7"
             aria-label="mnemonic phrase"
             type="radio"
             ng-model="walletType"
             value="pastemnemonic" />
      <span translate="x_Mnemonic">
        Mnemonic Phrase
      </span>
      <a href="https://myetherwallet.github.io/knowledge-base/private-keys-passwords/difference-beween-private-key-and-keystore-file.html"
         target="_blank"
         rel="noopener noreferrer">
        <img src="images/icon-help-3.svg" width="16px" height="16px" style="margin: 0 5px 5px">
      </a>
    </label>

    <!-- Private -->
    <label aria-flowto="aria8"
           class="radio">
      <input aria-flowto="aria8"
             aria-label="private key"
             type="radio"
             ng-model="walletType"
             value="pasteprivkey" />
      <span translate="x_PrivKey2">
        Private Key
      </span>
      <a href="https://myetherwallet.github.io/knowledge-base/private-keys-passwords/difference-beween-private-key-and-keystore-file.html"
         target="_blank"
         rel="noopener noreferrer">
        <img src="images/icon-help-3.svg" width="16px" height="16px" style="margin: 0 5px 5px">
      </a>
    </label>

    <!-- Parity -->
    <label aria-flowto="aria9"
           class="radio"
           style="display: none;"
           id="showMeTheMoney">
      <input aria-flowto="aria9"
             aria-label="parity phrase"
             type="radio"
             ng-model="walletType"
             value="parityBWallet" />
      <span translate="x_ParityPhrase">
        Parity Phrase
      </span>
    </label>

    <label class="radio">
      &nbsp;
      <span translate="x_ParityPhrase">
        Parity Phrase
      </span>
      <a href="https://myetherwallet.github.io/knowledge-base/private-keys-passwords/parity-phrases-are-no-longer-supported.html"
         target="_blank"
         rel="noopener noreferrer">
           <img src="images/icon-help-2.svg" width="16px" height="16px" style="margin: 0 5px 5px">
      </a>
    </label>
  </section>
  <!-- / Column 1 - Select Type of Key -->


  <!-- Column 2 - Unlock That Key -->
  <section class="col-md-8 col-sm-6">

    <!-- View Only -->
    <div id="selectedTypeKey" ng-if="walletType=='addressOnly'">
      <h4 translate="x_Address">
        Your Address
      </h4>
      <h5>
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 79.536 79.536"><path fill="#5dba5a" d="M39.769 0C17.8 0 0 17.8 0 39.768c0 21.965 17.8 39.768 39.769 39.768 21.965 0 39.768-17.803 39.768-39.768C79.536 17.8 61.733 0 39.769 0zm-5.627 58.513L15.397 39.768l7.498-7.498 11.247 11.247 22.497-22.493 7.498 7.498-29.995 29.991z"/></svg>
        This is a recommended way to view your balance.
      </h5>
      <p>
          You can only view your balance via this option.
          Please use another option in order to send.
      </p>
      <div class="form-group">
        <textarea rows="4"
                  id="aria8"
                  class="form-control"
                  ng-change="onAddressChange()"
                  ng-class="Validator.isValidAddress($parent.$parent.addressOnly) ? 'is-valid' : 'is-invalid'"
                  ng-model="$parent.$parent.addressOnly"
                  placeholder="{{ 'x_Address' | translate }}"
        ></textarea>
      </div>
      <div class="form-group">
        <a class="btn btn-primary"
           ng-click="decryptAddressOnly()"
           ng-show="showAOnly"
           role="button"
           tabindex="0">
             View Balance
        </a>
      </div>
    </div>
    <!-- /View Only -->


    <!--  MetaMask -->
    <div id="selectedTypeMetamask"
         ng-if="walletType=='metamask'">
      <h4 translate="x_MetaMask">
        MetaMask / Mist
      </h4>
      <h5>
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 79.536 79.536"><path fill="#5dba5a" d="M39.769 0C17.8 0 0 17.8 0 39.768c0 21.965 17.8 39.768 39.769 39.768 21.965 0 39.768-17.803 39.768-39.768C79.536 17.8 61.733 0 39.769 0zm-5.627 58.513L15.397 39.768l7.498-7.498 11.247 11.247 22.497-22.493 7.498 7.498-29.995 29.991z"/></svg>
        This is a recommended way to access your wallet.
      </h5>
      <div class="form-group">
        MetaMask is a browser extension that allows you to access your wallet quickly, safely &amp; easily. It is more secure because you <u>never enter your private key on a website</u>. It protects you from phishing &amp; malicious websites.
      </div>
      <ul>
        <li class="u__protip">
          <a tabindex="0"
             href="https://myetherwallet.github.io/knowledge-base/migration/moving-from-private-key-to-metamask.html"
             target="_blank"
             rel="noopener noreferrer">
                How to Move to MetaMask
          </a>
        </li>
        <li class="u__download">
          <a tabindex="0"
             href="https://chrome.google.com/webstore/detail/metamask/nkbihfbeogaeaoehlefnkodbefgpgknn?hl=en"
             target="_blank"
             rel="noopener noreferrer">
                Download MetaMask for Chrome
          </a>
        </li>
        <li class="u__download">
          <a tabindex="0"
             href="https://metamask.io/"
             target="_blank"
             rel="noopener noreferrer">
                Download MetaMask for Other Browsers
          </a>
        </li>
      </ul>
      <div class="form-group"
           ng-hide="isSSL">
        <span class="text-danger"
              translate="ADD_Ledger_0a" >
            Please use MyEtherWallet on a secure (SSL / HTTPS) connection to connect.
        </span>
      </div>
      <div class="form-group">
        <a id="aria3"
           class="btn btn-primary"
           ng-click="scanMetamask()"
           ng-show="walletType=='metamask'"
           tabindex="0" role="button"
           translate="ADD_MetaMask">
             Connect to MetaMask
        </a>
      </div>
    </div>
    <!-- / MetaMask -->


    <!--  Ledger-->
    <div id="selectedTypeLedger" ng-if="walletType=='ledger'">
      <h4>
        Ledger Hardware Wallet
      </h4>
      <h5>
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 79.536 79.536"><path fill="#5dba5a" d="M39.769 0C17.8 0 0 17.8 0 39.768c0 21.965 17.8 39.768 39.769 39.768 21.965 0 39.768-17.803 39.768-39.768C79.536 17.8 61.733 0 39.769 0zm-5.627 58.513L15.397 39.768l7.498-7.498 11.247 11.247 22.497-22.493 7.498 7.498-29.995 29.991z"/></svg>
        This is a recommended way to access your wallet.
      </h5>
      <div class="form-group">
        A hardware wallet is a small USB device that allows you to access your wallet quickly, safely &amp; easily. It is more secure because your private key <u>never leaves the hardware wallet</u>. It protects you from phishing, malware, and more.
      </div>
      <ul>
        <li class="u__protip">
          <a href="https://ledger.zendesk.com/hc/en-us/articles/115005200009-How-to-use-MyEtherWallet-with-Ledger"
             target="_blank"
             rel="noopener noreferrer">
          How to use MyEtherWallet with your Ledger Hardware Wallet
          </a>
        </li>
        <li class="u__protip">
          <a href="https://www.ledgerwallet.com/r/fa4b?path=/products/"
             target="_blank"
             rel="noopener noreferrer">
                Don't have a Ledger? Get one today.
          </a>
        </li>
      </ul>
      <div class="form-group">
        <a class="btn btn-primary"
           ng-click="scanLedger()"
           ng-show="walletType=='ledger'"
           role="button"
           tabindex="0"
           translate="ADD_Ledger_scan">
            SCAN
        </a>
      </div>
      <div role="alert" ng-show="ledgerError">
        <p class="strong text-danger">
          {{ledgerErrorString}}
        </p>
        <ul>
          <li ng-hide="isSSL"
              translate="ADD_Ledger_0a" >
                Please use MyEtherWallet on a secure (SSL / HTTPS) connection to connect.
          </li>
          <li>
            <span translate="ADD_Ledger_2" ng-if="ajaxReq.type=='ETH'||ajaxReq.type=='ETC'||ajaxReq.type=='ROPSTEN ETH'||ajaxReq.type=='RINKEBY ETH'||ajaxReq.type=='KOVAN ETH'">
              Open the Ethereum application (or a contract application)
            </span>
            <span translate="ADD_Ledger_2_Exp" ng-if="ajaxReq.type=='EXP'">
              Open the Expanse application (or a contract application)
            </span>
            <span translate="ADD_Ledger_2_Ubq" ng-if="ajaxReq.type=='UBQ'">
              Open the Ubiq application (or a contract application)
            </span>
          </li>
          <li>
            <a href="https://myetherwallet.github.io/knowledge-base/hardware-wallets/ledger-hardware-wallet-unable-to-connect-on-myetherwallet.html"
             target="_blank"
             rel="noopener noreferrer">
                Still not working? More Troubleshooting Tips
            </a>
          </li>
        </ul>
      </div>
    </div>
    <!-- / Ledger-->


    <!--  TREZOR-->
    <div id="selectedTypeTrezor" ng-if="walletType=='trezor'">
      <h4>
        TREZOR Hardware Wallet
      </h4>
      <h5>
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 79.536 79.536"><path fill="#5dba5a" d="M39.769 0C17.8 0 0 17.8 0 39.768c0 21.965 17.8 39.768 39.769 39.768 21.965 0 39.768-17.803 39.768-39.768C79.536 17.8 61.733 0 39.769 0zm-5.627 58.513L15.397 39.768l7.498-7.498 11.247 11.247 22.497-22.493 7.498 7.498-29.995 29.991z"/></svg>
        This is a recommended way to access your wallet.
      </h5>
      <div class="form-group">
        A hardware wallet is a small USB device that allows you to access your wallet quickly, safely &amp; easily. It is more secure because your private key <u>never leaves the hardware wallet</u>. It protects you from phishing, malware, and more.
      </div>
      <ul>
        <li class="u__protip">
          <a href="https://blog.trezor.io/trezor-integration-with-myetherwallet-3e217a652e08#.n5fddxmdg"
             target="_blank"
             rel="noopener noreferrer">
               How to use TREZOR with MyEtherWallet
          </a>
        </li>
        <li class="u__protip">
          <a href="https://trezor.io/?a=myetherwallet.com"
             target="_blank"
             rel="noopener noreferrer">
                Don't have a TREZOR? Get one now.
          </a>
        </li>
      </ul>
      <div class="form-group">
        <a id="aria7"
           class="btn btn-primary"
           ng-click="scanTrezor()"
           ng-show="walletType=='trezor'"
           tabindex="0" role="button"
           translate="ADD_Trezor_scan">
            Connect to TREZOR
        </a>
      </div>
      <div role="alert" ng-show="trezorError">
        <p class="strong text-danger">
          {{trezorErrorString}}
        </p>
        <ul>
          <li ng-hide="isSSL"
              translate="ADD_Ledger_0a" >
                Please use MyEtherWallet on a secure (SSL / HTTPS) connection to connect.
          </li>
          <li>
                Ensure you are not blocking pop-ups on this site.
          </li>
          <li>
            <a href="https://myetherwallet.github.io/knowledge-base/hardware-wallets/"
             target="_blank"
             rel="noopener noreferrer">
                Still not working? More Troubleshooting Tips
            </a>
          </li>
        </ul>
      </div>
    </div>
    <!-- / TREZOR-->


    <!--  Digital Bitbox-->
    <div id="selectedTypeDigitalBitbox" ng-if="walletType=='digitalBitbox'">
      <h4>
        Digital Bitbox Hardware Wallet
      </h4>
      <h5>
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 79.536 79.536"><path fill="#5dba5a" d="M39.769 0C17.8 0 0 17.8 0 39.768c0 21.965 17.8 39.768 39.769 39.768 21.965 0 39.768-17.803 39.768-39.768C79.536 17.8 61.733 0 39.769 0zm-5.627 58.513L15.397 39.768l7.498-7.498 11.247 11.247 22.497-22.493 7.498 7.498-29.995 29.991z"/></svg>
        This is a recommended way to access your wallet.
      </h5>
      <div class="form-group">
        A hardware wallet is a small USB device that allows you to access your wallet quickly, safely &amp; easily. It is more secure because your private key <u>never leaves the hardware wallet</u>. It protects you from phishing, malware, and more.
      </div>
      <ul>
        <li class="u__protip">
          <a href="https://digitalbitbox.com/ethereum"
             target="_blank"
             rel="noopener noreferrer">
               How to use Digital Bitbox with MyEtherWallet
          </a>
        </li>
        <li class="u__protip">
          <a href="https://digitalbitbox.com/?ref=mew"
             target="_blank"
             rel="noopener noreferrer">
                Don't have a Digital Bitbox? Get one now.
          </a>
        </li>
      </ul>
      <input class="form-control"
             aria-label="Enter the Digital Bitbox password"
             aria-describedby="selectedTypeDigitalBitbox"
             type="password"
             placeholder="Digital Bitbox password"
             spellcheck="false"
             value=""
             ng-model="HDWallet.digitalBitboxSecret" />
      <div class="form-group">
        <a tabindex="0" role="button" class="btn btn-primary" ng-click="scanDigitalBitbox()" translate="ADD_DigitalBitbox_scan">
          Connect your Digital Bitbox
        </a>
      </div>
    </div>
    <!-- / Digital Bitbox-->


    <!--  Secalot-->
    <div id="selectedTypeSecalot" ng-if="walletType=='secalot'">
      <h4>
        Secalot Hardware Wallet
      </h4>
      <h5>
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 79.536 79.536"><path fill="#5dba5a" d="M39.769 0C17.8 0 0 17.8 0 39.768c0 21.965 17.8 39.768 39.769 39.768 21.965 0 39.768-17.803 39.768-39.768C79.536 17.8 61.733 0 39.769 0zm-5.627 58.513L15.397 39.768l7.498-7.498 11.247 11.247 22.497-22.493 7.498 7.498-29.995 29.991z"/></svg>
        This is a recommended way to access your wallet.
      </h5>
      <div class="form-group">
        A hardware wallet is a small USB device that allows you to access your wallet quickly, safely &amp; easily. It is more secure because your private key <u>never leaves the hardware wallet</u>. It protects you from phishing, malware, and more.
      </div>
      <ul>
        <li class="u__protip">
          <a href="https://www.secalot.com/documentation/ethereum-wallet/"
             target="_blank"
             rel="noopener noreferrer">
               How to use Secalot with MyEtherWallet
          </a>
        </li>
        <li class="u__protip">
          <a href="https://secalot.com/?ref=mew"
             target="_blank"
             rel="noopener noreferrer">
                Don't have a Secalot? Get one now.
          </a>
        </li>
      </ul>
      <input class="form-control"
             aria-label="Enter your Secalot Ethereum wallet PIN-code"
             aria-describedby="selectedTypeSecalot"
             type="password"
             placeholder="Secalot Ethereum wallet PIN-code"
             spellcheck="false"
             value=""
             ng-model="HDWallet.secalotSecret" />
      <div class="form-group">
        <a tabindex="0" role="button" class="btn btn-primary" ng-click="scanSecalot()" translate="ADD_Secalot_scan">
          Connect your Secalot
        </a>
      </div>
    </div>
    <!-- / Secalot-->


    <!-- Keystore -->
    <div ng-if="walletType=='fileupload'">
      <h4 translate="ADD_Radio_2_alt">Select your wallet file</h4>
      <h5>
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512"><path fill="#d9534f" d="M256 0C114.844 0 0 114.844 0 256s114.844 256 256 256 256-114.844 256-256S397.156 0 256 0zm102.625 313.375c12.5 12.492 12.5 32.758 0 45.25C352.383 364.875 344.188 368 336 368s-16.383-3.125-22.625-9.375L256 301.25l-57.375 57.375C192.383 364.875 184.188 368 176 368s-16.383-3.125-22.625-9.375c-12.5-12.492-12.5-32.758 0-45.25L210.75 256l-57.375-57.375c-12.5-12.492-12.5-32.758 0-45.25 12.484-12.5 32.766-12.5 45.25 0L256 210.75l57.375-57.375c12.484-12.5 32.766-12.5 45.25 0 12.5 12.492 12.5 32.758 0 45.25L301.25 256l57.375 57.375z"/></svg>
        This is <u>not</u> a recommended way to access your wallet.
      </h5>
      <div class="form-group">
        Entering your private key on a website dangerous. If our website is compromised or you accidentally visit a different website, your funds will be stolen. Please consider:
      </div>
      <ul>
        <li>
          <a href="https://myetherwallet.github.io/knowledge-base/migration/moving-from-private-key-to-metamask.html"
             target="_blank"
             rel="noopener noreferrer">
              MetaMask
          </a>
          or
          <a href="https://myetherwallet.github.io/knowledge-base/hardware-wallets/hardware-wallet-recommendations.html"
             target="_blank"
             rel="noopener noreferrer">
              A Hardware Wallet
          </a>
          or
          <a href="https://myetherwallet.github.io/knowledge-base/offline/running-myetherwallet-locally.html"
             target="_blank"
             rel="noopener noreferrer">
              Running MEW Offline &amp; Locally
          </a>
        </li>
        <li>
          <a href="https://myetherwallet.github.io/knowledge-base/security/securing-your-ethereum.html"
             target="_blank"
             rel="noopener noreferrer">
              Learning How to Protect Yourself and Your Funds
          </a>
        </li>
      </ul>
      <div class="form-group">
        If you must, please <u>double-check the URL &amp; SSL cert</u>. It should say <code>https://www.myetherwallet.com</code> &amp; <code>MYETHERWALLET INC</code> in your URL bar.
      </div>
      <br />
      <div class="form-group">
        <input style="display:none;" type="file" on-read-file="showContent($fileContent)" id="fselector" />
        <a class="btn-file marg-v-sm"
           ng-click="openFileDialog()"
           translate="ADD_Radio_2_short"
           id="aria1"
           tabindex="0"
           role="button">SELECT WALLET FILE... </a>
      </div>
      <div class="form-group" ng-if="requireFPass">
        <p translate="ADD_Label_3">
          Your file is encrypted. Please enter the password:
        </p>
        <input class="form-control"
               ng-init="onFilePassChange()"
               ng-class="Validator.isPasswordLenValid($parent.$parent.filePassword,0) ? 'is-valid' : 'is-invalid'"
               ng-model="$parent.$parent.filePassword"
               placeholder="{{ 'x_Password' | translate }}"
               type="password" />
      </div>
      <div class="form-group">
        <a tabindex="0"
           role="button"
           class="btn btn-primary"
           ng-show="showFDecrypt||showPDecrypt||showMDecrypt||showParityDecrypt"
           ng-click="decryptWallet()"
           translate="ADD_Label_6_short">
             UNLOCK
         </a>
      </div>
    </div>
    <!-- / Keystore -->


    <!--  Mnemonic -->
    <div id="selectedTypeMnemonic" ng-if="walletType=='pastemnemonic'">
      <h4 translate="ADD_Radio_5"> Paste your mnemonic: </h4>
      <h5>
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512"><path fill="#d9534f" d="M256 0C114.844 0 0 114.844 0 256s114.844 256 256 256 256-114.844 256-256S397.156 0 256 0zm102.625 313.375c12.5 12.492 12.5 32.758 0 45.25C352.383 364.875 344.188 368 336 368s-16.383-3.125-22.625-9.375L256 301.25l-57.375 57.375C192.383 364.875 184.188 368 176 368s-16.383-3.125-22.625-9.375c-12.5-12.492-12.5-32.758 0-45.25L210.75 256l-57.375-57.375c-12.5-12.492-12.5-32.758 0-45.25 12.484-12.5 32.766-12.5 45.25 0L256 210.75l57.375-57.375c12.484-12.5 32.766-12.5 45.25 0 12.5 12.492 12.5 32.758 0 45.25L301.25 256l57.375 57.375z"/></svg>
        This is <u>not</u> a recommended way to access your wallet.
      </h5>
      <div class="form-group">
        Entering your private key on a website dangerous. If our website is compromised or you accidentally visit a different website, your funds will be stolen. Please consider:
      </div>
      <ul>
        <li>
          <a href="https://myetherwallet.github.io/knowledge-base/migration/moving-from-private-key-to-metamask.html"
             target="_blank"
             rel="noopener noreferrer">
              MetaMask
          </a>
          or
          <a href="https://myetherwallet.github.io/knowledge-base/hardware-wallets/hardware-wallet-recommendations.html"
             target="_blank"
             rel="noopener noreferrer">
              A Hardware Wallet
          </a>
          or
          <a href="https://myetherwallet.github.io/knowledge-base/offline/running-myetherwallet-locally.html"
             target="_blank"
             rel="noopener noreferrer">
              Running MEW Offline &amp; Locally
          </a>
        </li>
        <li>
          <a href="https://myetherwallet.github.io/knowledge-base/security/securing-your-ethereum.html"
             target="_blank"
             rel="noopener noreferrer">
              Learning How to Protect Yourself and Your Funds
          </a>
        </li>
      </ul>
      <div class="form-group">
        If you must, please <u>double-check the URL &amp; SSL cert</u>. It should say <code>https://www.myetherwallet.com</code> &amp; <code>MYETHERWALLET INC</code> in your URL bar.
      </div>
      <br />
      <div class="form-group">
        <textarea id="aria4"
                  class="form-control"
                  ng-change="onMnemonicChange()"
                  ng-class="Validator.isValidMnemonic($parent.$parent.manualmnemonic) ? 'is-valid' : 'is-invalid'"
                  ng-keyup="$event.keyCode == 13 && decryptWallet()"
                  ng-model="$parent.$parent.manualmnemonic"
                  placeholder="{{ 'x_Mnemonic' | translate}}"
                  rows="4"></textarea>
      </div>
      <div class="form-group">
        <p translate="ADD_Label_8">
          Password (optional):
        </p>
        <div>
          <input class="form-control"
                 id="aria5"
                 ng-keyup="$event.keyCode == 13 && decryptWallet()"
                 ng-model="$parent.$parent.mnemonicPassword"
                 placeholder="{{ 'x_Password' | translate }}"
                 type="password" />
        </div>
      </div>
      <div class="form-group">
        <a tabindex="0"
           role="button"
           class="btn btn-primary"
           ng-show="showFDecrypt||showPDecrypt||showMDecrypt||showParityDecrypt"
           ng-click="decryptWallet()"
           translate="ADD_Label_6_short">
             UNLOCK
         </a>
      </div>
    </div>
    <!-- / Mnemonic -->


    <!--  Private Key -->
    <div id="selectedTypeKey" ng-if="walletType=='pasteprivkey'">
      <h4 translate="ADD_Radio_3">
        Paste your private key:
      </h4>
      <h5>
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512"><path fill="#d9534f" d="M256 0C114.844 0 0 114.844 0 256s114.844 256 256 256 256-114.844 256-256S397.156 0 256 0zm102.625 313.375c12.5 12.492 12.5 32.758 0 45.25C352.383 364.875 344.188 368 336 368s-16.383-3.125-22.625-9.375L256 301.25l-57.375 57.375C192.383 364.875 184.188 368 176 368s-16.383-3.125-22.625-9.375c-12.5-12.492-12.5-32.758 0-45.25L210.75 256l-57.375-57.375c-12.5-12.492-12.5-32.758 0-45.25 12.484-12.5 32.766-12.5 45.25 0L256 210.75l57.375-57.375c12.484-12.5 32.766-12.5 45.25 0 12.5 12.492 12.5 32.758 0 45.25L301.25 256l57.375 57.375z"/></svg>
        This is <u>not</u> a recommended way to access your wallet.
      </h5>
      <div class="form-group">
        Entering your private key on a website is dangerous. If our website is compromised or you accidentally visit a different website, your funds will be stolen. Please consider:
      </div>
      <ul>
        <li>
          <a href="https://myetherwallet.github.io/knowledge-base/migration/moving-from-private-key-to-metamask.html"
             target="_blank"
             rel="noopener noreferrer">
              MetaMask
          </a>
          or
          <a href="https://myetherwallet.github.io/knowledge-base/hardware-wallets/hardware-wallet-recommendations.html"
             target="_blank"
             rel="noopener noreferrer">
              A Hardware Wallet
          </a>
          or
          <a href="https://myetherwallet.github.io/knowledge-base/offline/running-myetherwallet-locally.html"
             target="_blank"
             rel="noopener noreferrer">
              Running MEW Offline &amp; Locally
          </a>
        </li>
        <li>
          <a href="https://myetherwallet.github.io/knowledge-base/security/securing-your-ethereum.html"
             target="_blank"
             rel="noopener noreferrer">
              Learning How to Protect Yourself and Your Funds
          </a>
        </li>
      </ul>
      <div class="form-group">
        If you must, please <u>double-check the URL &amp; SSL cert</u>. It should say <code>https://www.myetherwallet.com</code> &amp; <code>MYETHERWALLET INC</code> in your URL bar.
      </div>
      <br />
      <div class="form-group">
        <textarea id="aria6"
                  class="form-control"
                  ng-change="onPrivKeyChange()"
                  ng-class="Validator.isValidPrivKey($parent.$parent.manualprivkey.length) ? 'is-valid' : 'is-invalid'"
                  ng-keyup="$event.keyCode == 13 && decryptWallet()"
                  ng-model="$parent.$parent.manualprivkey"
                  placeholder="{{ 'x_PrivKey2' | translate }}"
                  rows="4"
        ></textarea>
      </div>
      <div class="form-group" ng-if="requirePPass">
        <p translate="ADD_Label_3">
          Your file is encrypted. Please enter the password:
        </p>
        <input class="form-control"
               ng-change="onPrivKeyPassChange()"
               ng-class="Validator.isPasswordLenValid($parent.$parent.privPassword,0) ? 'is-valid' : 'is-invalid'"
               ng-keyup="$event.keyCode == 13 && decryptWallet()"
               ng-model="$parent.$parent.privPassword"
               placeholder="{{ 'x_Password' | translate }}"
               type="password" />
      </div>
      <div class="form-group">
        <a tabindex="0"
           role="button"
           class="btn btn-primary"
           ng-show="showFDecrypt||showPDecrypt||showMDecrypt||showParityDecrypt"
           ng-click="decryptWallet()"
           translate="ADD_Label_6_short">
             UNLOCK
         </a>
      </div>
    </div>
    <!-- / Private Key -->


    <!-- Parity Phrase -->
    <div id="selectedTypeMnemonic" ng-if="walletType=='parityBWallet'">
      <h4 translate="ADD_Radio_5"> Paste your mnemonic: </h4>
      <div class="form-group">
        <textarea rows="4"
                  id="aria9"
                  class="form-control"
                  ng-change="onParityPhraseChange()"
                  ng-class="$parent.$parent.parityPhrase != '' ? 'is-valid' : 'is-invalid'"
                  ng-keyup="$event.keyCode == 13 && decryptWallet()"
                  ng-model="$parent.$parent.parityPhrase"
                  placeholder="{{ 'x_ParityPhrase' | translate}}"
        ></textarea>
      </div>
      <div class="form-group">
        <a tabindex="0"
           role="button"
           class="btn btn-primary"
           ng-show="showFDecrypt||showPDecrypt||showMDecrypt||showParityDecrypt"
           ng-click="decryptWallet()"
           translate="ADD_Label_6_short">
             UNLOCK
         </a>
      </div>
    </div>
    <!-- / Parity Phrase -->

  </section>
  <!-- / Column 2 - Unlock That Key -->


  <!-- MODAL -->
  <article class="modal fade" id="mnemonicModel" tabindex="-1" role="dialog" aria-labelledby="Mnemonic Phrase Modal" >

    <section class="modal-dialog">

      <section class="modal-content">

        <div class="modal-body" role="document">

          <button aria-label="Close" type="button" class="close" data-dismiss="modal">&times;</button>

          <!-- Select HD Path -->
          <h4 id="modalTitle" class="modal-title" translate="ADD_Radio_5_Path" style="margin-bottom: .25rem">
            Select HD derivation path:
          </h4>

          <p class="alert alert-danger"
             ng-hide="ajaxReq.type=='ETH'||ajaxReq.type=='ETC'||ajaxReq.type=='ROPSTEN ETH'||ajaxReq.type=='RINKEBY ETH'||ajaxReq.type=='KOVAN ETH'||ajaxReq.type=='EXP'||ajaxReq.type=='UBQ'||ajaxReq.type=='ELLA'||ajaxReq.type=='EGEM'||ajaxReq.type=='CLO'||ajaxReq.type=='ETSC'||ajaxReq.type=='MUSIC'||ajaxReq.type=='YAP'||ajaxReq.type=='GO'||ajaxReq.type=='EOSC'">
                We do not know the correct path for this network.
                <a href="https://github.com/kvhnuke/etherwallet/issues"
                   target="_blank"
                   rel="noopener noreferrer">
                      Please open a github issue
                </a>
                so we can discuss / be enlightened.
          </p>

          <section class="row">

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: Jaxx, Metamask, Exodus, imToken - {{HDWallet.defaultDPath}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.defaultDPath}}"/>
                <span ng-bind="HDWallet.defaultDPath"></span>
                <p class="small">
                  Jaxx, Metamask, Exodus, imToken, TREZOR (ETH) &amp; Digital Bitbox
                </p>
              </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: Ledger (ETH) {{HDWallet.ledgerPath}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.ledgerPath}}"/>
                <span ng-bind="HDWallet.ledgerPath"></span>
                <p class="small">
                  Ledger (ETH)
                </p>
              </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: Ledger (ETC) {{HDWallet.ledgerClassicPath}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.ledgerClassicPath}}"/>
                <span ng-bind="HDWallet.ledgerClassicPath"></span>
                <p class="small">
                  Ledger (ETC)
                </p>
              </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: TREZOR (ETC) {{HDWallet.trezorClassicPath}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.trezorClassicPath}}"/>
                <span ng-bind="HDWallet.trezorClassicPath"></span>
                <p class="small">
                  TREZOR (ETC)
                </p>
              </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: SingularDTV {{HDWallet.singularDTVPath}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.singularDTVPath}}"/>
                <span ng-bind="HDWallet.singularDTVPath"></span>
                <p class="small">
                  SingularDTV
                </p>
              </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: TREZOR - TESTNET - {{HDWallet.trezorTestnetPath}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.trezorTestnetPath}}"/>
                <span ng-bind="HDWallet.trezorTestnetPath"></span>
                <p class="small">
                  Network: Testnets
                </p>
              </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: TREZOR (ETC) {{HDWallet.hwExpansePath}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.hwExpansePath}}"/>
                <span ng-bind="HDWallet.hwExpansePath"></span>
                <p class="small">
                  Network: Expanse
                </p>
              </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: TREZOR (ETC) {{HDWallet.hwUbqPath}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.hwUbqPath}}"/>
                <span ng-bind="HDWallet.hwUbqPath"></span>
                <p class="small">
                  Network: Ubiq
                </p>
              </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: TREZOR (ELLA) {{HDWallet.hwEllaismPath}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.hwEllaismPath}}"/>
                <span ng-bind="HDWallet.hwEllaismPath"></span>
                <p class="small">
                  Network: Ellaism
                </p>
              </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: TREZOR (EGEM) {{HDWallet.hwEtherGemPath}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.hwEtherGemPath}}"/>
                <span ng-bind="HDWallet.hwEtherGemPath"></span>
                <p class="small">
                  Network: EtherGem
                </p>
              </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: TREZOR (CLO) {{HDWallet.hwCallistoPath}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.hwCallistoPath}}"/>
                <span ng-bind="HDWallet.hwCallistoPath"></span>
                <p class="small">
                  Network: Callisto
                </p>
              </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: TREZOR (ETSC) {{HDWallet.hwSocialPath}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.hwSocialPath}}"/>
                <span ng-bind="HDWallet.hwSocialPath"></span>
                <p class="small">
                  Network: Ethereum Social
                </p>
              </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: TREZOR (MUSIC) {{HDWallet.hwMusicoinPath}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.hwMusicoinPath}}"/>
                <span ng-bind="HDWallet.hwMusicoinPath"></span>
                <p class="small">
                  Network: Musicoin
                </p>
              </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: TREZOR (YAP) {{HDWallet.hwYapstonePath}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.hwYapstonePath}}"/>
                <span ng-bind="HDWallet.hwYapstonePath"></span>
                <p class="small">
                  Network: Yapstone
                </p>
              </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: TREZOR (GO) {{HDWallet.goPath}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.goPath}}"/>
                <span ng-bind="HDWallet.goPath"></span>
                <p class="small">
                  Network: GoChain
                </p>
              </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                <input aria-describedby="Path: TREZOR (EOSC) {{HDWallet.hwEOSClassicPath}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.hwEOSClassicPath}}"/>
                <span ng-bind="HDWallet.hwEOSClassicPath"></span>
                <p class="small">
                  Network: EOS Classic
                </p>
              </label>
            </div>

            <div class="col-sm-4">
              <label class="radio small">
                <p class="small"><strong>
                  Your Custom Path
                </strong></p>
                <input aria-describedby="Path: Enter your own - {{HDWallet.customDPath}}"
                       ng-change="onHDDPathChange()"
                       ng-model="HDWallet.dPath"
                       type="radio"
                      value="{{HDWallet.customDPath}}" />
                <input aria-describedby="Path: Enter your own - {{HDWallet.customDPath}}"
                      type="text" class="form-control input-sm"
                      ng-model="HDWallet.customDPath"
                      ng-change="onCustomHDDPathChange()"
                      style="float: right;margin: 0 0 .5rem;" />
              </label>
            </div>
          </section>



          <h4 id="modalTitle2" class="modal-title" translate="MNEM_1" style="margin: .5rem 0">
            Please select the address you would like to interact with.
          </h4>

          <table class="small table table-striped table-mnemonic">
            <tr>
              <th translate="x_Address">
                Address
              </th>
              <th translate="MYWAL_Bal">
                Balance
              </th>
              <th translate="sidebar_TokenBal" class="text-center">
                Token<br>Balances
              </th>
            </tr>
            <tr ng-repeat="wallet in HDWallet.wallets track by $index">
              <td>
                <label>
                  <input aria-describedby="modalTitle2"
                         aria-label="Unlock wallet with {{wallet.getBalance()}} {{ajaxReq.type}}. Address: {{wallet.getChecksumAddressString()}}"
                         name="addressSelect"
                         ng-model="HDWallet.id"
                         type="radio"
                         value="{{$index}}" />
                    <span class="small">
                      {{wallet.getChecksumAddressString()}}
                    </span>
                </label>
              </td>

              <td>
                <a href="{{ajaxReq.blockExplorerAddr.replace('[[address]]', wallet.getAddressString())}}"
                   target="_blank"
                   rel="noopener noreferrer">
                  {{wallet.getBalance()}} {{ajaxReq.type}}
                </a>
              </td>

              <td class="text-center">
                <a href="https://ethplorer.io/address/{{wallet.getAddressString()}}"
                   target="_blank"
                   rel="noopener noreferrer" title="https://ethplorer.io/address/{{wallet.getAddressString()}}">
                  <img src="images/icon-external-link.svg" title="https://ethplorer.io/address/{{wallet.getAddressString()}}" ng-click="removeTokenFromLocal(token.symbol)" ng-show="token.type!=='default'" />
                </a>
              </td>

            </tr>

            <tr class="m-addresses">

              <td>
                <a ng-click="AddRemoveHDAddresses(false)"
                   ng-show="HDWallet.numWallets > 5"
                   role="link"
                   tabindex="0"
                   translate="MNEM_prev">
                Previous Addresses
                </a>
              </td>

              <td></td>

              <td>
                <a ng-click="AddRemoveHDAddresses(true)"
                   role="link"
                   tabindex="0"
                   translate="MNEM_more">
                More Addresses
                </a>
              </td>

            </tr>
          </table>

          <div class="clearfix button-group">
            <button aria-label="Unlock this Wallet"
                    class="btn btn-primary pull-right"
                    style="margin: 0 .1rem"
                    ng-click="setHDWallet()"
                    role="button"
                    tabindex="0"
                    translate="ADD_Label_6">
              Access Wallet
            </button>

            <button aria-label="Cancel - Will close dialog"
                    class="btn btn-default pull-right"
                    style="margin: 0 .1rem"
                    data-dismiss="modal"
                    role="button"
                    tabindex="0"
                    translate="x_Cancel">
              Cancel
            </button>
          </div>

        </div>

      </section>

    </section>

  </article>

</article>

  </article>

  <article class="row block" ng-show="visibility=='interactView' && showReadWrite">

    @@if (site === 'mew' ) { @@include( '../includes/contracts-interact-2.tpl', { "site": "mew" } ) }
    @@if (site === 'cx'  ) { @@include( '../includes/contracts-interact-2.tpl', { "site": "cx"  } ) }

  </article>

<<<<<<< HEAD
  <article class="col-xs-12" ng-show="contract.selectedFunc!=null && visibility=='interactView' && btnShowReadWrite">
=======
  <article class="row block" ng-show="visibility=='interactView' && showReadWrite">

    @@if (site === 'mew' ) { @@include( '../includes/contracts-interact-2.tpl', { "site": "mew" } ) }
    @@if (site === 'cx'  ) { @@include( '../includes/contracts-interact-2.tpl', { "site": "cx"  } ) }

  </article>

  <article class="col-xs-12" ng-show="contract.selectedFunc!=null && visibility=='interactView'">
>>>>>>> beta2.0

    <button class="btn btn-primary btn-block"
            ng-click="readFromContract()"
            ng-show="contract.functions[contract.selectedFunc.index].constant && showRead">
      <span translate="CONTRACT_Read"> READ </span>
    </button>

    <button class="btn btn-primary btn-block"
            ng-click="generateContractTx()"
            ng-show="!contract.functions[contract.selectedFunc.index].constant">
      <span > Generate Transaction </span>
    </button>

    </br>
  </article>

</main>
