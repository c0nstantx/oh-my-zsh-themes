# CRUNCH - created from Steve Eley's cat waxing.
# Initially hacked from the Dallas theme. Thanks, Dallas Reedy.
#
# This theme assumes you do most of your oh-my-zsh'ed "colorful" work at a single machine, 
# and eschews the standard space-consuming user and hostname info.  Instead, only the 
# things that vary in my own workflow are shown:
#
# * The time (not the date)
# * The RVM version and gemset (omitting the 'ruby' name if it's MRI)
# * The current directory
# * The Git branch and its 'dirty' state
# 
# Colors are at the top so you can mess with those separately if you like.
# For the most part I stuck with Dallas's.

C0NSTANTX_BRACKET_COLOR="%{$fg[white]%}"
C0NSTANTX_TIME_COLOR="%{$fg[cyan]%}"
C0NSTANTX_RVM_COLOR="%{$fg[magenta]%}"
C0NSTANTX_DIR_COLOR="%{$fg[yellow]%}"
C0NSTANTX_GIT_BRANCH_COLOR="%{$fg[green]%}"
C0NSTANTX_GIT_CLEAN_COLOR="%{$fg[green]%}"
C0NSTANTX_GIT_DIRTY_COLOR="%{$fg[red]%}"
C0NSTANTX_GIT_COLOR="$FG[081]"
C0NSTANTX_USER_COLOR="$FG[160]"
C0NSTANTX_HOST_COLOR="$FG[112]"

# These Git variables are used by the oh-my-zsh git_prompt_info helper:
ZSH_THEME_GIT_PROMPT_PREFIX="$C0NSTANTX_GIT_COLOR(git:$C0NSTANTX_GIT_BRANCH_COLOR"
ZSH_THEME_GIT_PROMPT_SUFFIX="$C0NSTANTX_GIT_COLOR)"
ZSH_THEME_GIT_PROMPT_CLEAN=" $C0NSTANTX_GIT_CLEAN_COLOR✓"
ZSH_THEME_GIT_PROMPT_DIRTY=" $C0NSTANTX_GIT_DIRTY_COLOR✗"

# Our elements:
C0NSTANTX_TIME_="$C0NSTANTX_BRACKET_COLOR{$C0NSTANTX_TIME_COLOR%T$C0NSTANTX_BRACKET_COLOR}%{$reset_color%}"
C0NSTANTX_USER_=" $C0NSTANTX_USER_COLOR%n$C0NSTANTX_HOST_COLOR@%m "
if [ -e ~/.rvm/bin/rvm-prompt ]; then
  C0NSTANTX_RVM_="$C0NSTANTX_BRACKET_COLOR"["$C0NSTANTX_RVM_COLOR\${\$(~/.rvm/bin/rvm-prompt i v g)#ruby-}$C0NSTANTX_BRACKET_COLOR"]"%{$reset_color%}"
else
  if which rbenv &> /dev/null; then
    C0NSTANTX_RVM_="$C0NSTANTX_BRACKET_COLOR"["$C0NSTANTX_RVM_COLOR\${\$(rbenv version | sed -e 's/ (set.*$//' -e 's/^ruby-//')}$C0NSTANTX_BRACKET_COLOR"]"%{$reset_color%}"
  fi
fi
C0NSTANTX_DIR_="$C0NSTANTX_DIR_COLOR%~\$(git_prompt_info) "
C0NSTANTX_PROMPT="$C0NSTANTX_BRACKET_COLOR➭ "

# Put it all together!
PROMPT="$C0NSTANTX_TIME_$C0NSTANTX_USER_$C0NSTANTX_RVM_$C0NSTANTX_DIR_$C0NSTANTX_PROMPT%{$reset_color%}"
