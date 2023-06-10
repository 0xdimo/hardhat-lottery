// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";
// import "@chainlink/contracts/src/v0.8/VRFV2WrapperConsumerBase.sol";

error Raffle__NotEnoughETHEntered();

contract Raffle {
    //State variables
    uint256 private immutable i_entranceFee;
    address payable[] private s_players;

    //Events
    event RaffleEnter(address indexed player); //indexed will be searched easier later

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    function enterRaffle() public payable {
        if (msg.value < i_entranceFee) {
            revert Raffle__NotEnoughETHEntered();
        }
        s_players.push(payable(msg.sender)); //type cast to payable, so we can push sender
        emit RaffleEnter(msg.sender);
    }

    function requestRandomWinner() external {}

    function fulfillRandomWords() external override {}

    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }

    function getPlayer(uint256 index) public view returns (address) {
        return s_players[index];
    }
}
