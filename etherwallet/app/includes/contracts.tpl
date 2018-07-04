<main class="tab-pane SendToken active" ng-if="globalService.currentTab==globalService.tabs.SendToken.id" ng-controller='contractsCtrl' ng-cloak ng-init="initContract()">

  <!-- Title -->
  <div class="block text-center" >
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
 

  

  <article ng-show="visibility=='interactView'" id="particles-js">

    @@if (site === 'mew' ) { @@include( '../includes/contracts-interact-modal.tpl', { "site": "mew" } ) }
    @@if (site === 'cx'  ) { @@include( '../includes/contracts-interact-modal.tpl', { "site": "cx"  } ) }

  </article>



  <article class="row block" ng-show="visibility=='deployView'">

    @@if (site === 'mew' ) { @@include( '../includes/contracts-deploy-1.tpl', { "site": "mew" } ) }
    @@if (site === 'cx'  ) { @@include( '../includes/contracts-deploy-1.tpl', { "site": "cx"  } ) }

  </article>

  <article class="form-group"
           ng-show="(!wd && visibility=='deployView') || (!wd && visibility=='interactView' && contract.selectedFunc && !contract.functions[contract.selectedFunc.index].constant)">
      @@if (site === 'cx' )  {  <cx-wallet-decrypt-drtv></cx-wallet-decrypt-drtv>   }
      @@if (site === 'mew' ) {  <wallet-decrypt-drtv></wallet-decrypt-drtv>         }
  </article>

  <article class="row block" ng-show="visibility=='interactView' && showReadWrite">

    @@if (site === 'mew' ) { @@include( '../includes/contracts-interact-2.tpl', { "site": "mew" } ) }
    @@if (site === 'cx'  ) { @@include( '../includes/contracts-interact-2.tpl', { "site": "cx"  } ) }

  </article>

  <article class="col-xs-12" ng-show="contract.selectedFunc!=null && visibility=='interactView'">

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
