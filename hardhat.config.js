require("@nomicfoundation/hardhat-toolbox")
require("dotenv")

module.exports = {
    solidity: "0.8.18",
    defaultNetwork: "hardhat",
    networks: {
        hardhat: {
            chainId: 31337,
            blockConfirmations: 1,
        },
        sepolia: {
            url: "https://eth-sepolia.g.alchemy.com/v2/YOUR-API-KEY",
            accounts: "0xPrivateKey",
            saveDeployments: true,
            chainId: 11155111,
        },
    },
    namedAccounts: {
        deployer: {
            default: 0,
        },
        player: {
            default: 1,
        },
    },
}
