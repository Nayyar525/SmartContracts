pragma solidity >=0.4.22 <0.6.0;



contract TicTacToe {
    uint[] board = new uint[](9);
    uint winningAmount;
  uint tokenvalue =10000000000000;
    address player1;
    address player2;
    mapping(address => uint)  tokenMapping;
    uint start = 0;
    uint nunmberOfRounds;
    uint betAmount;
    
    
            constructor()  public {
        player1 = msg.sender;
    }
    
    function purcaseToken( address _player) public  payable  returns(uint)    {
        require(msg.value > 0.01 ether,"value should be greater 0.01 ether");
        
        uint tempToken = msg.value / tokenvalue;
        
        
        tokenMapping[msg.sender]=tempToken;
        
        
        return tokenMapping[msg.sender];
        
    }
    function remainingToken() public view returns(uint)
    
 {
         return tokenMapping[msg.sender];
    }
    
    
    
    function joinGame(address _player) public {
        require(player1!=msg.sender, "player1 and player2 can't be same");
        checkToken(msg.sender,betAmount*nunmberOfRounds);
        player2 = msg.sender;
    }
    
    function resetGame() public  returns(string memory)
    {
        require(msg.sender != player1,"Only who created the role have access to reset the game");
        player2 = address(0);
        winningAmount=0;
        nunmberOfRounds=0;
        
    }
    



    function setGame(uint bet, uint NOR ) public returns(string memory)
    {
        nunmberOfRounds= NOR;
        if(nunmberOfRounds>0) return "rounds are still pending from last game. Please reset the game for fresh start";
        betAmount = bet* NOR;
        checkToken(player1,betAmount);
    }
    
    function nextRound()  private 
    {
        
        nunmberOfRounds = nunmberOfRounds-1;
        if(nunmberOfRounds==0) closechannel(msg.sender);
        board = new uint[](9);
    }
    
    function nextTurn(uint place ) public  returns (string memory){
        
         uint winner = checkWinner();
        if(winner == 1){
            nextRound();
          
            return "The game is over and the Winner is X";
        }
        if (winner == 2){ 
            nextRound();
           
            return "The game is over and the Winner is O";
        }
        // correct users is on turn
        if(start == 0){
            if(msg.sender != player1) return "you are not player 1";
        }else if(start == 1){
            if(msg.sender != player2) return "you are not player 2";
        }
        
        // is on the board
        if(place < 0 || place >= 9) return "not on the board";
        
        // Is not already set
        if(board[place] != 0) return "already occupied";

        board[place] = start+1;
        start = 1- start;
        // tokenMapping[msg.sender]= tokenMapping[msg.sender]-betAmount;
        // winningAmount = winningAmount + betAmount;
        return "OK";   
    }
    
function closechannel(address payable win) private 
{
   uint  amount= winningAmount *tokenvalue;
    win.transfer(amount);
}

    
    uint[][]  tests = [[0,1,2],[3,4,5],[6,7,8], [0,3,6],[1,4,7],[2,5,8], [0,4,8],[2,4,6]  ];
 // 0 1 2
// 3 4 5
// 6 7 8
function checkWinner() private returns (uint){
    for(uint i =0; i < 8;i++){
        uint[] memory b = tests[i];
        if(board[b[0]] != 0 && board[b[0]] == board[b[1]] && board[b[0]] == board[b[2]]) 
       
            return board[b[0]];
        
        
        
        
    }
    return 0;
 }
 
 
 function checkToken(address player , uint betprice) private 
 {
  require(tokenMapping[player] > betAmount," All token are used please purcaseToken"); 
  tokenMapping[player]= tokenMapping[player] - betprice;
  winningAmount =winningAmount+betprice;
 }
    
    function gameStatus() public  returns(string memory, string memory) {
        string memory text = "No winner yet";
        uint winner = checkWinner();
        if(winner == 1){
            text = "Winner is X";
        }
        if (winner == 2){
            text = "Winner is O";
        }
        
        
        bytes memory out = new bytes(11);
        byte[] memory signs = new byte[](3);
        signs[0] = "-";
        signs[1] = "X";
        signs[2] = "O";
        bytes(out)[3] = "|";
        bytes(out)[7] = "|";
        
        for(uint i =0; i < 9;i++){
            bytes(out)[i + i/3] = signs[board[i]];
            
        }
        
        return (text, string(out));
    }

}
