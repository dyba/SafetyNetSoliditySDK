# SafetyNetSoliditySDK
Sagewise Base Contract SDK for building Solidity contracts with a safety net

Contents:

sagewise.sol - Our base SDK contract

Usage:

-Inherit from the sagewise.sol contract
-Define in your contract constructor the DR Vendor Address you wish to use
-Define in your contract constructor or other appropriate functions who can activate a dispute
-Use the onlyDRMode modifier on any functions you want to freeze when in DR mode

TODO:

-Add examples
-Additional base contract Features to be announced
-Additional testing and audits