/**
创建一个名为Voting的合约，包含以下功能：
一个mapping来存储候选人的得票数
一个vote函数，允许用户投票给某个候选人
一个getVotes函数，返回某个候选人的得票数
一个resetVotes函数，重置所有候选人的得票数
 */

pragma solidity ^0.8.0;
contract VotingContract {
    mapping(string => uint256) votes;

    function vote(string memory user) public {
        votes[user]++;
    }

    function getVotes(string memory user) public view returns (uint256) {
        return votes[user];
    }

    function resetVotes() public {}
}
