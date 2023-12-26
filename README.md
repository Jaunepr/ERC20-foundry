# Foundry ERC20 EXAMPLE

## Getting Started
### Requirments
- git
    - You'll know you did it right if you can run ```git --version``` and you see a response like ```git version x.x.x```
- foundry
    - You'll know you did it right if you can run ```forge --version``` and you see a response like ```forge 0.2.0 (7b45265 2023-11-21T00:22:00.899582254Z))```

### Quickstart
```
git clone https://github.com/Jaunepr/ERC20-foundry
cd foundry-erc20-f23
forge install 
forge build
```

## Usage
### OpenZeppelin
#### Install OpenZeppelin Contracts Package
```forge install OpenZeppelin/openzeppelin-contracts --no-commit```
### Start a local node
```make anvil```
### Deploy
This will default to your local node. You need to have it running in another terminal in order for it to deploy.
```make deploy```
### Test
```forge test```