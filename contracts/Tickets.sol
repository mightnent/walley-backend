// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0;

contract Ticket {
    uint256 ticketPrice = 0.01 ether;
    address owner;
    mapping(address => uint256) public ticketHolders;

    constructor(){
        owner = msg.sender;
    }

    function buyTicket(address _user, uint256 _amt) payable public {
        require(msg.value >= ticketPrice * _amt);
        addTickets(_user,_amt);
    }

    function useTicket(uint256 _amt) public {
        subTickets(_amt);
    }

    function addTickets(address _user, uint256 _amt) internal {
        ticketHolders[_user] = ticketHolders[_user] + _amt;
    }

    function subTickets(uint256 _amt) internal {
        require(msg.sender == owner, "You are not the owner");
        require(ticketHolders[owner]>=_amt, "You do not have enough tickets!");
        ticketHolders[owner] = ticketHolders[owner] - _amt;
    }

    function withdraw() public {
        require(msg.sender == owner, "You are not the owner");
        (bool success, ) = payable(owner).call{value:address(this).balance}("");
        require(success);
    }
}