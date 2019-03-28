pragma solidity >=0.4.22 < 0.7.0;

contract RealEstate_RO{
    
    struct RoDetails{
          uint256 builderID;
          uint256 buyerID;
          uint256  flatID;
          bytes32  approvalStatus;
          uint256  propertyID;
          bytes32  Remark;
          bytes32 OwnerName;
          
          
        
    }
    mapping (uint => RoDetails) roMapping;
    address public builderAddress;
  
    
    function registerPropertiesByBuilderToRO(uint256 builderID, uint256  buyerID, uint256 flatID, bytes32  approvalStatus, uint256  propertyID, bytes32 Remark, bytes32 OwnerName) public {
    
    require(builderAddress != msg.sender,"Can't be Builder and Ro can't be same");
        
        RoDetails memory _roDetails;
        _roDetails.builderID=builderID;
        _roDetails.buyerID=buyerID;
        _roDetails.flatID=flatID;
        _roDetails.approvalStatus=approvalStatus;
        _roDetails.propertyID=propertyID;
        _roDetails.Remark=Remark;
        _roDetails.OwnerName=OwnerName;
    
    
        
    }
}
