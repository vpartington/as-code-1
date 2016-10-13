#!/bin/bash
# This is the CLI mockup

case ${1} in
"prepare")
echo "VERSION_TST=1.2
VERSION_ACC=1.1
VERSION_PRD=1.0" > versions
;;
################################################################
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
"
;;
################################################################
"deploy")
if [[ ${3} = "Acceptance" ]] ; then 
        echo "Deploying MyApp to Acceptance"
        echo "Checking if the required Environment ${3} exists in XLD"
        sleep 2
        echo "Environment found!"
        echo "Deploying MyApp.sql... to mysql1"
        echo "Done"
        sleep 2
        echo "Deploying MyApp.sql... to mysql2"
        echo "Done"
        sleep 2
        echo "Deploying MyApp.war to tomcat1..."
        echo "Deploying MyApp.war to tomcat3..."
        sleep 2
        echo "Done"
        echo "Deploying MyApp.war to tomcat2..."
        echo "Deploying MyApp.war to tomcat4..."
        sleep 2
        echo "Done!"
        sed -i -e 's/VERSION_ACC=1.1/VERSION_ACC=1.5/' ./versions
else
        echo "Deploying MyApp to Development"
        echo "Checking if the required Environment Develoment exists in XLD"
        sleep 2
        echo "Environment Development not found!"
        echo "XL Deploy will create the required components"
        echo "Creating tomcat1..."
        sleep 2
        echo "Creating tomcat2..."
        sleep 2
        echo "Creating mysql1..."
        sleep 2
        echo "Environment Development created"
        echo "Deploying MyApp.sql..."
        sleep 2
        echo "Deploying MyApp.war to tomcat1..."
        sleep 2
        echo "Deploying MyApp.war to tomcat2..."
        sleep 2
        echo "Done!"
fi
;;
################################################################
"list") 
echo "Connecting to XLD to show deployed applications"
sleep 2
echo "Applications present on XLD:
MyApp
|-Test   - `cat versions | grep VERSION_TST | cut -d "=" -f 2`
|-Acc    - `cat versions | grep VERSION_ACC | cut -d "=" -f 2`
|-Prod   - `cat versions | grep VERSION_PRD | cut -d "=" -f 2`
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