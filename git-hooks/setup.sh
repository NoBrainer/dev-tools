#!/bin/sh
#
# Set/unset 'core.hooksPath' git config globally.
#
# Assumptions:
# - Git is installed.
# - The hook scripts have executable permissions. (Otherwise, the hooks will not execute as expected.)

THIS_SCRIPT="$(readlink -f -- "$0";)"
SCRIPT_DIR="$(dirname -- "$THIS_SCRIPT";)"
HOOKS_DIR="$SCRIPT_DIR/hooks"

function usage {
  echo "Usage: $0 {help|set|unset}"
  echo "Examples:"
  echo -e "$ $0 help \t#Show this message"
  echo -e "$ $0 set  \t#Use the dev-tools git hooks"
  echo -e "$ $0 unset\t#Stop using the dev-tools git hooks"
}

function startUsingHooks {
  git config --global core.hooksPath "$HOOKS_DIR"
  echo "Set 'core.hooksPath' to '$HOOKS_DIR'"
}

function stopUsingHooks {
  git config --global --unset core.hooksPath
  echo "Unset 'core.hooksPath'"
}

case "$1" in
  set)
    startUsingHooks
    ;;
  unset)
    stopUsingHooks
    ;;
  help)
    usage
    ;;
  *)
    usage
    exit 1
esac
