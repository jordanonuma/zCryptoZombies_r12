pragma solidity >=0.5.0 <0.6.0;

contract ZombieFactory {
    uint dnaDigits = 16;
    uint dnaModulus = 10**dnaDigits;
    event NewZombie(uint zombieId, string name, uint dna);

    struct zombie {
        string name;
        uint dna;
    } //end struct zombie{}

    Zombie[] public zombies;

    mapping (uint => address) public zombieToOwner;
    mapping (address => uint) public ownerZombieCount;

    function _createZombie(string memory  _name, uint _dna) private {
        uint id = zombies.push(Zombie(_name, _dna)) - 1;
        emit NewZombie(id, _name, _dna);
    } //end function _createZombie()

    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    } //end function _generateRandomDna()
} //end contract ZombieFactory{}