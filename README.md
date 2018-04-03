# SafetyNetSoliditySDK
Sagewise base contract SDK for building Solidity contracts with a safety net

This is an alpha preview. Please only use in test contracts. We built this specifically to provide a preview of our overall approach to creating a contract safety net.

Contents:

source/sagewise.sol -- Our base SDK contract

examples -- example contracts implementing the sagewise base contract

Usage:

* Inherit from the sagewise.sol Sagewise contract
* Define in your contract constructor the DR Vendor Address you wish to use
* Define in your contract constructor or other appropriate functions who can activate a dispute
* Use the notDRMode modifier on any functions you want to freeze when in DR mode

TODO:

* Add more examples
* Additional base contract features to be announced
* Additional testing and external code audits

Any feedback or bug reports are appreciated and can be sent to dan@sagewise.io