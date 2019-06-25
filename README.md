dotfiles
========

Miscellaneous settings files I use across systems. Mostly OSX-specific.

# To get up and running

From a fresh OSX install:

- Generate an SSH key with `ssh-keygen`.
  - Copy the generated key with `cat .ssh/id_rsa.pub | pbcopy`.
- Add that SSH key to your [GitHub SSH keys](https://github.com/settings/keys).
- Clone this repo with:
  - `mkdir src && cd src` 
  - `git clone git@github.com:spikeheap/dotfiles` (and install XCode tools while you're at it).
- In the repo run `./_bootstrap.sh`.

After that you'll probably want to do a couple of manual tasks:

1. Install your purchased software from the App Store.
2. Enable your mail accounts in Settings -> Internet Accounts.

# Thanks

A lot of the auto-brewing has been stolen gratuitously from [George Hickman](https://github.com/ghickman/dotfiles). Cheers!
