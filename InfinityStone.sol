pragma solidity ^0.8.9;

contract InfinityStone {
    address owner;
    uint price; // price to acquire
    bool state; // true if "ACQUIRED", false if "UNTAKEN"
    bytes32 name;   
    bytes32 color;
    
    /**
     * 
     */
    constructor(bytes32 _name, bytes32 _color, uint _price) public {
        name = _name;
        color = _color;
        price = _price;
        state = false;
    }
    
    function acquire() public payable {
        require(!state, "Stone is already taken.");
        require(msg.value >= price, "Transfer value not enough to claim the stone!");
        owner = msg.sender;
    }
    
    function giveAway(address to) public {
        require(state, "Only acquired stones can be given away.");
        require(owner == msg.sender, "Only owner can give away their stones.");
        require(owner != to, "You cannot give the message to yourself.");
        owner = to;
    }
}

contract InfinityGauntlet{
    InfinityStone[] private gauntlet;
    
    function addStones(bytes32 _name, bytes32 _color, uint _price) public {
        new InfinityStone(_name, _color, _price);
    }
    
    function acquireStone(InfinityStone stone) public payable {
        stone.acquire();
        gauntlet.push(stone);
    }

    function giveAwayStone(InfinityStone stone, address to) public {
        stone.giveAway(to);
    }
   
    function snap() public {
        
    }
}
