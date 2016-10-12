#!/bin/bash
# This is the CLI mockup

case ${1} in
"preview"
"deploy"
"list"
"help")
echo "xl is a command line interface to control deployments, preview them, or list applications installed"
echo "Usage is:"
echo "preview : previews the deployment and shows you which steps it will execute"
echo "deploy  : deploys the application to the specified environment"
echo "list    : list installed applications on the XLD server"
exit
;;
esac
