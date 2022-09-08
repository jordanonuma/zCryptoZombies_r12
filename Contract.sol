pragma solidity >=0.5.0 <0.6.0;

contract ZombieFactory {
    uint dnaDigits = 16;
    uint dnaModulus = 10**dnaDigits;

    struct zombie {
        string name;
        uint dna;
    } //end struct zombie{}

    Zombie[] public zombies;

    function createZombie(string memory  _name, uint _dna) public {

    } //end function createZombie()
} //end contract ZombieFactory{}