/**
创建一个名为Voting的合约，包含以下功能：
一个mapping来存储候选人的得票数
一个vote函数，允许用户投票给某个候选人
一个getVotes函数，返回某个候选人的得票数
一个resetVotes函数，重置所有候选人的得票数
 */

pragma solidity ^0.8.0;
contract VotingContract {
    // 候选人票数
    mapping(string => uint256) votes;
    // 候选人列表
    string[] usersList;
    // 投票允许用户投票给某个候选人
    function vote(string memory user) public {
        votes[user]++;
    }
    // 获取某个候选人的票数
    function getVotes(string memory user) public view returns (uint256) {
        return votes[user];
    }
    // 添加候选人列表
    function addUsee(string memory user) public {
        usersList.push(user);
    }
    // 重置所有候选人的得票数
    function resetVotes() public {
        for (uint256 i = 0; i < usersList.length; i++) {
            votes[usersList[i]] = 0;
        }
    }
}
