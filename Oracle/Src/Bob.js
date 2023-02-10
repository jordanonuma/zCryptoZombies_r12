(async () => {
    const ethers = require('ethers')
    const zksync = require('zksync')
    const utils = require('./utils')
  
    const zkSyncProvider = await utils.getZkSyncProvider(zksync, process.env.NETWORK_NAME)
    const ethersProvider = await utils.getEthereumProvider(ethers, process.env.NETWORK_NAME)
  
    const bobRinkebyWallet = new ethers.Wallet(process.env.BOB_KEY, ethersProvider)
    console.log(`Bob's Rinkeby address is: ${bobRinkebyWallet.address}`)
    const bobZkSyncWallet = await utils.initAccount(bobRinkebyWallet, zkSyncProvider, zksync)
    
})
  