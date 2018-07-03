# Contributing

## Setup

Download the package manager [asdf](https://github.com/asdf-vm/asdf) and update your shell profile.

Assuming you've installed [Homebrew](https://brew.sh/), download Node JS:

``` bash
brew install coreutils gpg
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install nodejs 8.10.0
```

Move to the directory in which you've clone this repository and set the version of Node for this project:

``` bash
asdf local nodejs 8.10.0
asdf reshim nodejs 8.10.0
```

Next, install [Truffle](https://truffleframework.com/):

``` bash
npm install -g truffle ganache-cli
asdf reshim nodejs 8.10.0
```

## Testing

To run tests:

``` bash
truffle test
```

For more on truffle assertions, see [Assert.sol](https://github.com/trufflesuite/truffle/blob/develop/packages/truffle-core/lib/testing/Assert.sol)
