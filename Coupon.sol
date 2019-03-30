pragma solidity ^0.4.23;
contract Coupon
{
     struct couponDetailStruct 
     {
        uint UniqueID;
       uint CouponID;
       string UserId;
       uint  CouponCount;
       uint CouponExpirydate ;
       uint CouponAmount;
       

    }
string message;
string redememessage;
 mapping (uint => couponDetailStruct) couponmapping;
 
  function addcoupon( uint _uniqueId,uint _couponId,string _userID, uint _couonCount,uint _expirydate,uint _amount)  public 
 {
     
 var _coupon = couponmapping[_uniqueId];
 _coupon.UniqueID=_uniqueId;
 _coupon.CouponID =_couponId;
_coupon.UserId =_userID;
_coupon.CouponCount =_couonCount ;
_coupon.CouponExpirydate=_expirydate;
 _coupon.CouponAmount=_amount;
}

function getCouponDetails(uint _uniqueId) view public returns (uint,uint,string, uint, uint , uint)
 {

     return (
     couponmapping[_uniqueId].UniqueID,
     couponmapping[_uniqueId].CouponID,
     couponmapping[_uniqueId].UserId,
     couponmapping[_uniqueId].CouponCount,
     couponmapping[_uniqueId].CouponExpirydate,
     couponmapping[_uniqueId].CouponAmount);
     
 }
function transfercoupon(uint firstuniqueID,uint seconduniqueID,uint _couponcount) view public returns (uint,string)
{
    message="This Coupon transfered to the user";
    if(couponmapping[firstuniqueID].CouponCount<_couponcount)
    {
        message="";
     message="CouponCount with not suffisent";   
        
    }
    else
    {
        addcoupontouser({_uniqueId:seconduniqueID,_receviedcouponcount:_couponcount});
    
    uint remender= couponmapping[firstuniqueID].CouponCount - _couponcount;
    }
return(
    couponmapping[firstuniqueID].CouponID,
    message);
}
function redemecoupon(uint _uniqueId) view public returns (uint,string)
{
    var _coupon = couponmapping[_uniqueId];
    _coupon.CouponCount= couponmapping[_uniqueId].CouponCount-1;
     redememessage="Coupon redemed successfully";
    return(
        couponmapping[_uniqueId].CouponCount,
        redememessage
        );
}
function addcoupontouser(uint _uniqueId ,uint _receviedcouponcount) public
{
 couponmapping[_uniqueId].CouponCount+_receviedcouponcount;
}

}
