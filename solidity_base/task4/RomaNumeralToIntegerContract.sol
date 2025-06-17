/**
实现罗马数字转数整数
 */
pragma solidity ^0.8.0;
contract RomaNumeralToIntegerContract {
    mapping(bytes1 => uint256) private romanValues;
    constructor() {
        romanValues["I"] = 1;
        romanValues["V"] = 5;
        romanValues["X"] = 10;
        romanValues["L"] = 50;
        romanValues["C"] = 100;
        romanValues["D"] = 500;
        romanValues["M"] = 1000;
    }
    function romaNumeralToInteger(
        string memory roman
    ) public view returns (uint256 num) {
        bytes memory romanBytes = bytes(roman); // 将字符串转换为字节数组
        uint256 total = 0;
        uint256 prevValue = 0;

        for (uint256 i = 0; i < romanBytes.length; i++) {
            uint256 currentValue = romanValues[romanBytes[i]];

            // 如果当前值大于前一个值，则减去前一个值并加上当前值
            if (currentValue > prevValue) {
                total += currentValue - 2 * prevValue;
            } else {
                total += currentValue;
            }

            prevValue = currentValue;
        }

        return total;
    }
}
