//SPDX-License-Identifier: MIT
pragma solidity <0.9.0;

contract SmartWallet {
    address public owner;
    uint public balanceReceived;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner , "Only Owner can access!");
        _;
    }


    function deposit() public payable onlyOwner {
        balanceReceived = msg.value;
    }

    function withdrawToAddress (address payable _to) public {
        _to.transfer(getContractBalance());
    }

    function withdrawAll()public{
        address payable to = payable(msg.sender);
        to.transfer(getContractBalance());
    }

    function getBalance() public view returns(uint){
        return address(msg.sender).balance;
    }

    function getContractBalance() public view onlyOwner returns(uint){
        return address(this).balance;
    }
    
}