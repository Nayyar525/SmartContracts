pragma solidity >=0.4.22 <0.6.0;

contract Lottery
{
    address public manager;
   
    address payable[] public player;
    
     constructor (uint amount) public{
        manager = msg.sender;
    }
    function addPlayer() public payable
    {
        require(manager!= msg.sender, "player and manager can't be same");
        
        player.push(msg.sender);
    }
    
    function getAllPlayer() public view returns ( address payable[] memory) {
        return player;
    }
    
    function random() private view returns(uint256)
     {
    return  uint256( keccak256(abi.encodePacked(block.difficulty, block.timestamp, player)));
    }
    
    
    function pickWinner() public restrited ()
    {
    uint256 index=  random() % player.length;
   player[index].transfer(address(this).balance);
  
   player= new address payable[](0);
 
    }
    
    modifier restrited()
    {
        require(msg.sender==manager, "winner only be picked by manager");
        _;
    }
}
