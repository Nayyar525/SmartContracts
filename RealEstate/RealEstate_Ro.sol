pragma solidity >=0.4.22 < 0.7.0;
pragma experimental ABIEncoderV2;
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
  bytes32[] allData;
    
    function registerPropertiesByBuilderToRO(uint256 builderID, uint256  buyerID, uint256 flatID, string memory  approvalStatus, uint256  propertyID, string memory  Remark, string memory  OwnerName) public returns(string memory resp) {
    
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
    
    
        return ("Prperty Register Successfully");
    }
    
    
    function getRegisterPropertyByBuilderToRO(uint8 indexnu) view public returns  (uint256,uint256,uint256,string memory ,uint256,string memory ,string memory)
    {
        return (roMapping[indexnu].builderID,roMapping[indexnu].buyerID,roMapping[indexnu].flatID,roMapping[indexnu].approvalStatus,roMapping[indexnu].propertyID,roMapping[indexnu].Remark,roMapping[indexnu].OwnerName);
    }
    
    event checkAll(uint256 x);
    
    function getAllRegisterProperty() view public returns (RoDetails[] memory )
    {
                uint256 x = 0;
        RoDetails[] memory datanew ;
        while(x < arraylocation)
        {
           //emit checkAll(x);
            datanew[x].builderID = roMapping[x].builderID;
             datanew[x].buyerID = roMapping[x].buyerID;
             datanew[x].flatID = roMapping[x].flatID;
             datanew[x].approvalStatus = roMapping[x].approvalStatus;
             datanew[x].propertyID = roMapping[x].propertyID;
             datanew[x].Remark = roMapping[x].Remark;
             datanew[x].OwnerName = roMapping[x].OwnerName;
            x++;
        }
        
        return datanew;
    }
    
}

