pragma solidity ^0.5.9;

contract AssessControlled{

  //Define state variables for the owner and the voting status flag
  address owner;
  bool public isVoting;

  constructor (address _owner, bool _isVoting) public {
    isVoting = _isVoting;
    owner = _owner;
  }

  //we define the modifier used as part of our funtions here
  modifier onlyOwner {
    require(msg.sender == owner, "Only the contract owner can perform these functions.");
    _;
  }

  modifier voteClosed{
    require(!isVoting, "Voting is currently open, wait for it to be closed.");
    _;
  }

}
