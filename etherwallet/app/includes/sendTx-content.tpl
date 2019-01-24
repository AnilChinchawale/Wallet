<!-- Content -->
  <div class="col-sm-7">


  <!-- If unlocked with address only -->
  <article class="block" ng-show="wallet.type=='addressOnly'">
    <div class="row form-group">
      <h4 translate="SEND_ViewOnly">
        You cannot send with only your address. You must use one of the other options to unlock your wallet in order to send.
      </h4>
      <h5 translate="X_HelpfulLinks">
        Helpful Links &amp; FAQs
      </h5>
      <ul>
        <li class="u__protip">
          <a href="https://myetherwallet.github.io/knowledge-base/getting-started/accessing-your-new-eth-wallet.html"
             target="_blank"
             rel="noopener noreferrer"
             translate="X_HelpfulLinks_1">
                How to Access your Wallet
          </a>
        </li>
        <li class="u__protip">
          <a href="https://myetherwallet.github.io/knowledge-base/private-keys-passwords/lost-eth-private-key.html"
             target="_blank"
             rel="noopener noreferrer"
             translate="X_HelpfulLinks_2">
                I lost my private key
          </a>
        </li>
        <li class="u__protip">
          <a href="https://myetherwallet.github.io/knowledge-base/private-keys-passwords/accessing-different-address-same-private-key-ether.html"
             target="_blank"
             rel="noopener noreferrer"
             translate="X_HelpfulLinks_3">
                My private key opens a different address
          </a>
        </li>
        <li class="u__protip">
          <a href="https://myetherwallet.github.io/knowledge-base/migration/"
             target="_blank"
             rel="noopener noreferrer"
             translate="X_HelpfulLinks_4">
                Migrating to/from MyEtherWallet
          </a>
        </li>
      </ul>
    </div>
  </article>



  <!-- If unlocked with PK -->
<<<<<<< HEAD
  <article class="block" ng-hide="wallet.type=='addressOnly'" >
    <!-- for adding contract -->
=======
  <article class="block" ng-hide="wallet.type=='addressOnly'" style="margin-left: 0px;padding-left: 0px;padding-top: 0px;margin-top: 0px;">
