/**
合并两个有序数组 (Merge Sorted Array)
 */

pragma solidity ^0.8.0;
contract MergeArrayContract {
    function mergeSortArray(
        uint256[] memory arr1,
        uint256[] memory arr2
    ) public pure returns (uint256[] memory) {
        uint256 len1 = arr1.length;
        uint256 len2 = arr2.length;
        uint256[] memory mergeArray = new uint256[](len1 + len2);

        uint256 i = 0;
        uint256 j = 0;
        uint256 k = 0;

        while (i < arr1.length && j < arr2.length) {
            if (arr1[i] <= arr2[j]) {
                mergeArray[k] = arr1[i];
                i++;
            } else {
                mergeArray[k] = arr2[j];
                j++;
            }
            k++;
        }

        while (i < len1) {
            mergeArray[k] = arr1[i];
            i++;
            k++;
        }

        while (j < len2) {
            mergeArray[k] = arr2[j];
            j++;
            k++;
        }
        return mergeArray;
    }
}
