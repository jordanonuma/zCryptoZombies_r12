pragma solidity >=0.5.0 <0.6.0;
import "./ZombieAttack.sol";
import "./ERC721.sol";

//@title - contract managing zombie ownership
//@author - student of cryptozombies
//@dev - uses OpenZeppelin's draft of ERC721 spec

contract ZombieOwnership is ZombieAttack, ERC721 {
    mapping (uint => address) zombieApprovals;

    function balanceOf(address _owner) external view returns (uint256) {
        return ownerZombieCount[_owner];
    } //end function balanceOf()

    function ownerOf(uint256 _tokenId) external view returns (address) {
        return zombieToOwner[_tokenId];
    } //end function ownerOf()

    function _transfer(address _from, address _to, uint256 _tokenId) private {
        ownerZombieCount[_to] = ownerZombieCount[_to].add(1);
        ownerZombieCount[_from] = ownerZombieCount[_from].sub(1);
        zombieToOwner[_tokenId] = _to;
        emit Transfer(_from, _to, _tokenId);
    } //end function _transfer()

    function transferFrom(address _from, address _to, uint256 _tokenId) external payable {
        require(zombieToOwner[_tokenId] == msg.sender || zombieApprovals[_tokenId] == msg.sender);
    _   _transfer(_from, _to, _tokenId);
    } //end function transferFrom()

    function approve(address _approved, uint256 _tokenId) external payable onlyOwnerOf(_tokenId) {
        zombieApprovals[_tokenId] = _approved;
        emit Approval(msg.sender, _approved, _tokenId);
    } //end function approve()
} //end contract ZombieOwnership{}