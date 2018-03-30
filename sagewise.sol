pragma solidity ^0.4.21;

/**
 * @title Sagewise base SDK contract
 * @dev Base contract implements the functions required to protect a smart
 * @dev contract and create a method of handling disputes
 **/
contract Sagewise
{
    address private DRVendor;                       //Dispute resolution vendor address
    bool private DRMode;                            //Are we in dispute mode?
    mapping(address => bool) private DRActivators; //Who can start a dispute?

/**
 * @dev Throws if called by any account other than the DRVendor
 **/
    modifier onlyDRVendor()
    {
        require(msg.sender == DRVendor);
        _;
    }

/**
 * @dev Throws if called and we are not in dispute resolution mode
 **/
    modifier onlyDRMode()
    {
        require(true == DRMode);
        _;
    }

/**
 * @dev Throws if called by anyone but a dr mode activator
 **/
    modifier onlyDRActivator()
    {
        require(true == DRActivators[msg.sender]);
        _;
    }

/**
 * @dev Set the dispute resolution vendor
 **/
    function setDRVendor(
        address _vendorAddress)
        internal
    {
        DRVendor = _vendorAddress;
    }

/**
 * @dev Add party to dispute resolution activation list
 **/
    function addDRActivationParty(
        address _activationAddress)
        internal
    {
        DRActivators[_activationAddress] = true;
    }

/**
 * @dev Remove party from dispute resolution activation list
 **/
    function removeDRActivationParty(
        address _activationAddress)
        internal
    {
        DRActivators[_activationAddress] = false;
    }

/**
 * @dev Throws if called by any account other than the owner.
 **/
    function executeDelegatecall(
        address _target,
        uint256 _suppliedGas,
        bytes _transactionBytecode)
        external onlyDRVendor onlyDRMode
    {
        _target.delegatecall.gas(_suppliedGas)(_transactionBytecode);
    }

    function startDispute()
        external onlyDRActivator
        returns(bool success)
    {
        if (true == DRActivators[msg.sender])
        {
            DRMode = true; //Activate DRMode (freeze contract)
            return true;
        }
        return false;
    }
}