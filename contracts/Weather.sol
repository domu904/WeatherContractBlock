contract Weather {
  address public owner;
  mapping (address => uint) balances;
  uint weatherBet;


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

  function putABet(address _betPlayer, uint _ethValue, uint _weatherBet) returns (bool success) {
    //need to ensure the bet player put in the same amount as the owner of the contract
    if(balances[owner] < _ethValue) {
      return false;
    }

    balances[_betPlayer] += _ethValue;
    weatherBet = _weatherBet;
    return true;
  }

  function figureOutWinner() returns (bool success) {

  }

}
