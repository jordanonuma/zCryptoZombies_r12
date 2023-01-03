pragma solidity 0.5.0;
import "./EthPriceOracleInterface.sol";
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract CallerContract {
    EthPriceOracleInterface private oracleInstance;
    address private oracleAddress;
    mapping(uint256=>bool) myRequests;
    event newOracleAddressEvent(address oracleAddress);
    event ReceivedNewRequestIdEvent(uint256 id);

    function setOracleInstanceAddress(address _oracleInstanceAddress) public onlyOwner {
        oracleAddress = _oracleInstanceAddress;
        oracleInstance = EthPriceOracleInterface(oracleAddress);
        emit newOracleAddressEvent(oracleAddress);
    } //end function setOracleInstanceAddress()

    function updateEthPrice() public {
        uint256 id = oracleInstance.getLatestEthPrice();
        myRequest[id] = true;
        emit ReceivedNewRequestIdEvent(id);
    } //end function updateEthPrice()
} //end contract CallerContract{}