#!/bin/bash
# This is the CLI mockup

case ${1} in
"preview") 
echo "
This xFile will execute the following actions:
Create environment:
Dev
|-Infrastructure
||-tomcat1
||-tomcat2
||-mysql1
|-Dictionary
||-Dev
|||- user: dev
|||- pass: ****
|||- port: 3380

Deploy Application \"MyApp\" - version 1.5:
|-MyApp.mysql to container mysql1
|-MyApp.war to container tomcat1, tomcat2
|-Using the orchestrator sequential-by-deployment-group
";;
################################################################
"deploy") 
echo "Deploying MyApp to Dev
Checking if the required Environment exists in XLD"
sleep 2
echo "Environment not found! 
XL Deploy will create the required components
Creating tomcat1..."
sleep 2
echo "Creating tomcat2..."
sleep 2
echo "Creating mysql1..."
sleep 2
echo "Environment created
Deploying MyApp.sql..."
sleep 2
echo "Deploying MyApp.war to tomcat1..."
sleep 2
echo "Deploying MyApp.war to tomcat2..."
sleep 2
echo "Done!
";;
################################################################
"list") 
echo "Connecting to XLD to show deployed applications"
sleep 2
echo "Applications present on XLD:
MyApp
|-Test   - 1.5
|-Acc    - 1.2
|-Prod   - 1.0
Test
|-Test   - 2.0
|-Acc    - 2.0
|-Prod   - 2.0
YourApp
|-Test   - 1.0
";;
################################################################
*)
echo "xl is a command line interface to control deployments, preview them, or list applications installed"
echo "Usage commands are:"
echo "preview : previews the deployment and shows you which steps it will execute"
echo "deploy  : deploys the application to the specified environment"
echo "list    : list installed applications on the XLD server"
exit
;;
esac
