pragma solidity ^0.4.21;

import "../../source/sagewise.sol";

contract mortal is Sagewise {
    /* Define variable owner of the type address */
    address public owner;

    /* This function is executed at initialization and sets the owner of the contract */
    function mortal() public notDRMode { owner = msg.sender; }

    /* Function to recover the funds on the contract */
    function kill() public notDRMode { if (msg.sender == owner) selfdestruct(owner); }
}

contract greeter is mortal {
    /* Define variable greeting of the type string */
    string public greeting;
    
    /* This runs when the contract is executed */
    function greeter(string _greeting) public notDRMode {
        greeting = _greeting;
        setDRVendor(0x0000000000000000000000000000000000000000);//replace with vendor address
        addDRActivationParty(0x0000000000000000000000000000000000000001);//party A address
        addDRActivationParty(0x0000000000000000000000000000000000000002);//party B address
    }

    /* Main function */
    function greet() public notDRMode constant returns (string) {
        return greeting;
    }
}