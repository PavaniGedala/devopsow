#!/bin/bash
# load configuration variables
source local.env

function usage() {
  echo "Usage: $0 [--install,--uninstall,--update,--env]"
}

function install() {
  echo "creating action in openwhisk"
  wsk action create devopsOwAction hello.js
  
  echo "creating  triggerin openwhisk"
  wsk trigger create devopsOwActiontrigger
}

function uninstall() {
  echo "Removing actions..."
  wsk action delete devopsOwAction


  echo "Removing trigger..."
  wsk trigger delete devopsOwActiontrigger

  echo "Done"
  wsk list
}




case "$1" in
"--install" )
install
;;
"--uninstall" )
uninstall
;;
"--update" )
update
;;
"--env" )
showenv
;;
"--disable" )
disable
;;
"--enable" )
enable
;;
"--recycle" )
uninstall
install
;;
* )
usage
;;
esac
