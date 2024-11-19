# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [ "$TERM" = linux ] ; then
    unset LANG
fi
[[ "$COLORTERM" == (24bit|truecolor) || "${terminfo[colors]}" -eq '16777216' ]] || zmodload zsh/nearcolor
##export http_proxy=127.0.0.1:17200
##export https_proxy=127.0.0.1:17200
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# Created by newuser for 5.9
### Added by Zinit's installer
unsetopt prompt_cr prompt_sp
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
zinit ice has'termux-setup-storage'
zinit load zpm-zsh/termux
zinit ice wait
zinit snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh
zinit ice wait has'zypper'
zinit snippet OMZ::plugins/suse/suse.plugin.zsh
zinit ice wait has'sudo'
zinit snippet OMZ::plugins/sudo/sudo.plugin.zsh
zinit ice wait
zinit snippet OMZ::plugins/safe-paste/safe-paste.plugin.zsh
zinit ice wait
zinit snippet OMZ::plugins/alias-finder/alias-finder.plugin.zsh
zinit ice wait
# (this is currently required for annexes)

zinit light-mode for \
    light-mode \
  zsh-users/zsh-autosuggestions \
    light-mode \
  zdharma-continuum/fast-syntax-highlighting \
  zdharma-continuum/history-search-multi-word \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

zinit ice has'lsd' wait
zinit light z-shell/zsh-lsd
zinit ice has'jq' has'curl' wait \
atinit'export ZSH_ASK_API_URL=localhost:30000/v1/chat/completions;export ZSH_ASK_API_KEY=verbose;export ZSH_ASK_REPO=""'
zinit light Licheam/zsh-ask
zinit ice has'eza' wait
zinit light z-shell/zsh-eza
zinit ice has'starship' id-as'starship' run-atpull \
atclone"starship init zsh > starship.zsh;starship completions zsh > _starship" \
atpull"%atclone" src"starship.zsh" \
atinit'export STARSHIP_CONFIG=~/.starship.toml'
zinit light zdharma-continuum/null
zinit ice has'jq' has"curl" \
atinit'local -a data; data=("${(ps:\n:)"$(command curl -s --connect-timeout 2 "https://v1.hitokoto.cn" | command jq -r ".hitokoto,.from,.from_who" )"}");
[[  ${data[1]} != null ]]&&declare -x quote="${data[1]}";[[  ${data[2]} != null ]]&&declare -x quotefrom="${data[2]}";[[  ${data[3]} != null ]]&&[[  ${data[3]} != ${data[2]} ]]&&declare -x quoteauthor="${data[3]}"'
zinit light zdharma-continuum/null
zinit snippet https://github.com/victoria-riley-barnett/Communism/blob/main/Communism.plugin.zsh

# zinit snippet https://github.com/InfinityUniverse0/light-zsh/blob/main/light-zsh.zsh-theme

### End of Zinit's installer chunk
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
ZLE_RPROMPT_INDENT=0

ZSH_AUTOSUGGEST_STRATEGY=( completion)


