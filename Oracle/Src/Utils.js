async function getZkSyncProvider (zksync, networkName) {
    let zkSyncProvider
    try {
      zkSyncProvider = await zksync.getDefaultProvider(networkName)
    } catch (error) {
      console.log('Unable to connect to zkSync.')
      console.log(error)
    }
    return zkSyncProvider
} //end function getZkSyncProvider()
  
async function getEthereumProvider (ethers, networkName) {
    let ethersProvider
    try {
        // eslint-disable-next-line new-cap
        ethersProvider = new ethers.getDefaultProvider(networkName)
    } catch (error) {
        console.log('Could not connect to Rinkeby')
        console.log(error)
    }
    return ethersProvider 
} //end function getEthereumProvider()
  
async function initAccount(rinkebyWallet, zkSyncProvider, zksync) {
    const zkSyncWallet = await zksync.Wallet.fromEthSigner(rinkebyWallet, zkSyncProvider)
    return zkSyncWallet
} //end function initAccount()

async function registerAccount (wallet) {
    console.log(`Registering the ${wallet.address()} account on zkSync`)
    
    if (!await wallet.isSigningKeySet()) {
        //checks if account exists on zksync if signing keys have been set
        if (await wallet.getAccountId() === undefined) {
            throw new Error('Unknown account')
        } //end if()
        const changePubKey = await wallet.setSigningKey()
        await changePubKey.awaitReceipt()
    } //end if()
} //end function registerAccount()