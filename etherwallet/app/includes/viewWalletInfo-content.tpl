<article class="col-sm-7 view-wallet-content">

  <section class="block" style="margin-top: 0px;
    padding-top: 0px;">

    <div class="col-xs-11">
      <div class="account-help-icon">
        <img src="images/icon-help.svg" class="help-icon" />
        <p class="account-help-text" translate="x_AddessDesc">
          You may know this as your "Account #" or your "Public Key". It's what you send people so they can send you ETH. That icon is an easy way to recognize your address.
        </p>
        <h5 translate="x_Address">
          Your Address:
        </h5>
      </div>
      <input class="form-control"
             type="text"
             ng-value="wallet.getChecksumAddressString()"
             readonly="readonly" style="border-radius:40px;">
    </div>

    <div class=" address-identicon-container">
      <div class="addressIdenticon"
           title="Address Indenticon"
           blockie-address="{{wallet.getAddressString()}}"
           watch-var="wallet" style="padding-bottom: 0%;">
      </div>
    </div>

    

    <div class="col-xs-12" ng-show='showEnc'>
      <div class="account-help-icon">
        <img src="images/icon-help.svg" class="help-icon" />
        <p class="account-help-text" translate="x_KeystoreDesc">
          This Keystore / JSON file matches the format used by Mist & Geth so you can easily import it in the future. It is the recommended file to download and back up.
        </p>
        <h5 translate="x_Keystore" style="width:73%;">
          Keystore/JSON File (Recommended • Encrypted • Mist/Geth Format)
        </h5>
      </div>
      <a class="btn btn-info btn-block btn-primary site-btn sb-gradients hero-subscribe-from" href="{{blobEnc}}" download="{{encFileName}}" translate="x_Download" style="width:73%;border-radius:40px;">
        DOWNLOAD
      </a>
    </div>

    <div class="col-xs-12" ng-show="wallet.type=='default'">
      <div class="account-help-icon">
        <img src="images/icon-help.svg" class="help-icon" />
        <p class="account-help-text" translate="x_PrivKeyDesc">
          This is the unencrypted text version of your private key, meaning no password is necessary. If someone were to find your unencrypted private key, they could access your wallet without a password. For this reason, encrypted versions are typically recommended.
        </p>
        <h5>
          <span translate="x_PrivKey" >
            Private Key (unencrypted)
          </span>
        </h5>
      </div>
      <div class="col-sm-12 input-group">
        <input class="col-sm-8 form-control no-animate"
               type="{{pkeyVisible ? 'text' : 'password'}}"
               ng-value="wallet.getPrivateKeyString()"
               readonly="readonly" style="width:60%;border-radius: 40px;">
        <span tabindex="0"
              aria-label="make private key visible"
              role="button"
              class=" col-sm-3 input-group-addon eye"
              ng-click="showHidePkey()" style="padding-bottom: 8px;padding-top: 8px;padding-right: 50px;padding-left: 20px;border-radius: 40px;"></span>
      </div>
    </div>


    <div class="col-xs-12" ng-show="wallet.type=='default'">
      <div class="account-help-icon">
        <img src="images/icon-help.svg" class="help-icon" />
        <p class="account-help-text" translate="x_PrintDesc">
          ProTip: If you cannot print this right now, click "Print" and save it as a PDF until you are able to get it printed. Remove it from your computer afterwards!
        </p>
        <h5 translate="x_Print">
          Print Paper Wallet:
        </h5>
      </div>
      <a class="btn btn-info btn-block btn-primary site-btn sb-gradients hero-subscribe-from" ng-click="printQRCode()" translate="x_Print" style="width:73%;border-radius:40px;">
        Print Paper Wallet
      </a>
    </div>
  </section>


  <section class="block" style="margin-bottom: 20px;">

    <div class="col-xs-6">

      <h5 translate="x_Address">
        Your Address:
      </h5>
      <div class="qr-code" qr-code="{{wallet.getChecksumAddressString()}}" watch-var="wallet" width="100%"></div>

    </div>

    <div class="col-xs-6">

      <h5 ng-show="wallet.type=='default'">
        <span translate="x_PrivKey">
          Private Key (unencrypted)
        </span>
      </h5>

      <div class="qr-pkey-container" ng-show="wallet.type=='default'">
        <div class="qr-overlay" ng-show="!pkeyVisible"></div>
        <div class="qr-code" qr-code="{{wallet.getPrivateKeyString()}}" watch-var="wallet" width="100%"></div>
        <div class="input-group">
          <input class="form-control no-animate"
                 type="{{pkeyVisible ? 'text' : 'password'}}"
                 ng-value="wallet.getPrivateKeyString()"
                 readonly="readonly"
                 style="display:none;width:0;height:0;padding:0;border-radius: 40px;">
          <span tabindex="0"
                aria-label="make private key visible"
                role="button" class="input-group-addon eye"
                ng-click="showHidePkey()"></span>
        </div>
      </div>

    </div>

  </section>


</article>




<article class="col-sm-5" style="padding-left: 50px;">  
   <style>

        wallet-balance-drtv {
          color:#fff;
          /*margin-top: -150px;*/
        }

      @media only screen and (max-width: 900px) {  
         wallet-balance-drtv {
           color:#000;
           /*margin-top: 100px;*/
          }
      }
    </style>
  <wallet-balance-drtv></wallet-balance-drtv>
</article>
