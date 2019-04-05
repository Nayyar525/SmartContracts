pragma solidity >=0.4.22 < 0.7.0;
contract Coupon
{
     struct couponDetailStruct 
     {
        uint256 UniqueID;
       uint256 CouponID;
       string UserId;
       uint256  CouponCount;
       uint256 CouponExpirydate ;
       uint256 CouponAmount;
       

    }
string message;
string redememessage;

 mapping (uint256 => couponDetailStruct) couponmapping;
 
  function addcoupon( uint256 _uniqueId,uint256 _couponId,string memory _userID, uint256 _couonCount,uint256 _expirydate,uint256 _amount)  public returns(string memory resp)
 {
     couponDetailStruct memory _coupon;

 _coupon.UniqueID=_uniqueId;
 _coupon.CouponID =_couponId;
_coupon.UserId =_userID;
_coupon.CouponCount =_couonCount ;
_coupon.CouponExpirydate=_expirydate;
 _coupon.CouponAmount=_amount;
 couponmapping[_uniqueId]=_coupon;

    
    
        return ("Prperty Register Successfully");
}

function getCouponDetails(uint256 _uniqueId) view public returns (uint256,uint256,string memory, uint256, uint256 , uint256)
 {

     return (
     couponmapping[_uniqueId].UniqueID,
     couponmapping[_uniqueId].CouponID,
     couponmapping[_uniqueId].UserId,
     couponmapping[_uniqueId].CouponCount,
     couponmapping[_uniqueId].CouponExpirydate,
     couponmapping[_uniqueId].CouponAmount);
     
 }
function transfercoupon(uint256 firstuniqueID,uint256 seconduniqueID,uint256 _couponcount)  public returns (uint256,string memory)
{
  string memory  message="This Coupon transfered to the user";
    if(couponmapping[firstuniqueID].CouponCount<_couponcount)
    {
        message="";
     message="CouponCount with not suffisent";   
        
    }
    else
    {
        addcoupontouser({_uniqueId:seconduniqueID,_receviedcouponcount:_couponcount});
    
    uint256 remender= couponmapping[firstuniqueID].CouponCount - _couponcount;
    }
return(
    couponmapping[firstuniqueID].CouponID,
    message);
}
function redemecoupon(uint256 _uniqueId)  public returns (uint256,string memory)
{
    
  uint256 CouponCount = couponmapping[_uniqueId].CouponCount-1;
  string memory redememessage="Coupon redemed successfully";
  couponmapping[_uniqueId].CouponCount=CouponCount;
    return(
        couponmapping[_uniqueId].CouponCount,
        redememessage
        );
}
function addcoupontouser(uint256 _uniqueId ,uint256 _receviedcouponcount) public
{
 couponmapping[_uniqueId].CouponCount+_receviedcouponcount;
}

}
