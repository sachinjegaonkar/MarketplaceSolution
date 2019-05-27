# Marketpalce Solution

⚙️ A distributed ledger technology based cattle marketplace solution

Problem Statement
==================

The problem statement was a part of [TECHGIG's coding contest - Code Gladiators 2019 - Round 2](https://www.techgig.com/codegladiators) held for 45 days which has ended on 27th May 2019.

You need to create a marketplace solution based on distributed ledger technology to sell or purchase cattle and cow milk. The stakeholders involved in the marketplace solution are as mentioned below -
1. Farmers - Seller / Buyer of cattle,
2. Dairy Companies - Buyer of the cow milk from farmers,
3. Veterinarians - Confirms the health certificate of the cattle uploaded by farmers,
4. Government - Provides digital identity of the farmers with digital signature.


Abstract
==================

Today, when the farmers have to sell cattle, they usually sell them to the neighbor farmers or sell it to the cattle traders. While selling, the farmers do not get the best price. From buyers' perspective, the buyers also don't know the historical records of cow like when it was born, when it gave birth to the last calf, the periodical health record certificates of the cow etc. These information should be captured in an immutable fashion so that the buyers can have the trust in the system. The dairy companies who also purchase the milk from the farmers are not aware about the cow from which it got the milk, the health certificate of the cow, the breed of the cow etc. This solution would address the challenges faced in the cattle trading market today.


Current Marketplace Problems
==================

* No Trust and Transparency
* Much Transportation Cost – To transport cattle's to/from the market
* Waste of Time and Money – If the deal is not successful
* Limited Market Scope
* Brokerage Charges - Middleman
* No Cattle History
* No Cattle Health Records


Requirements
=====================

The solution would have to do the following -

1. Immutable Animal Registration and Lifecycle Maintenance: Farmers will be able to register a cow's life cycle starting from birth till the end of life; E.g. when the cow was born, when it gave birth to a calf, when the cow died etc. Farmers will upload the health certificate of each cattle periodically.
2. Smart Contract For Selection of Sellers: The buyers (i.e. farmers or dairy companies) can provide their requirements to purchase the cow (for farmers) or cow milk (for dairy companies) over the network. The requirements can be the breed of the cow, the age of the cow, the number of cows to be purchased etc. Based on the requirements, the sellers will be chosen through smart contract.
3. Auction of Cattle or Cow-Milk: The seller farmer can auction the cattle or cow's milk (based on the breed, health record of the cow etc.) to the farmers or to the dairy companies respectively. The seller would set the base price of the cattle / cow milk and the buyers (i.e. farmer / dairy companies) would provide their respective prices. After the end of the entire auction process, for the farmers selling cattle to the buyer farmers, the ownership of the cattle has to be transferred.
4. Digital Identity: The buyers' or sellers' digital identities should be verified based on the digital signatures provided by the government. It will also ensure to verify asset identity (i.e. cow's identity). All entities (i.e. farmers and cattle) would be provided with unique identity.
5. Digital Wallet: Financial transaction should be realized using a wallet.
6. Transaction Visibility: All relevant transactions private to one farmer should be hidden from other farmers. All data should be visible to Government and Veterinarians.
7. User Interface Creations: User interfaces to be created for farmers, veterinarians, Government and diary companies. An additional user interface for a blockchain system manager/auditor (who would have access to information across different stakeholders) should be created.
8. Machine Learning Module: Based on the past transactions and feedback from the buyer, the sellers will be given a trust score. Use machine learning (e.g. sentiment analysis from the feedbacks given by the buyers) and appropriate parameters (e.g. ratings given by the buyer) to derive the trust score.

Scenario
=====================

1. Create a multi node Blockchain network of a minimum of 8 nodes (1 for veterinarians, 1 for government, 6 for the dairy companies. Assignment of nodes to farmers is left onto the developers).
2. Provide a visual representation of the transaction starting from the base price quoted by the seller till the cattle ownership is transferred.
3. Simulate the working model of auction approach for cattle trading and cow milk trading.
4. Simulate smart contracts. Weightage will be given for the creativity on coming up with additional smart contracts except the one mentioned in the requirement.
5. Provide a visual rating of farmer reputation.

Criteria
=====================

1. Build a working system on any available Blockchain platform of their choice fulfilling the requirements mentioned above.
2. The solution must follow a mobile-first approach for all stakeholders and use web based interfaces on a need basis.
3. The solution should contain at least 10 farmers and 6 dairy companies. Each farmer should have 20 cows registered in the system.
4. The marketplace has to be designed in such a way that other marketplaces can be built out of it.


Technology/Tool/Cloud Stack
=====================

* BLOCKCHAIN - Ethereum smart contracts – Solidity
* HTML5, JavaScript, Node.js and Web3.js
* Ropsten TestNet
* Truffle framework
* MetaMask
* Remix IDE
* Mobility
* Machine Learning


Steps to Compile
=====================

* truffle init
* truffle.cmd compile
* truffle.cmd test
* truffle.cmd migrate --network ropsten OR
* Use 'remix-ide' command - to deploy on ropsten network and test the contracts


Advantages
=====================

* Eliminates the lack of Trust and Transparency
* Eliminates the existence of middleman between buyers and sellers
* Decision making freedom resides with buyers and sellers
* While selling, the farmers will get the best price
* Decentralised System
* More secure
* The buyers will have the trust in the system
* Addresses the challenges faced in the cattle trading market today
* Enables the marketplace anti-corruption measures


Disadvantages
=====================

* Needs training to be given to the stakeholders


Demonstration Video/Prototype Demo
=====================

[![Watch the Demo]](https://youtu.be/K6KH5WyjSpA)


Challenges Faced
=====================

* To choose the seller automatically based on the published requirements by the buyer


Possible Improvements
=====================

* Improve the rating mechanism by adding the trust score and the factors that matters
* Use more machine learning models to introduce more easy decision making for the buyers and sellers
* Improve Scalability – Make it generic to make this solution to be reusable for other marketplaces
* Improve the User Interface
