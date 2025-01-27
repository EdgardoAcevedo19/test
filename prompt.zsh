# ESTILO DE LA TERMINAL 
PROMPT='%F{#ff00ff}%n%f@%F{#00ffff}%M%f:${vcs_info_msg_0_}{%F{#ff00ff}%!%f}[%F{yellow}%D{%A, %d-%m-%Y %H:%M}%f] 
%B└─[%B%(?.%F{green}√.%F{red}✗)%f](%B%F{240}%2~%f)%b $ '
RPROMPT=''
echo -e -n "\x1b[\x31 q" # Blinking
#echo -e -n "\x1b[\x32 q" # Steady
#echo -e -n "\x1b[\x33 q" # Blinking
#echo -e -n "\x1b[\x34 q" # Steady
#echo -e -n "\x1b[\x35 q" # Blinking
echo -e -n "\x1b[\x36 q" # Steady

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{gray}%s%f-%r%F{240}(%F{red}%b%f)%f'
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:git*' actionformats '%F{gray}%s%f-%r⏱️  %F{240}(%F{red}%b%f)%f'
zstyle ':vcs_info:git*' unstagedstr '*'
zstyle ':vcs_info:git*' stagedstr '*'
zstyle ':vcs_info:*:*' check-for-changes true 

parse_git_branch() {
    local branch
    branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [ -n "$branch" ]; then
        echo " ($branch)"
    fi
}
git_prompt_info() {
    if [[ -n $vcs_info_msg_0_ ]]; then
        echo " (Branch: 📦 %F{#ff0000} $vcs_info_msg_0_%f)"
    fi
}
