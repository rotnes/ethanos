# ETHanos 

Thanos is back and he is in the Ethereum universe! He is searching for all 6 infinity stones (space, reality, power, mind, soul and time) on the Ethereum blockchain! Implement a smart contract for ETHanos’ infinity gauntlet and its infinity stones. 
Implement a smart contract InfinityStone. 
The InfinityStone contract has an owner, a name and a color. The stone also has a state which can be ACQUIRED or UNTAKEN. Default state is UNTAKEN. 
The stone can be acquired (acquire()), and whoever acquires it must pay a price (in ETH). In order to be acquired, the stone must have the status UNTAKEN. 
The stone can also be given away (giveAway()). Only the owner can call this function and the stone must have the status ACQUIRED. 
Implement a smart contract for InfinityGauntlet. 
The infinity gauntlet will own all 6 infinity stones and store them on the contract. The contract is in fact able to add stones to the gauntlet (addStones()). 
The contract is also able to acquire a specific stone at the time (acquireStone()) and give away a specific stone at the time (giveAwayStone()) - do not worry about removing the stone from the contract. 
You can also implement a function snap() that runs what you really desire. 
P.S. 
You can pretend that InfinityStone contract has been deployed for each stone and has an interface called IInfinityStone or use the factory pattern 
(https://www.oreilly.com/library/view/ethereum-smart-contract/9781788473040/80292516-2af9-4 1f1-a00c-4bf565579d65.xhtml). 
Please feel free to use any info on the net you might need to solve this, just please let us know 
