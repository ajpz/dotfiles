parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}
export -f parse_git_branch

run_loop() {
  /* trap "exit" INT */
  for i in {1..10}; do $1; done
}

 [[ -r "$(brew --prefix git)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix git)/etc/profile.d/bash_completion.sh"

export CLICOLOR=1
export PS1="\[\e[01;36m\]\w \[\e[00;33m\]\$(parse_git_branch)\[\e[00;37m\]\$ "
export LSCOLORS=ExFxCxDxBxegedabagacad
export HISTCONTROL=ignoredups
export HISTFILESIZE=5000

alias be="bundle exec"
alias editaliases="vim ~/.bash_profile && reload"
alias esl="node node_modules/eslint/bin/eslint.js"
alias fixdb="rake db:fix"
alias gitprune="git remote prune origin && git prune"
alias gogogo="gpr && bundle && yarn install && rake db:migrate db:test:prepare"
alias got=git
alias gpr="git fetch && git rebase origin/master"
alias gtx=gitx
alias gut=git
alias heroky=heroku
alias ht="cd ~/workspace/hightower"
alias vts="cd ~/workspace/viewthespace"
alias bi="cd ~/workspace/bi"
alias workspace="cd ~/workspace/"
alias ll="ls -alh"
alias loopy=run_loop
alias reload=". ~/.bash_profile"
alias server="foreman start -f Procfile.dev"
alias shutupvim="rm /var/tmp/*.swp"
alias wp="./node_modules/.bin/webpack-dev-server --config config/webpack/development.config.js --content-base frontend --host 0.0.0.0"
alias z="zeus rspec"
alias zake="zeus rake"
alias zerver="zeus s"
alias zonsole="zeus c"
alias zspec="zeus rspec"
alias gsa="git submodule add"
alias gca="git commit --amend --no-edit"
alias vcli="op run -- vcli"

if [ -f ~/.profile ]; then
  . ~/.profile
fi

if [ -f ~/.bash_profile.local ]; then
  . ~/.bash_profile.local
fi

export GITHUB_TOKEN="op://Personal/GitHub VCLI Personal Access Token/token"

# terraform -install-autocomplete

complete -C /usr/local/bin/terraform terraform

eval "$(rbenv init -)"
eval "$(nodenv init -)"
