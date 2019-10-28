pragma solidity >=0.4.22 <0.6.0;

contract fulcrumInterface {
    function borrowInterestRate() public view returns (uint256);
    function avgBorrowInterestRate() public view returns (uint256);
    function getBorrowAmount(uint256 escrowAmount, uint256 leverageAmount, bool withdrawOnOpen) public view returns (uint256);
    
}
contract trucklending {
    
    address fulcrumkovan = 0xF1C87dD61BF8a4e21978487e2705D52AA687F97E;
    fulcrumInterface fulcrumcontract = fulcrumInterface(fulcrumkovan);
    
    struct truckdriver {
        string dotnumber;
        string carriername;
        string originlocation; 
        address driveraddress;
    }
    
    struct warehouse {
        string streetaddress;
        string city;
        string state;
        string zipcode;
        address warehouseaddress;
    }
}