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

    // Load contract data
    /*App.contracts.Marketplace.deployed().then(function(instance) {
      marketplaceInstance = instance;
      return marketplaceInstance.candidatesCount();
    }).then(function(candidatesCount) {
      var candidatesResults = $("#candidatesResults");
      candidatesResults.empty();

      var candidatesSelect = $('#candidatesSelect');
      candidatesSelect.empty();

      for (var i = 1; i <= candidatesCount; i++) {
        marketplaceInstance.candidates(i).then(function(candidate) {
          var id = candidate[0];
          var name = candidate[1];
          var voteCount = candidate[2];

          // Render candidate Result
          var candidateTemplate = "<tr><th>" + id + "</th><td>" + name + "</td><td>" + voteCount + "</td></tr>"
          candidatesResults.append(candidateTemplate);

          // Render candidate ballot option
          var candidateOption = "<option value='" + id + "' >" + name + "</ option>"
          candidatesSelect.append(candidateOption);
        });
      }
      return marketplaceInstance.voters(App.account);
    }).then(function(hasVoted) {
      // Do not allow a user to vote
      if(hasVoted) {
        $('form').hide();
      }
      //loader.hide();
      //content.show();
    }).catch(function(error) {
      console.warn(error);
    });*/
  },

  createAccount: function() {
    var name = $('#name').val();
    var emailId = $('#emailId').val();
    var resAddress = $('#resAddress').val();
    var phone = $('#phone').val();
    var password1 = $('#password1').val();
    var password2 = $('#password2').val();
    var accountType = $('#accountType').val();
    var identity = $('#identity').val();

    if (accountType == 1) // farmer
    {
      //var valid = App.isValidNumber(identity);
      //if (valid){
      //  alert('Valid Aadhar ID');
      //}else{
      //  alert('Invalid Aadhar ID');
      //}

      
    }

    // Validate password1 and password2
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
