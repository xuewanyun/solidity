/**
题目描述：反转一个字符串。输入 "abcde"，输出 "edcba"
 */

pragma solidity ^0.8.0;

contract ReverseContract {
    function reverser(string memory str) public pure returns (string memory) {
        bytes memory strBytes = bytes(str);

        uint256 len = strBytes.length;

        bytes memory reversed = new bytes(len);

        for (uint256 i = 0; i < len; i++) {
            reversed[i] = strBytes[len - i - 1];
        }

        return string(reversed);
    }
}
