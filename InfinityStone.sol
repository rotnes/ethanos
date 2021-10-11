pragma solidity ^0.8.1;

contract InfinityStone {
    address owner;
    uint price; // price to acquire
    bool state; // true if "ACQUIRED", false if "UNTAKEN"
    bytes32 name;   
    bytes32 color;
    
    /**
     * Creates stone
     */
    constructor(bytes32 _name, bytes32 _color, uint _price) public {
        // change parameters to a struct so only 1 parameter is needed
        name = _name;
        color = _color;
        price = _price;
        state = false;
    }
    
    /**
     * Acquires stone 
     */
    function acquire() public payable returns (bool success) {
        require(!state, "Stone is already taken.");
        require(msg.value >= price, "Transfer value not enough to claim the stone!");
        owner = msg.sender;
        return true;
    }
    
    /**
     * Gives stone away
     */
    function giveAway(address to) public {
        require(state, "Only acquired stones can be given away.");
        require(owner == msg.sender, "Only owner can give away their stones.");
        require(owner != to, "You cannot give the message to yourself.");
        owner = to;
    }
}

contract InfinityGauntlet{
    InfinityStone[] private gauntlet;
    address public owner;
    
    /**
     * Creates gauntlet
     */
    constructor() {
        owner = msg.sender;
    }

    /**
     *  Creates stones?
     */
    function addStones(bytes32 _name, bytes32 _color, uint _price) public returns (InfinityStone stone) {
        stone = new InfinityStone(_name, _color, _price);
        return stone;
    }
    
    /**
     * Acquires stone - calls stone.acquire()
     */
    function acquireStone(InfinityStone stone) public payable {
        if (stone.acquire()) {
            gauntlet.push(stone);   
        }
    }

    /**
     * Gives stone away - calls stone.giveAway()
    */
    function giveAwayStone(InfinityStone stone, address to) public {
        stone.giveAway(to);
    }
   
    /**
     * Creates all stones and acquires them? 
     */
    function snap() public {
        require(owner == msg.sender, "Only owner can snap.");
        bytes32[] storage stones;
        bytes32[] storage colors;
        stones.push('space', 'reality', 'power', 'mind', 'soul', 'time');
        colors.push('blue', 'red', 'green', 'purple', 'yellow', 'pink');
        for (uint i = 0; i < stones.length; i++) {
            InfinityStone stone = addStones(stones[i], colors[i], i * 100);
            owner.call(acquireStone(stone)); // this should be a transaction!
        }
    }
}
