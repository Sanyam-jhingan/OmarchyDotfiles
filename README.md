On a brand-new Omarchy install, you just do this:

1.    Define the alias:
      alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

2.    Clone your repo:
      git clone --bare git@github.com:YOUR_USERNAME/dotfiles.git $HOME/.cfg

3.    Checkout the files:
      config checkout

Note: If the checkout fails because Omarchy already created default files, just run:
config checkout -f (The -f forces your saved files to overwrite the defaults).
