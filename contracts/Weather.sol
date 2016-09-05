contract Weather {
  address public owner;
  mapping (address => uint) balances;


  // Constructor
  function Weather(){
    owner = msg.sender;
    balances[owner] = 1000;
  }

  function remove() {
    if (msg.sender == owner){
        selfdestruct(owner);
    }
  }

  function putABet(address _betPlayer, uint _value) returns (bool success) {
    //need to ensure the bet player put in the same amount as the owner of the contract
    if(balances[msg.sender] < _value) {
      return false;
    }

    balances[_betPlayer] += _value;
    return true;
  }

  function figureOutWinner() returns (bool success) {
    
  }

}
