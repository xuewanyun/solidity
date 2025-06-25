/**
任务：参考 openzeppelin-contracts/contracts/token/ERC20/IERC20.sol实现一个简单的 ERC20 代币合约。要求：
合约包含以下标准 ERC20 功能：
balanceOf：查询账户余额。
transfer：转账。
approve 和 transferFrom：授权和代扣转账。
使用 event 记录转账和授权操作。
提供 mint 函数，允许合约所有者增发代币。
提示：
使用 mapping 存储账户余额和授权信息。
使用 event 定义 Transfer 和 Approval 事件。
部署到sepolia 测试网，导入到自己的钱包
 */

pragma solidity ^0.8.0;
contract ERC20Contract {
    // 合约名字
    string public name;
    // 合约符合
    string public symbol;
    uint256 public totalSupply;
    // 查询账号余额
    mapping(address => uint256) balances;
    // 给指定账户地址授权地址的余额
    mapping(address => mapping(address => uint256)) public allowances;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    constructor(string memory _name, string memory _symbol) {
        name = _name;
        symbol = _symbol;
    }

    function mint(address _to, uint256 _amount) external {
        totalSupply += _amount;
        balances[_to] += _amount;
        emit Transfer(address(0), _to, _amount);
    }

    function balanceOf(address amount) public view returns (uint256) {
        return balances[amount];
    }
    // 转账
    function transfer(address to, uint256 amount) public returns (bool) {
        require(
            balances[msg.sender] >= amount,
            "transfer amount excedes amount"
        );
        balances[msg.sender] -= amount;
        balances[to] += amount;
        emit Transfer(msg.sender, to, amount);
        return true;
    }
    // 授权
    function approve(address spender, uint256 amount) public returns (bool) {
        allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }
    // 代扣转账
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) public returns (bool) {
        require(allowances[from][msg.sender] >= amount, "amount not enough");
        allowances[from][msg.sender] -= amount;
        balances[from] -= amount;
        balances[to] += amount;
        return true;
    }
}