>>>>>>> beta2.0

    <div class="row form-group">
      <address-field placeholder="0xDECAF9CD2367cdbb726E904cD6397eDFcAe6068D" var-name="tx.to"></address-field>
    </div>


    <!-- Amount to Send -->
    <section class="row form-group">

      <div class="col-sm-11">
        <label translate="SEND_amount">
          Amount to Send:
        </label>
      </div>

      <div class="col-sm-12">

        <div class="col-sm-9 input-group">
          <div class="col-sm-9" style="padding:0px;"> 
            <input type="text"
                 class="form-control"
                 placeholder="{{ 'SEND_amount_short' | translate }}"
                 ng-model="tx.value"
                 ng-disabled="tx.readOnly || checkTxReadOnly"
                 ng-class="Validator.isPositiveNumber(tx.value) ? 'is-valid' : 'is-invalid'" style="border-radius: 40px;border:1px solid #16D0C5;width:100%"/>
          </div>
          <div class=" col-sm-3" style="padding:0px;margin-top:7px;">
            <div class=" input-group-btn">

              <a style="border-radius: 40px;"
                 class="btn btn-default"
                 
                 ng-click="dropdownAmount = !dropdownAmount"
                 ng-class="dropdownEnabled ? '' : 'enabled'">
                  <strong>
                    {{unitReadable}}
                    <i class="caret"></i>
                  </strong>
              </a>

              <!-- Amount to Send - Dropdown -->
              <ul class="dropdown-menu dropdown-menu-right"
                  ng-show="dropdownAmount && !tx.readOnly">
                <li>
                  <a ng-class="{true:'active'}[tx.sendMode=='ether']"
                     ng-click="setSendMode('ether')">
                       {{ajaxReq.type}}
                  </a>
                </li>
                <li ng-repeat="token in wallet.tokenObjs track by $index"
                    ng-show="token.balance!=0 &&
                             token.balance!='loading' &&
                             token.balance!='Click to Load' &&
                             token.balance.trim()!='Not a valid ERC-20 token' ||
                             token.type!=='default'" >
                    <a ng-class="{true:'active'}[unitReadable == token.getSymbol()]"
                       ng-click="setSendMode('token', $index, token.getSymbol())" >
                        {{token.getSymbol()}}
                    </a>
                </li>
              </ul>

            </div>
          </div>

        </div>

      </div>

      <!-- Amount to Send - Load Token Balances
      <a class="col-sm-1 send__load-tokens"
         title="Load Token Balances"
         ng-click="wallet.setTokens(); globalService.tokensLoaded=true"
         ng-hide="globalService.tokensLoaded">
          <img src="images/icon-load-tokens.svg" width="16" height="16" />
          <p translate="SEND_LoadTokens">
            Load Tokens
          </p>
      </a>
      -->

      <!-- Amount to Send - Transfer Entire Balance -->
      <p class="col-xs-12" ng-hide="tx.readOnly" style="display:none" >
        <a ng-click="transferAllBalance()" style="display:none">
          <span class="strong" translate="SEND_TransferTotal">
            Send Entire Balance
          </span>
        </a>
      </p>

    </section>
    <!-- Read and Write -->
    <hr>
    <section class="row form-group" ng-show="showReadWrite" ng-controller='contractsCtrl2' ng-cloak ng-init="initContract()">
      <div class="col-sm-11 clearfix">
        <h4 translate="CONTRACT_Interact_Title">
          Read / Write Contract
        </h4>
        <h5> {{ contract.address }} </h5>
        <div class="btn-group">
          <ul class="" ng-show="dropdownContracts">
        <li ng-repeat="func in contract.functions track by $index">
          <a ng-init="selectFunc($index)">
            {{func.name}}
          </a>
        </li>
      </ul>
        </div>

        
          <!-- Write -->
  <span class="form-group" ng-show="contract.selectedFunc!=null">
    <div ng-repeat="input in contract.functions[contract.selectedFunc.index].inputs track by $index">
      <div ng-switch on="input.type">

        <div class="item write-address" ng-switch-when="address">
          <label>
            {{input.name}}<small>{{input.type}}</small>
          </label>
          <div class="row">
            <div class="col-xs-11">
              <input class="form-control"
                     type="text"
                     placeholder="0x314156..."
                     ng-model="input.value"
                     var-name="tx.to"
                     ng-class="Validator.isValidAddress(input.value) ? 'is-valid' : 'is-invalid'"/>
            </div>
            <div class="col-xs-1">
              <div class="addressIdenticon med"
                   title="Address Indenticon"
                   blockie-address="{{input.value}}"
                   watch-var="input.value">
              </div>
            </div>
          </div>
        </div>

        <p class="item write-unit256" ng-switch-when="uint256">
          <label>
            {{input.name}} <small> {{input.type}} </small>
          </label>
          <input class="form-control"
                 type="text"
                 placeholder="151 {{ 'SEND_amount_short' | translate }}"
                 ng-model="input.value tx.value"
                 ng-disabled="tx.readOnly || checkTxReadOnly"
                 ng-class="Validator.isPositiveNumber(input.value) ? 'is-valid' : 'is-invalid'" />
                 
        </p>

        <!--<p class="item write-string" ng-switch-when="string">
          <label>
            {{input.name}} <small> {{input.type}} </small>
          </label>
          <input class="form-control"
                 type="text"
                 placeholder="Ohh! Shiny!"
                 ng-model="input.value"
                 ng-class="input.value!='' ? 'is-valid' : 'is-invalid'" />
        </p>

        <p class="item write-bytes" ng-switch-when="bytes">
          <label>
            {{input.name}} <small> {{input.type}} </small>
          </label>
          <input class="form-control"
                 type="text"
                 placeholder="0x151bc..."
                 ng-model="input.value"
                 ng-class="Validator.isValidHex(input.value) ? 'is-valid' : 'is-invalid'" />
        </p>

        <p class="item write-boolean" ng-switch-when="bool">
          <label>
            {{input.name}} <small> {{input.type}} </small>
          </label>
          <span class="radio">
            <label>
              <input ng-model="input.value" type="radio" name="optradio-{{input.name}}" ng-value="true">
                True
            </label>
          </span>
          <span class="radio">
            <label>
              <input ng-model="input.value" type="radio" name="optradio-{{input.name}}" ng-value="false">
                False
            </label>
          </span>
        </p>-->
        <p class="item" ng-switch-default>
          <label> {{input.name}} <small> {{input.type}} </small> </label>
          <input class="form-control" type="text" placeholder="" ng-model="input.value" ng-class="input.value!='' ? 'is-valid' : 'is-invalid'"/>
        </p>

      </div>
    </div>
  </span>
  <!-- / Write -->


  <!-- Output -->
  <span class="form-group output" ng-show="contract.functions[contract.selectedFunc.index].constant">
    <div ng-repeat="output in contract.functions[contract.selectedFunc.index].outputs track by $index" class="form-group">
      <div ng-switch on="output.type">

        <!-- Address -->
        <div class="item write-address" ng-switch-when="address">
          <label> &#8627; {{output.name}} <small> {{output.type}} </small> </label>
          <div class="row">
            <div class="col-xs-11"><input class="form-control" type="text" placeholder="0x314156..." ng-model="output.value" readonly/></div>
            <div class="col-xs-1"><div class="addressIdenticon med" title="Address Indenticon" blockie-address="{{output.value}}" watch-var="output.value" > </div> </div>
          </div>
        </div>

        <!-- unit256 -->
        <p class="item write-unit256" ng-switch-when="uint256">
          <label>
            &#8627; {{output.name}}
            <small> {{output.type}} </small>
          </label>
          <input class="form-control" type="text" placeholder="151" ng-model="output.value" readonly/>
        </p>

        <!-- Address -->
        <p class="item write-string" ng-switch-when="string">
          <label>
            &#8627; {{output.name}}
            <small> {{output.type}} </small>
          </label>
          <input class="form-control" type="text" placeholder="Ohh! Shiny!" ng-model="output.value" readonly/>
        </p>

        <!-- Bytes -->
        <p class="item write-bytes" ng-switch-when="bytes">
          <label>
            &#8627; {{output.name}}
            <small> {{output.type}} </small>
          </label>
          <input class="form-control" type="text" placeholder="0x151bc..." ng-model="output.value" readonly/>
        </p>

        <!-- Boolean--> 
        <p class="item write-boolean" ng-switch-when="bool">
          <label>
            &#8627; {{output.name}}
            <small> {{output.type}} </small>
          </label>
          <span ng-show="output.value==true" class="output-boolean-true"> <img src="images/icon-check-green.svg" width="22px" height="22px" /> TRUE </span>
          <span ng-show="output.value==false" class="output-boolean-false"> <img src="images/icon-x.svg" width="22px" height="22px" />  FALSE </span>
        </p>

        <!--  -->
        <p class="item" ng-switch-default>
          <label>
            &#8627; {{output.name}}
            <small> {{output.type}} </small>
          </label>
          <input class="form-control" type="text" placeholder="" ng-model="output.value" readonly/>
        </p>
      </div>
    </div>
  </span>
  <!-- / Output -->
        
      </div>
    </section>

    <!-- Read and Write  end -->
    <hr>
    <!-- Gas Limit -->
    <!-- <section class="row form-group">
      <div class="col-sm-11 clearfix">
        <a class="account-help-icon"
           href="https://myetherwallet.github.io/knowledge-base/gas/what-is-gas-ethereum.html"
           target="_blank"
           rel="noopener noreferrer">
          <img src="images/icon-help.svg" class="help-icon" />
          <p class="account-help-text" translate="GAS_LIMIT_Desc"></p>
        </a>
        <label translate="TRANS_gas">
          Gas Limit:
        </label>
        <input type="text"
               class="form-control"
               placeholder="21000"
               ng-model="tx.gasLimit"
               ng-change="gasLimitChanged=true"
               ng-disabled="tx.readOnly || checkTxReadOnly"
               ng-class="Validator.isPositiveNumber(tx.gasLimit) ? 'is-valid' : 'is-invalid'" />
      </div>
    </section> -->

    <!-- Advanced Option Panel -->
    <a ng-click="showAdvance=true"
       ng-show='globalService.currentTab==globalService.tabs.sendTransaction.id || tx.data != ""' style="display:none">
      <p class="strong" translate="TRANS_advanced">
        + Advanced: Add Data
      </p>
    </a>



    <div ng-show="showAdvance || checkTxPage">

      <!-- Data -->
      <section class="row form-group">
        <div class="col-sm-11 clearfix" ng-show="tx.sendMode=='ether'">
          <span class="account-help-icon">
            <img src="images/icon-help.svg" class="help-icon" />
            <p class="account-help-text" translate="OFFLINE_Step2_Label_6b">
              This is optional.
            </p>
          </span>

          <label translate="TRANS_data"> Data: </label>

          <input type="text"
                 class="form-control"
                 placeholder="0x6d79657468657277616c6c65742e636f6d20697320746865206265737421"
                 ng-model="tx.data"
                 ng-disabled="tx.readOnly || checkTxReadOnly"
                 ng-class="Validator.isValidHex(tx.data) ? 'is-valid' : 'is-invalid'"/>

        </div>
      </section>


      <!-- Nonce -->
      <section class="row form-group" ng-show="checkTxPage">
        <div class="col-sm-11 clearfix">

          <a class="account-help-icon"
             href="https://myetherwallet.github.io/knowledge-base/transactions/what-is-nonce.html"
             target="_blank"
             rel="noopener noreferrer">
            <img src="images/icon-help.svg" class="help-icon" />
            <p class="account-help-text" translate="NONCE_Desc"></p>
          </a>

          <label translate="OFFLINE_Step2_Label_5">
            Nonce
          </label>
          <input type="text"
                 class="form-control"
                 placeholder="2"
                 ng-model="tx.nonce"
                 ng-disabled="checkTxReadOnly"
                 ng-class="Validator.isPositiveNumber(tx.nonce) ? 'is-valid' : 'is-invalid'" />

        </div>
      </section>


      <!-- Gas Price -->
      <section class="row form-group" ng-show="checkTxPage">
        <div class="col-sm-11 clearfix">
          <a class="account-help-icon"
             href="https://myetherwallet.github.io/knowledge-base/gas/what-is-gas-ethereum.html"
             target="_blank"
             rel="noopener noreferrer">
                <img src="images/icon-help.svg" class="help-icon" />
                <p class="account-help-text" translate="GAS_PRICE_Desc"></p>
          </a>

          <label translate="OFFLINE_Step2_Label_3">
            Gas Price:
          </label>
          <input type="text"
                 class="form-control"
                 placeholder="50"
                 ng-model="tx.gasPrice"
                 ng-disabled="checkTxReadOnly"
                 ng-class="Validator.isPositiveNumber(tx.gasPrice) ? 'is-valid' : 'is-invalid'" />

        </div>
      </section>

    </div>
    <!-- / Advanced Option Panel -->





    <div class="clearfix form-group">
      <div class="well" ng-show="wallet!=null && customGasMsg!=''">
        <p>
          <span translate="SEND_CustomAddrMsg">
            A message regarding
          </span>
          {{tx.to}}
          <br />
          <strong>
            {{customGasMsg}}
          </strong>
        </p>
      </div>
    </div>



    <div class="row form-group">
      <div class="col-xs-12 clearfix">
        <a class="btn btn-info btn-block site-btn sb-gradients "
           ng-click="generateTx()"
           translate="SEND_generate" style="width: 75%;">
              Generate Transaction
        </a>
      </div>
    </div>


    <div class="row form-group" ng-show="rootScopeShowRawTx">

      <div class="col-sm-6">
        <label translate="SEND_raw">
          Raw Transaction
        </label>
        <textarea class="form-control" rows="4" readonly>{{rawTx}}</textarea>
      </div>

      <div class="col-sm-6">
        <label translate="SEND_signed">
          Signed Transaction
        </label>
        <textarea class="form-control" rows="4" readonly>{{signedTx}}</textarea>
      </div>

    </div>

    <div class="clearfix form-group" ng-show="rootScopeShowRawTx">
      <a class="btn btn-primary btn-block col-sm-11 btn-danger"
         data-toggle="modal"
         data-target="#sendTransaction"
         translate="SEND_trans"
         ng-click="parseSignedTx( signedTx )" style="width: 75%;border-radius:40px">
             Send Transaction
      </a>
    </div>




  </article>

