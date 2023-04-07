# Scaffold-Eth 2 Foundry

 > Develop with the power of foundry, deploy with the ease of truffle & verify with the simplicity of hardhat

⚠️ This project is currently under active development. Things might break. Feel free to check the open issues & create new ones.

Scaffold-Eth 2 Foundry is an open-source toolkit for building decentralized applications (dapps) on the Ethereum blockchain. It's designed to make it easier for developers to create and deploy smart contracts and build user interfaces that interact with those contracts.

It's a new version of scaffold-eth with its core functionality. Built using NextJS, RainbowKit, Hardhat, Foundry, Wagmi and Typescript.

- ✅ **Contract Hot Reload**: Your frontend auto-adapts to your smart contract as you edit it.
- 🔥 **Burner Wallet & Local Faucet**: Quickly test your application with a burner wallet and local faucet.
- 🔐 **Integration with Wallet Providers**: Connect to different wallet providers and interact with the Ethereum network.

## TODO

- [x] Integrate foundry
- [x] Add truffle dashboard
- [ ] generateTsABIs from foundry ```out``` folder

## Contents

- [Scaffold-Eth 2 Foundry](#scaffold-eth-2-foundry)
  - [TODO](#todo)
  - [Contents](#contents)
  - [Requirements](#requirements)
  - [Quickstart](#quickstart)
  - [Deploying your Smart Contracts to a Live Network](#deploying-your-smart-contracts-to-a-live-network)
  - [Deploying your NextJS App](#deploying-your-nextjs-app)
  - [Disabling type and linting error checks](#disabling-type-and-linting-error-checks)
    - [Disabling commit checks](#disabling-commit-checks)
    - [Deploying to Vercel without any checks](#deploying-to-vercel-without-any-checks)
    - [Disabling Github Workflow](#disabling-github-workflow)
  - [Contributing to Scaffold-Eth 2](#contributing-to-scaffold-eth-2)

## Requirements

Before you begin, you need to install the following tools:
- [Node (v18 LTS)](https://nodejs.org/en/download/)
- Yarn ([v1](https://classic.yarnpkg.com/en/docs/install/) or [v2+](https://yarnpkg.com/getting-started/install))
- [Git](https://git-scm.com/downloads)
- [Rust](https://rustup.rs/)
- [Foundry](https://book.getfoundry.sh/getting-started/installation)


## Quickstart

To get started with Scaffold-Eth 2, follow the steps below:

1. Clone this repo & install dependencies

```
git clone git@github.com:0xSooki/se-2-foundry.git
cd se-2
yarn install
```

2. Run a local network in the first terminal:

```
anvil
```

or

```
yarn chain
```

This command starts a local Ethereum network using Foundry. The network runs on your local machine and can be used for testing and development. You can customize the network configuration in the `Makefile`.

3. On a second terminal, deploy the test contract:

```
yarn deploy 
```

This command deploys a test smart contract to the local network. The contract is located in `packages/hardhat/contracts` and can be modified to suit your needs. The `yarn deploy` command uses the deploy script located in `packages/hardhat/deploy` to deploy the contract to the network. You can also customize the deploy script.

4. On a third terminal, start your NextJS app:

```
yarn start
```

Visit your app on: `http://localhost:3000`. You can interact with your smart contract using the contract component or the example ui in the frontend. You can tweak the app config in `packages/nextjs/scaffold.config.ts`.

Run smart contract test with `yarn hardhat:test`

- Edit your smart contract `YourContract.sol` in `packages/hardhat/contracts`
- Edit your frontend in `packages/nextjs/pages`
- Edit your deployment scripts in `packages/hardhat/deploy`

## Deploying your Smart Contracts to a Live Network
Once you are ready to deploy your smart contracts, there are a few things you need to adjust.

1. Select the network

Instead of ```yarn deploy``` we will be using ```yarn tdeploy``` where the t stands for truffle as we will be using the truffle dashboard for deploying our contracts. You can change the defaultNetwork in `packages/hardhat/hardhat.config.ts.`

Check the `hardhat.config.ts` for the networks that are pre-configured. You can also add other network settings to the `hardhat.config.ts file`. Here are the [Alchemy docs](https://docs.alchemy.com/docs/how-to-add-alchemy-rpc-endpoints-to-metamask) for information on specific networks.

2. Start a truffle dashboard using the following command:

```
yarn dashboard
```

This will start the truffle dashboard where we will be able to deploy our smart contracts without having to copy our private keys anywhere. Run the command below to send the deployment request to our dashboard

```
yarn tdeploy
```

This will run our hardhat deploy scripts & forward it to the dasboard for additional signatures. The deployer account (the one with you sign in the truffle dashboard) is the account that will deploy your contracts. Additionally, the deployer account will be used to execute any function calls that are part of your deployment script.

3. Verify your smart contract

You can verify your smart contract on Etherscan by running:

```
yarn verify --network network_name <CONTRACT_ADDRESS> <CONSTRUCTOR_ARGS>
```

## Deploying your NextJS App

Run `yarn vercel` and follow the steps to deploy to Vercel. Once you log in (email, github, etc), the default options should work. It'll give you a public URL.

If you want to redeploy to the same production URL you can run `yarn vercel --prod`. If you omit the `--prod` flag it will deploy it to a preview/test URL.

**Make sure your `packages/nextjs/scaffold.config.ts` file has the values you need.**

**Hint**: We recommend connecting the project GitHub repo to Vercel so you the gets automatically deployed when pushing to `main`

## Disabling type and linting error checks
> **Hint**
> Typescript helps you catch errors at compile time, which can save time and improve code quality, but can be challenging for those who are new to the language or who are used to the more dynamic nature of JavaScript. Below are the steps to disable type & lint check at different levels

### Disabling commit checks
We run `pre-commit` [git hook](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks) which lints the staged files and don't let you commit if there is an linting error.

To disable this, go to `.husky/pre-commit` file and comment out `yarn lint-staged --verbose`

```diff
- yarn lint-staged --verbose
+ # yarn lint-staged --verbose
```

### Deploying to Vercel without any checks
Vercel by default runs types and lint checks while developing `build` and deployment fails if there is a types or lint error.

To ignore types and lint error checks while deploying, use :
```shell
yarn vercel:yolo
```

### Disabling Github Workflow
We have github workflow setup checkout `.github/workflows/lint.yaml` which runs types and lint error checks every time code is __pushed__ to `main` branch or __pull request__ is made to `main` branch

To disable it, **delete `.github` directory**

## Contributing to Scaffold-Eth 2

We welcome contributions to Scaffold-Eth 2 Foundry!

Please see [CONTRIBUTING.MD](https://github.com/scaffold-eth/se-2/blob/master/CONTRIBUTING.md) for more information and guidelines for contributing to Scaffold-Eth 2.
