/**
实现整数转罗马数字
 */

pragma solidity ^0.8.0;

contract IntegerToRomaNumeralContract {
    function integerToRoma(uint256 num) public pure returns (string memory) {
        require(num > 0 && num <= 3999, "Number out of range (1-3999)");
        // 定义罗马数字的范围
        string[13] memory romanNumerals = [
            "M",
            "CM",
            "D",
            "CD",
            "C",
            "XC",
            "L",
            "XL",
            "X",
            "IX",
            "V",
            "IV",
            "I"
        ];
        uint256[13] memory numNumerals = [
            1000,
            900,
            500,
            400,
            100,
            90,
            50,
            40,
            10,
            9,
            5,
            4,
            1
        ];
        bytes memory result = new bytes(0);
        for (uint256 i = 0; i < romanNumerals.length; i++) {
            while (num >= numNumerals[i]) {
                result = abi.encodePacked(result, romanNumerals[i]);
                num -= numNumerals[i];
            }
        }
        return string(result);
    }
}
