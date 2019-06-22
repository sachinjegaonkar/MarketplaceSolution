App = {
  web3Provider: null,
  contracts: {},
  account: '0x0',
  hasVoted: false,

  // ------------------------
  d: [
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
    [1, 2, 3, 4, 0, 6, 7, 8, 9, 5],
    [2, 3, 4, 0, 1, 7, 8, 9, 5, 6],
    [3, 4, 0, 1, 2, 8, 9, 5, 6, 7],
    [4, 0, 1, 2, 3, 9, 5, 6, 7, 8],
    [5, 9, 8, 7, 6, 0, 4, 3, 2, 1],
    [6, 5, 9, 8, 7, 1, 0, 4, 3, 2],
    [7, 6, 5, 9, 8, 2, 1, 0, 4, 3],
    [8, 7, 6, 5, 9, 3, 2, 1, 0, 4],
    [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
  ],

  // permutation table p
  p: [
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
    [1, 5, 7, 6, 2, 8, 3, 0, 9, 4],
    [5, 8, 0, 3, 7, 9, 6, 1, 4, 2],
    [8, 9, 1, 6, 0, 4, 3, 5, 2, 7],
    [9, 4, 5, 3, 1, 2, 6, 8, 7, 0],
    [4, 2, 8, 6, 5, 7, 3, 9, 0, 1],
    [2, 7, 9, 3, 8, 0, 6, 4, 1, 5],
    [7, 0, 4, 6, 9, 1, 3, 2, 5, 8]
  ],

  // validates checksum
  validate: function(array) {
    var c = 0;
    var invertedArray = App.invArray(array);
    var has_only_numbers = !invertedArray.some(isNaN);
    if (has_only_numbers == false) {
      return false;
    } else {
      for (var i = 0; i < invertedArray.length; i++) {
        c = d[c][p[(i % 8)][invertedArray[i]]];
      }
      return (c === 0);
    }
  },

  // converts string or number to an array and inverts it
  invArray: function(array) {
    if (Object.prototype.toString.call(array) === '[object Number]') {
      array = String(array);
    }

    if (Object.prototype.toString.call(array) === '[object String]') {
      array = array.split('').map(Number);
    }
    return array.reverse();
  },

  isValidNumber: function(aadhaar_no) {
    if (aadhaar_no.length != 12 || aadhaar_no.startsWith('0') || aadhaar_no.startsWith('1')) {
      return false;
    }
    return App.validate(aadhaar_no);
  },
  // ------------------------

  init: function() {
    return App.initWeb3();
  },

  initWeb3: function() {
    // TODO: refactor conditional
    if (typeof web3 !== 'undefined') {
      // If a web3 instance is already provided by Meta Mask.
      App.web3Provider = web3.currentProvider;
      web3 = new Web3(web3.currentProvider);
    } else {
      // Specify default instance if no web3 instance provided
      App.web3Provider = new Web3.providers.HttpProvider('http://localhost:7545');
      web3 = new Web3(App.web3Provider);
    }
    return App.initContract();
  },

  initContract: function() {
    $.getJSON("Marketplace.json", function(marketplace) {
      // Instantiate a new truffle contract from the artifact
      App.contracts.Marketplace = TruffleContract(marketplace);
      // Connect provider to interact with contract
      App.contracts.Marketplace.setProvider(App.web3Provider);

      App.listenForEvents();

      return App.render();
    });
  },

  // Listen for events emitted from the contract
  listenForEvents: function() {
    App.contracts.Marketplace.deployed().then(function(instance) {
      // Restart Chrome if you are unable to receive this event
      // This is a known issue with Metamask
      // https://github.com/MetaMask/metamask-extension/issues/2393
      instance.votedEvent({}, {
        fromBlock: 0,
        toBlock: 'latest'
      }).watch(function(error, event) {
        console.log("event triggered", event)
        // Reload when a new vote is recorded
        App.render();
      });
    });
  },

  render: function() {
    var marketplaceInstance;
    //var loader = $("#loader");
    var content = $("#content");

    //loader.show();
    //content.hide();

    content.show();

    // Load account data
    web3.eth.getCoinbase(function(err, account) {
      if (err === null) {
        App.account = account;
        $("#accountAddress").html("Your Account: " + account);
      }
    });
  },

  createAccount: function() {
      var name = $('#txtfull_name').val();
      var emailId = $('#txtemail_id').val();
      var resAddress = $('#txtaddress').val();
      var phone = $('#txtmobile_no').val();
      var password1 = $('#txtpassword').val();
      var accountType = $('#user_type').val();
      var identity = 1;

      if (accountType == 1) // farmer
      {
        // Validate aadhar Id
      }

      App.contracts.Marketplace.deployed().then(function(instance) {
        return instance.registerAccount(accountType, name, emailId, resAddress, phone, password1, identity, { from: App.account });
      }).then(function(result) {
        // Wait for votes to update
        //$("#content").hide();
        //$("#loader").show();
      }).catch(function(err) {
        console.error(err);
      });
  },

  registerCattle: function() {
      var txtCattleName = $('#txtCattleName').val();
      var Birth_Date = $('#Birth_Date').val();
      var Breed_Type = $('#Breed_Type').val();
      var milk_in_ltrs = $('#milk_in_ltrs').val();
      var cattle_sex = $('#cattle_sex').val();
      var location = $('#location').val();

      var last_caft_birth = $('#last_caft_birth').val();
      var cattleHealth = $('#radio-choice-1').val();
      var description = $('#description').val();

      App.contracts.Marketplace.deployed().then(function(instance) {
        return instance.RegisterCattle(txtCattleName, Birth_Date, Breed_Type, last_caft_birth, cattle_sex == 'F', milk_in_ltrs, cattleHealth, description, { from: App.account });
      }).then(function(result) {
        // Wait for votes to update
        //$("#content").hide();
        //$("#loader").show();
      }).catch(function(err) {
        console.error(err);
      });
  },

  castVote: function() {
    var candidateId = $('#candidatesSelect').val();
    App.contracts.Marketplace.deployed().then(function(instance) {
      return instance.vote(candidateId, { from: App.account });
    }).then(function(result) {
      // Wait for votes to update
      //$("#content").hide();
      //$("#loader").show();
    }).catch(function(err) {
      console.error(err);
    });
  }
};

$(function() {
  $(window).load(function() {
    App.init();
  });
});
