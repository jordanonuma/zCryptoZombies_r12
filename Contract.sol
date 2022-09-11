pragma solidity >=0.5.0 <0.6.0;

contract ZombieFactory {
    uint dnaDigits = 16;
    uint dnaModulus = 10**dnaDigits;

    struct zombie {
        string name;
        uint dna;
    } //end struct zombie{}

    Zombie[] public zombies;

    function _createZombie(string memory  _name, uint _dna) private {
        zombies.push(Zombie(_name, _dna));
    } //end function _createZombie()

    function _generateRandomDna(string memory _str) private view returns (uint) {

    } //end function _generateRandomDna()
} //end contract ZombieFactory{}