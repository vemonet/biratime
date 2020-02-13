# ZSH Theme

# Display the latest error status in the right promp:
#local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
# To display user host
#if [[ $UID -eq 0 ]]; then
#    local user_host='%{$terminfo[bold]$fg[red]%}%n@%m%{$reset_color%}'
#else
#    local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
#fi

local current_dir='%{$terminfo[bold]$fg[blue]%} %~%{$reset_color%}'

# Display ruby version:
#local rvm_ruby=''
#if which rvm-prompt &> /dev/null; then
#  rvm_ruby='%{$fg[red]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
#else
#  if which rbenv &> /dev/null; then
#    rvm_ruby='%{$fg[red]%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
#  fi
#fi

# If git branch clean
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg_bold[green]%}✔"
# If this branch is diiirrrty! Dirty branch!
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[red]%}✗"
# A little cloud when remote is behind
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE=" %{$fg[blue]%}☁"

# To get the number of commit ahead: $(git_commits_ahead)
local git_branch='$(git_prompt_info)$(git_remote_status)%{$reset_color%}'

# Old prompt:
#PROMPT="╭─${user_host} ${current_dir} ${rvm_ruby} ${git_branch}
#╰─%B$%b "

# Prompt display Time, current dir and git infos
PROMPT="╭─$fg[blue]%T${current_dir} ${git_branch}
╰─%B$%b "

RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}"
#ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"

ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$fg[yellow]%}›"
