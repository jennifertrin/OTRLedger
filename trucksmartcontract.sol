pragma solidity >=0.4.22 <0.6.0;

///usage of iToken, allowing users to lend truck drivers and earn interest

///Interface to connect Fulcrum and functions that will be used in the trucklending contract
contract fulcrumInterface {
    function borrowInterestRate() public view returns (uint256);
    function avgBorrowInterestRate() public view returns (uint256);
    function getBorrowAmount(uint256 escrowAmount, uint256 leverageAmount, bool withdrawOnOpen) public view returns (uint256);
    function mint(address receiver, uint256 depositAmount) external returns (uint256 mintAmount);
}
contract trucklending {

    uint averagefee;
    uint lumperfee;
    mapping (address => uint) public mappedUsers;
    address public truckaddresses;
    uint arrayLength = totallumpers.length;
    uint[] public totallumpers;

    ///Connect Fulcrum Kovan Contract
    address fulcrumkovan = 0xF1C87dD61BF8a4e21978487e2705D52AA687F97E;
    fulcrumInterface fulcrumcontract = fulcrumInterface(fulcrumkovan);

    ///Struct for a truck driver
    struct truckdriver {
        string dotnumber;
        string carriername;
        string originlocation;
        address driveraddress;
    }
    ///Struct for a warehouse
    struct warehouse {
        string warehousename;
        string streetaddress;
        string city;
        string state;
        string zipcode;
        address warehouseaddress;
    }
    ///Loan based on lumper fee inputted
    function lumperpayment(uint fee) public {
        mint(msg.sender, fee); ///using mint function
        return fee;
    }
    ///find the average of lumperfee
    function findaveragefee(uint lumpers) public {
        lumperfee.push(lumpers);
        for (uint i = 0; i < arrayLength; i++) {
            totallumpers = lumpers[i] + lumpers[i + 1];
        }
        return totallumpers/(arrayLength);
    }
}