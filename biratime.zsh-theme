# ZSH Theme

# Display the latest error status in the right prompt:
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

function conda_info {
    if [[ -n "$CONDA_DEFAULT_ENV" ]]; then
        echo "%{$fg[green]%} <${CONDA_DEFAULT_ENV}>%{$reset_color%}"
    fi
}
local conda='$(conda_info)'

# If user 1000 use blue and dont display user@hostname infos
# If root or other users use red
if [[ $UID -eq 1000 ]]; then
    # Use blue for main user, usually your personal laptop
    local user_color='blue'
    local user_host='%{$reset_color%}'
    local user_symbol='$'
elif [[ $UID -eq 0 ]]; then
    # When logged as root user
    local user_color='red'
    local user_host=' %{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
    local user_symbol='#'
else
    # Use red for servers where you are not the main user
    local user_color='red'
    local user_host=' %{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
    local user_symbol='$'
fi

local current_dir='%{$reset_color$terminfo[bold]%} %~ %{$reset_color%}'
# local current_dir='%{$terminfo[bold]$fg[blue]%} %~%{$reset_color%}'

# To get the number of commit ahead: $(git_commits_ahead)
local git_branch='$(git_prompt_info)$(git_remote_status)%{$reset_color%}'
local rvm_ruby='$(ruby_prompt_info)'
local venv_prompt='$(virtualenv_prompt_info)'


ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# If git branch clean
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg_bold[green]%}✔"
# If this branch is dirty
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[red]%}✗"
# A little cloud when remote is behind
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE=" %{$fg[blue]%}⛅️"
# ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE=" %{$fg[blue]%}☁️"
# ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE=" %{$fg[blue]%}☁"

ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg[red]%}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="› %{$reset_color%}"
ZSH_THEME_RVM_PROMPT_OPTIONS="i v g"

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX=" %{$fg[green]%}"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX=" %{$reset_color%}"
ZSH_THEME_VIRTUALENV_PREFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX
ZSH_THEME_VIRTUALENV_SUFFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX

PROMPT="╭─$fg[$user_color]%T${user_host}${current_dir}${rvm_ruby}${git_branch}${venv_prompt}${conda}
╰─%B${user_symbol}%b "

# Add timer in the right prompt
function preexec() {
  timer=${timer:-$SECONDS}
}
function precmd() {
  if [ $timer ]; then
    timer_show=$(($SECONDS - $timer))
    export RPROMPT="%F{cyan}${timer_show}s %{$reset_color%}"
    unset timer
  fi
}
# RPROMPT="%B${return_code}%b"


# function venv_info {
#     if [[ -n "$VIRTUAL_ENV" ]]; then
#         echo "%{$fg[green]%}‹${VIRTUAL_ENV:t}›%{$reset_color%}"
#     fi
# }
# local venv='$(venv_info)'