</div>
<!-- / Content -->





<!-- Sidebar -->

<!-- <section class="col-sm-5" style="padding-left: 50px;display: block;background-image: url(images/lap-top2.png);background-repeat: no-repeat;margin-top: -150px;"> -->
  
<section class="col-sm-5" >
  <div class="block block--danger"
       ng-show="wallet!=null && globalService.currentTab==globalService.tabs.swap.id && !hasEnoughBalance()" >

    <h5 translate="SWAP_Warning_1" style="color:#fff;" >
      Warning! You do not have enough funds to complete this swap.
    </h5>

    <p translate="SWAP_Warning_2" style="color:#fff;">
      Please add more funds to your wallet or access a different wallet.
    </p>

  </div>
  
    <style>

        wallet-balance-drtv {
          color:#fff;
          
        }

      @media only screen and (max-width: 900px) {  
         wallet-balance-drtv {
           color:#000;
           
          }
      }
    </style>


    <wallet-balance-drtv style=" margin-top: -150px;"></wallet-balance-drtv>


  <div ng-show="checkTxPage"
       ng-click="checkTxReadOnly=!checkTxReadOnly"
       class="small text-right text-gray-lighter" style="color:#fff;">
        <small translate="X_Advanced" >
          Advanced Users Only.
        </small>
  </div>

</section>
<!-- / Sidebar -->
