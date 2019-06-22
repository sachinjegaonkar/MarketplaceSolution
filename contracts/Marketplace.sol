pragma solidity ^0.5.8;

import "./Owned.sol";
import "./BirthDate.sol";

contract MarketPlace is Owned {

    //structure of farmer - buyer/seller
    struct Farmer {
        uint aadhaar;                               // aadhar id of the farmer
        address farmer_address;                     // blockchain identifier of the farmer
        string name;
        string residence_address;
        string email;
        string phone;
    }

    //structure of cattle
    struct Cattle {
        uint cattle_id;                             // unique id of the cattle
        address cattle_address;                     // blockchain identifier of the cattle
        address owner;
        string name;
        uint age;
        string breed;
        uint lastCalfBirth;
        bool isCow;
        uint milkInLiters;
        string health;
        string description;
    }

    //structure of dairy_company
    struct Dairy_Company {
        uint dairy_id;                             // unique id of the dairy_company
        address dairy_company_address;             // blockchain identifier of the dairy_company
        string name;
        string residence_address;
        string email;
        string phone;
        string description;
    }

    //structure of Veterinarian
    struct Veterinarian {
        uint veterinarians_id;                      // unique id of the Veterinarian
        address veterinarians_address;              // blockchain identifier of the Veterinarian
        string name;
        string residence_address;
        string email;
        string phone;
        string description;
    }
    
    // Global Veriables
    uint nFarmers;
    uint nCowsPerFarmer;
    uint nDaires;
    uint nVeterinarian;
    
    uint cattleCounter = 0;
    uint dairyCounter = 0;
    uint veterinarianCounter = 0;
    
    // address to borrower map
    mapping (address => Farmer) public cattle_to_owner_map;
    mapping (address => uint) public seller_rating_map;
    
    mapping(uint => Cattle) public cattles_for_sell_map;
    uint cattlesForSellCount;

    address[2] dummyFarmers = [0x02e292B88FAF7ca8118b66956faf418724bC3B30, 0x86F6d73036673B379b2b97e6b02f6B100815C7fA];
    address[6] dummyCattles = [0xfC8CDa1B389223fA8b827687Cd4124C6F2936a7D, 0xF03Bf8432548F49B2782dE4A4a37D1BCb7115557, 0x2FcB336F47dfc35bB68cF595F1C352Fab47E701e, 0x58536970581B2D7D0D789fD4b7297e7D18aDe90E, 0x53ea6c69BD5d0906c226e9Cba5b7D4177656FA06, 0xbd588caC001Ef83e5ddd3021647d5041B19202f5];
    address dummyDairy = 0x0C07945aC6f20B409248CDBBffac32265e71a444;
    address dummyVeterinarian = 0x2CD001b47Abd5bB9BBfd8d01f30F0B76917Fa496;
 
    //Events
    event sellCattleEvent(
    uint indexed _id,
    address indexed _seller,
    string _name,
    uint256 _price);

    event sellMilkEvent(
    uint indexed _id,
    address indexed _seller,
    string _name,
    uint256 _price);

    event buyCattleEvent(
    uint indexed _id,
    address indexed _seller,
    address indexed _buyer,
    string _name,
    uint256 _price);

    Farmer[] Farmers;// = new Farmer[](nFarmers);
    Cattle[] Cattles;// = new Cattle[](nCowsPerFarmer);
    Dairy_Company[] Dairy_Companies;// = new Dairy_Company[](nDaires);
    Veterinarian[] Veterinarians;// = new Veterinarian[](nVeterinarian);

    constructor() public {
    }

    /*constructor(uint _n_farmers, uint _n_cowsperfarmer, uint _n_daires, uint _n_veterinarian) public {
        nFarmers = _n_farmers;
        nCowsPerFarmer = _n_cowsperfarmer;
        nDaires = _n_daires;
        nVeterinarian = _n_veterinarian;
    }*/


    function registerAccount (uint _accountType, string memory _name, string memory _emailId, string memory _resAddress, string memory _phone, string memory _password1, uint _identity) public {
        require(_identity != 0, "Invalid identity number!");
        
        if (_accountType == 1)     // Farmer
        {
            //for (uint i = 0; i < Farmers.length; i++)
            //{
            //    require(Farmers[i].farmer_address != _new_farmer, "Farmer already added into the network!");
            //}
            
            Farmers.push(Farmer({
                aadhaar: _identity,
                farmer_address: dummyFarmers[Farmers.length % (dummyFarmers.length - 1)],
                name: _name,
                residence_address: _resAddress,
                email: _emailId,
                phone: _phone
            }));
        }
        else if (_accountType == 2)     // Veterinarian
        {
            //for (uint i = 0; i < Veterinarians.length; i++)
            //{
            //    require(Veterinarians[i].veterinarians_address != _new_veterinarian, "Veterinarian already added into the network!");
            //}

            Veterinarians.push(Veterinarian({
                veterinarians_id: ++veterinarianCounter,                       // unique id of the Veterinarian
                veterinarians_address: dummyVeterinarian,              // blockchain identifier of the Veterinarian
                name: _name,
                residence_address: _resAddress,
                email: _emailId,
                phone: _phone,
                description: ""
            }));
        }
        else if (_accountType == 3)     // Dairy Company
        {
            //for (uint i = 0; i < Dairy_Companies.length; i++)
            //{
            //    //require(Dairy_Companies[i].dairy_company_address != _new_dairy, "Dairy already added into the network!");
            //}

            Dairy_Companies.push(Dairy_Company({
                dairy_id: ++dairyCounter,                             // unique id of the dairy_company
                dairy_company_address: dummyDairy,              // blockchain identifier of the dairy_company
                name: _name,
                residence_address: _resAddress,
                email: _emailId,
                phone: _phone,
                description: ""
            }));
        }
    }


    // ====================== Farmer (buyer or seller) Functions Start ======================
    function RegisterFarmer(address _new_farmer, string memory _name, string memory _res_address, string memory _email, string memory _phone, uint _aadhaar, bool _asSeller/*?*/) public {
        require(_aadhaar != 0, "Invalid aadhaar number!");
        
        for (uint i = 0; i < Farmers.length; i++)
        {
            require(Farmers[i].farmer_address != _new_farmer, "Farmer already added into the network!");
        }
        
        Farmers.push(Farmer({
            aadhaar: _aadhaar,
            farmer_address: _new_farmer,
            name: _name,
            residence_address: _res_address,
            email: _email,
            phone: _phone
        }));
    }

    function UnRegisterFarmer(address farmer) public {
         //- self unregistration
        for (uint i = 0; i < Farmers.length; i++)
        {
            if (Farmers[i].farmer_address == farmer)
            {
                delete Farmers[i];
                break;
            }
        }
    }

    function SetBasePriceForCattle(address cattle, uint baseprice) public {
        //- farmer should be the owner of the cattle
    }
    function StartAuctionForCattle(address cattle, uint acutionperiod) public {
        // - farmer should be the owner of the cattle
    }
    function EndAuctionForCattle(address cattle) public {
        // - farmer should be the owner of the cattle, - the ownership of the cattle has to be transferred
    }
    function SetBasePriceFoCowMilk(address cattle, uint baseprice) public {
        // - baseprice - per liter, - farmer should be the owner of the cattle
    }
    function StartAuctionForCowMilk(address cattle, uint acutionperiod, uint milkInLiters) public {
        // auctionperiod is in mins
        // - total price = baseprice * milkInLiters, - farmer should be the owner of the cattle
    }
    function EndAuctionForCowMilk(address cattle) public {
        // - farmer should be the owner of the cattle, the ownership of the cow milk has to be transferred
    }

    function RegisterCattle(string memory _name, uint _age, string memory _breed, uint _lastCalfBirth, bool _isCow, uint _milkInLiters/*?*/, string memory _health/*?*/, string memory _description) public {
        // - owner should be registered before hand into the system, - health last updated, - get health confirmation from the veterinarians
        //for (uint i = 0; i < Cattles.length; i++)
        //{
        //    require(Cattles[i].cattle_address != _new_cattle, "Cattle already added into the network!");
        //}

        Cattles.push(Cattle({
            cattle_id: ++cattleCounter,                             // unique id of the cattle
            cattle_address: dummyCattles[Cattles.length % (dummyCattles.length - 1)],                            // blockchain identifier of the cattle
            owner:msg.sender, 
            name: _name, 
            age: _age, 
            breed: _breed, 
            lastCalfBirth: _lastCalfBirth, 
            isCow: _isCow, 
            milkInLiters: _milkInLiters, 
            health: _health, 
            description: _description
        }));

        // Fillup the cattle ownership map
        for (uint i = 0; i < Farmers.length; i++)
        {
            if (Farmers[i].farmer_address == msg.sender)
            {
                cattle_to_owner_map[dummyCattles[Cattles.length % (dummyCattles.length - 1)]] = Farmers[i];  // This Farmer is the owner of the cattle
                break;
            }
        }
    }

    function RequestHealthConfirmation(uint vid, address cattle, string memory health) public {
        // - get health confirmation from the veterinarians
    }
    function HealthConfirmed(address cattle) public {
        // - event raised by Veterinarians
    }
    function UpdateCattleHealth(/*?*/) public {
        // - health certificate or health as - good, not-good, better, best?, - get health confirmation from the veterinarians
    }

    function UnRegisterCattle(address cattle) public {
        // - farmer should be the owner of the cattle
        
        for (uint i = 0; i < Cattles.length; i++)
        {
            if (Cattles[i].cattle_address == cattle)
            {
                require(Cattles[i].owner != msg.sender, "Farmer should be the owner of the cattle!");
                delete Cattles[i];
                break;
            }
        }
    }

    function PublishRequirement(address buyer, string memory breedofcow, uint ageofcow, bool milk, uint milkInLiters /*or numberofcattles if no milk*/) public {
        // - buyer's milk or cattle/cow requirement

        // ToDo: auto choose seller
        ChooseSeller();
    }
    function ChooseSeller() private {
        // - private function, choses the seller based on the given requirements from the buyer
    }
    function RateBuyer(address buyer, uint rating) public {
    }

    function RateSeller(address seller, uint rating) public {
        // - Based on the past transactions and feedback from the buyer, the sellers will be given a trust score.
        require(rating > 5, "Rating should be within the range of 1 to 5!");
        
        seller_rating_map[seller] = rating;
    }

    function RateDairy(address dairy, uint rating) public {
    }
    // ====================== Farmer (buyer or seller) Functions End ======================

    // ====================== DairyCompany Functions Start ======================
    function RegisterDairy(address _new_dairy, string memory _name, string memory _res_address, string memory _email, string memory _phone, string memory _description) public {
        for (uint i = 0; i < Dairy_Companies.length; i++)
        {
            require(Dairy_Companies[i].dairy_company_address != _new_dairy, "Dairy already added into the network!");
        }

        Dairy_Companies.push(Dairy_Company({
            dairy_id: ++dairyCounter,                             // unique id of the dairy_company
            dairy_company_address: _new_dairy,              // blockchain identifier of the dairy_company
            name: _name,
            residence_address: _res_address,
            email: _email,
            phone: _phone,
            description: _description
        }));
    }
    function SetPriceForCattle(address cattle, uint price) public { 
        // - criteria - acution should be in progress for that particular cattle.
    }

    function UnRegisterDairy(address dairy) public {
        for (uint i = 0; i < Dairy_Companies.length; i++)
        {
            if (Dairy_Companies[i].dairy_company_address == dairy)
            {
                delete Dairy_Companies[i];
                break;
            }
        }
    }
    // ====================== DairyCompany Functions End ======================

    // ====================== Veterinarians Functions Start ======================
    function RegisterVeterinarian(address _new_veterinarian, string memory _name, string memory _res_address, string memory _email, string memory _phone, string memory _description) public { 
        // - Unique Id
        for (uint i = 0; i < Veterinarians.length; i++)
        {
            require(Veterinarians[i].veterinarians_address != _new_veterinarian, "Veterinarian already added into the network!");
        }

        Veterinarians.push(Veterinarian({
            veterinarians_id: ++veterinarianCounter,                       // unique id of the Veterinarian
            veterinarians_address: _new_veterinarian,              // blockchain identifier of the Veterinarian
            name: _name,
            residence_address: _res_address,
            email: _email,
            phone: _phone,
            description: _description
        }));
    }
    
    function ConfirmHealth(address cattle, string memory health) public { 
        // - raises confirm event
    }
    function GetHealthConfirmationRequests() public {
    }
    
    function UnRegisterVeterinarian(address veterinarian) public {
        for (uint i = 0; i < Veterinarians.length; i++)
        {
            if (Veterinarians[i].veterinarians_address == veterinarian)
            {
                delete Veterinarians[i];
                break;
            }
        }
    }
    // ====================== Veterinarians Functions End ======================

    //kill the smart contract
    function kill() private onlyOwner {
        //selfdestruct(owner);
    }
}
