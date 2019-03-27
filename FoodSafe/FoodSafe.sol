
pragma solidity ^0.4.6;

contract FoodSafe
{
    struct Location
    {
            string Name;
            uint LocationID;
            uint PreviousLocationID;
            uint TimeStamp;
            string Secret;
    }

    mapping(uint => Location) Trail;
    uint8 TrailCount=0;

    function AddNewLocation(uint LocationID,string Name,string Secret) public
    {
        Location memory NewLocation;
        NewLocation.Name = Name;
        NewLocation.LocationID = LocationID;
        NewLocation.Secret = Secret;
        NewLocation.TimeStamp=now;
        if(TrailCount!=0)
        {
            NewLocation.PreviousLocationID=Trail[TrailCount].LocationID;
        
        }
        Trail[TrailCount]=NewLocation;
        TrailCount++;
    }

    function GetTrailCount() view public returns(uint8) 
    {
        return TrailCount;
    } 

    function GetLocation(uint8 TrailNo) view public returns (string,uint,uint,uint,string)
    {
        return (Trail[TrailNo].Name, Trail[TrailNo].LocationID,Trail[TrailNo].PreviousLocationID,Trail[TrailNo].TimeStamp ,Trail[TrailNo].Secret );
    }
}