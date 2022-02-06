pragma solidity 0.8.7;

contract vendingMachine {
    // type address public name=owner;
    address public owner;
    // cupcakeBalance is a map{address: uint}
    mapping (address => uint) public cupcakeBalance;

    constructor() {
        owner = msg.sender;
        cupcakeBalance[address(this)] = 100;

    }

    function refill(uint amount) public {
        require (msg.sender == owner, "Only the owner can refill the cupcakes");
        cupcakeBalance[address(this)] += amount;
    }
    
    function purchaseCake(uint amount) public payable {
        require(msg.value >= amount * 1 ether, "You must pay atleast 1 ETH for the cupcake");
        require(cupcakeBalance[address(this)] >= amount, "Not enough cupcakes to execute this action");
        cupcakeBalance[address(this)] -= amount;
        cupcakeBalance[msg.sender] += amount;
    }
}