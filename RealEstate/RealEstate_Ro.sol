pragma solidity >=0.4.22 < 0.7.0;

contract RealEstate_RO{
    
    struct RoDetails{
          uint256 builderID;
          uint256 buyerID;
          uint256  flatID;
    string  approvalStatus;
          uint256  propertyID;
          string  Remark;
          string OwnerName;
          
          
        
    }
    mapping (uint => RoDetails) roMapping;
    address public builderAddress;
  uint256 arraylocation=0;
    
    function registerPropertiesByBuilderToRO(uint256 builderID, uint256  buyerID, uint256 flatID, string memory  approvalStatus, uint256  propertyID, string memory  Remark, string memory  OwnerName) public returns(bytes32 resp) {
    
    require(builderAddress != msg.sender,"Can't be Builder and Ro can't be same");
        
        RoDetails memory _roDetails;
        _roDetails.builderID=builderID;
        _roDetails.buyerID=buyerID;
        _roDetails.flatID=flatID;
        _roDetails.approvalStatus=approvalStatus;
        _roDetails.propertyID=propertyID;
        _roDetails.Remark=Remark;
        _roDetails.OwnerName=OwnerName;
    
    roMapping[arraylocation]=_roDetails;
    arraylocation=arraylocation+1;
    
    
        return ("its done with tracking iD ");
    }
}

