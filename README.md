# SafetyNetSoliditySDK
## Sagewise Solidity Safety Net Smart Contract SDK base contract

This is an alpha preview. Please only use in test contracts.

## Contributing

To contribute, read the [contributing documentation](docs/contributing.md)

# Overview

At Sagewise we are building a collection of services that will bring more confidence and better usability to smart contracts. Sagewise Solidity Safety Net Smart Contract SDK is one of those services. This alpha SDK shows a method of adding contract freeze protections onto a smart contract with a very small footprint along with delegation of dispute handling to a neutral third party who is given contract admin access. The reasons that a contracting party may wish to freeze a smart contract include the following:

* Bugs
* Bad data feeds
* Exploits
* Unforeseen circumstances

On its own, we believe that this SDK is helpful, but becomes much more powerful when used in conjunction with the other tools we are building. Those tools are as follows:

* A marketplace of dispute resolution vendors to choose from
* Contract Canary real time email notifications about relevant transactions pertaining to a given smart contract (please get in touch if you want to be on the beta list for this. It's running now)
* GUI interface tools to simplify selection of vendors, contract configuration, and the dispute process

# Current release features and goals

We highly value community involvement and for this reason we have brought an early alpha to market in order to help facilitate a discussion around smart contract safety. We are not putting this out with the recommendation that people employ it on live contracts, but rather that they test it out, and give us feedback.

In addition to our goals of seeking community feedback, we believe that the standardization of this type of safety net code could better serve users in the space. Many existing contracts currently published to the Ethereum blockchain contain backdoors where the contract creator can unilaterally make changes. In many cases this represents a conflict of interest and fundamentally destroys any of the immutability mechanics of the overall smart contract.

We are suggesting a hybrid approach by which the contract creator may have access along with other contracting parties to trigger the dispute mode, but these parties do not have control over the dispute process. Likewise, the dispute resolution vendor does not have admin access unless the dispute mode is triggered by a contracting party. It is this shared control that provides accountability over the contract from the creator's unilateral powers while still providing a way to resolve contract issues that may arrise.

In this alpha state the contract functionality is limited to one contract freeze. Once the contract is frozen, it cannot be unfrozen, but can be liquidated of any assets by the dispute resolution vendor through a delegatecall function. In the future we will explore allowing the contract to return to a normal state. Our reason for not focusing on this type of functionality now is that we believe if the dispute mode was active, there may be a need to rewrite the contract to make it more robust and thus, keeping it active will not be useful. While it is possible to create upgradeable contracts using proxy delegatecall functions, gas costs on the network make this disadvantageous in many cases.

This release does a few key things:

1. Demonstrates how a contract can easily be frozen while in dispute resolution mode using function modifiers
2. Demonstrates the basic access control mechanism that limits the powers of contracting parties and the dispute vendor based on the current contract state.
3. Gives admin mode access via delegatecall to a smart contract dispute resolution vendor assigned to a contract.

# Usage and Technical Details

Contents:

source/sagewise.sol -- Our base SDK contract

examples/ -- example contracts implementing the sagewise base contract

Usage:

* Inherit from the sagewise.sol Sagewise contract
* Define in your contract constructor the DR Vendor Address you wish to use
* Define in your contract constructor or other appropriate functions who can activate a dispute
* Use the notDRMode modifier on any functions you want to freeze when in DR mode -- this is especially important for function calls listed in the contract ABI

TODO:

* Add more examples
* Additional base contract features to be announced
* Additional testing and external code audits

Any feedback or bug reports are appreciated and can be sent to dan@sagewise.io
