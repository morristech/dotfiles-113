### rbenv
# use this until rbenv plugin is in better shape
# see https://github.com/robbyrussell/oh-my-zsh/pull/1118
export PATH="./bin:$HOME/.rbenv/bin:$PATH"

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@github.com'

# Set my editor and git editor
export EDITOR="/usr/local/bin/subl"
export GIT_EDITOR='vim'

#export GIT_TEMPLATE_DIR=`/Users/rb/.rbenv/shims/overcommit --template-dir`

export TODO="t"

# Install casks to /Applications 
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

function gitup() {
	TMP_INITIAL_BRANCH=`git rev-parse --abbrev-ref HEAD`
	git checkout master && git pull
	git checkout develop && git pull 
	git checkout ${TMP_INITIAL_BRANCH}
}

function push-release() {
  TMP_INITIAL_BRANCH=`git rev-parse --abbrev-ref HEAD`
  OVERCOMMIT_DISABLE=1 git co master && git push
  OVERCOMMIT_DISABLE=1 git co develop && git push 
  OVERCOMMIT_DISABLE=1 git push --tags
  git co ${TMP_INITIAL_BRANCH}
}

# Allow docker to connect to Minikube
#eval $(minikube docker-env)

# Useful aliases
alias dc="docker-compose"
alias dcrun="docker-compose run --rm"
alias pad="dcrun padrino bundle exec padrino"
alias prake="dcrun padrino bundle exec padrino rake"
alias brspec="dcrun -e RACK_ENV=test padrino bundle exec rspec"
alias be="dcrun padrino bundle exec"
alias migrations="dcrun padrino bundle exec rake ar:migrate && dcrun -e RACK_ENV=test padrino  bundle exec rake ar:reset"
alias clean_test="dcrun -e RACK_ENV=test padrino bundle exec padrino rake ar:reset"
alias dgulp="docker-compose run --rm -w /growkudos/client padrino ../node_modules/.bin/gulp"

alias wakeimac="wakeonlan -i 46.227.149.240 -p 38755 38:c9:86:1b:dc:a1"
eval `/usr/libexec/path_helper -s`

