/**
二分查找 (Binary Search)
*/
pragma solidity ^0.8.0;

contract BinarySearchContract {
    function binarySearch(
        int256[] memory sortArray,
        int256 target
    ) public pure returns (int256) {
        int256 left = 0;
        int256 right = int256(sortArray.length) - 1;
        while (left <= right) {
            int256 mid = left + (right - left) / 2;
            if (sortArray[uint256(mid)] == target) {
                return mid;
            } else if (sortArray[uint256(mid)] == target) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }

        return -1;
    }
}
