# Put anything special that should happen *only* for login shells here

# Turn off TTY "start" and "stop" commands (they default to C-q and C-s,
# respectively, but Bash uses C-s to do a forward history search)
stty start ''
stty stop  ''

# Source the .bashrc
if [ -f .bashrc ]; then source .bashrc; fi

# Start X if logging in at VC/1 and save debug info to ~/.myXLog
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/vc/1 ]]; then
  startx >& .myXLog
  logout
fi
