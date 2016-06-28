if [ -n "$TAGGED_NAME" ]; then
  export PS1="[\u@\h (\[\e[1m\]$INSTANCE_ID\[\e[m\], \[\e[1m\]$TAGGED_NAME\[\e[m\]) \W]\$ "
else
  export PS1="[\u@\h (\[\e[1m\]$INSTANCE_ID\[\e[m\]) \W]\$ "
fi
