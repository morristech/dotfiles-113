sudo /usr/bin/xcodebuild -license

echo "========== install homebrew"
if ! hash brew 2>/dev/null; then
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "========== brew the world"
source brew_install.sh

echo "========== cask all the things"
source brew_cask_install.sh

echo "========== Ruby global modules"
sudo gem install bundler
sudo bundle install --system

echo "========== node global modules"
npm install -g grunt-cli
npm install -g gulp
npm install -g karma
npm install -g travis
npm install -g yo

npm install -g ijavascript


echo "========== node global modules"
pip install jupyter

echo "========== Java and Groovy"
curl -s get.gvmtool.net | zsh
source "/Users/rb/.gvm/bin/gvm-init.sh"
gvm install groovy
gvm install gradle


echo "========== link files"
while read name; do
    source="$PWD/$name"
    target="$HOME/.$name"

    if [ -h $target ]; then
        rm $target
    elif [ -d $target ]; then
        rm -rf $target
    fi

    ln -s "$source" "$target"
    echo "Linked $source to $target"

done < "$PWD/link-files"

echo "========== configure preferences"
./osx

#echo "========== make bash nicer so I don't use ZSH"
#git clone https://github.com/revans/bash-it.git ~/.bash_it

echo "========== and then give up and install ZSH anyway..."
curl -L http://install.ohmyz.sh | sh
cd ~/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
cd -

echo "========== Check out some useful repos"
mkdir ~/src
cd ~/src
git clone git@github.com:spikeheap/spikeheap.github.io

