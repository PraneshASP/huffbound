 <img align="right" width="150" height="150" top="100" src="./assets/logo.png">

# Huffbound • [![ci](https://github.com/PraneshASP/huffbound/actions/workflows/ci.yaml/badge.svg?branch=main)](https://github.com/PraneshASP/huffbound/actions/workflows/ci.yaml) [![license](https://img.shields.io/badge/Unlicense-blue.svg?label=license)](https://opensource.org/licenses/unlicense) ![solidity](https://img.shields.io/badge/solidity-%3E%3D0.8.13%20%3C0.9.0-lightgrey)

<h3>

A **Soulbound** token implementation using [**Huff**](https://docs.huff.sh).

</h3>
 
## What?

In a nutshell, **Soulbound** tokens are non-transferrable NFTs. According to [Vitalik](https://vitalik.ca/general/2022/01/26/soulbound.html), A soulbound item, once picked up, cannot be transferred or sold to another account.While transferable NFTs have their place and can be really valuable on their own for supporting artists and charities, there is also a large and underexplored design space of what non-transferable NFTs could become.

## How does it work?

Simple. During the deployment (scripts soon, wip) the `name`, `symbol`, `tokenURI` and the `owner` address are passed. So the token is now bound to the `owner` wallet. The owner cannot transfer or approve this token. It will be tied to the `owner` wallet forever.

## Getting Started

### Requirements

The following will need to be installed in order to use this repo. Please follow the links and instructions.

- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  - You'll know you've done it right if you can run `git --version`
- [Foundry / Foundryup](https://github.com/gakonst/foundry)
  - This will install `forge`, `cast`, and `anvil`
  - You can test you've installed them right by running `forge --version` and get an output like: `forge 0.2.0 (f016135 2022-07-04T00:15:02.930499Z)`
  - To get the latest of each, just run `foundryup`
- [Huff Compiler](https://docs.huff.sh/get-started/installing/)
  - You'll know you've done it right if you can run `huffc --version` and get an output like: `huffc 0.2.0`

### Quickstart

1. Clone this repo:

```
git clone https://github.com/PraneshASP/huffbound
cd huffbound
```

2. Install dependencies

Once you've cloned and entered into your repository, you need to install the necessary dependencies. In order to do so, simply run:

```shell
forge install
```

3. Build & Test

To build and test your contracts, you can run:

```shell
forge build
forge test
```

4. Deployment

Create a `.env` file and copy the contents of `.env.examples` to it.
Update the fields with relanvant values.

To proceed with the deployment, run the following command...

```shell
source .env

forge script scripts/Deploy.s.sol:Deploy --fork-url $INFURA_URL --private-key $PRIVATE_KEY --broadcast
```

For more information on how to use Foundry, check out the [Foundry Github Repository](https://github.com/foundry-rs/foundry/tree/master/forge) and the [foundry-huff library repository](https://github.com/huff-language/foundry-huff).

## Blueprint

```ml
lib
├─ forge-std — https://github.com/foundry-rs/forge-std
├─ foundry-huff — https://github.com/huff-language/foundry-huff
scripts
├─ Deploy.s.sol — Deployment Script [WIP]
src
├─interfaces
    └─ IHuffbound.sol - The Huffbound interface for tests
└─ Soulbound.huff — The Huffbound contract
test
└─ Soulbound.t.sol — Unit tests and Fuzz tests for the contract
```

## License

[The Unlicense](https://github.com/PraneshASP/huffbound/blob/master/LICENSE)

## Acknowledgements

- [foundry-huff-template](https://github.com/huff-language/huff-project-template)
- [OneOfOne](https://github.com/wschwab/one-of-one)
- [Huffmate](https://github.com/pentagonxyz/huffmate)

## TODO

- [x] Deploy script
- [ ] Implement `supportsInterface()`
- [ ] Fix token_uri storage
- [ ] Integrate ENS

## Disclaimer

_These smart contracts are being provided as is. No guarantee, representation or warranty is being made, express or implied, as to the safety or correctness of the user interface or the smart contracts. They have not been audited and as such there can be no assurance they will work as intended, and users may experience delays, failures, errors, omissions, loss of transmitted information or loss of funds. The creators are not liable for any of the foregoing. Users should proceed with caution and use at their own risk._
