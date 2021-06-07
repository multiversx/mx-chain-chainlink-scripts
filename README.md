# Elrond Chainlink Adapter

## INTRODUCTION

Scripts will install and run a Chainlink Node complete with Postgresql DB and the Elrond Chainlink Connector.
The Chainlink Node and Elrond Adapter will run as system services that can be turned on/off independently.

## REQUIREMENTS

- Running Ubuntu 20.04 & up
- Running the script requires a user (not root) with sudo priviledges (without password).

## SCRIPT SETTINGS - MUST BE MODIFIED BEFORE FIRST RUN

- config/variables.cfg - used to define username, home path, database options and chainlink node options.

## KEY MANAGEMENT

Before installing/running be sure to add a valid `owner.pem` to the script PEM folder.

- create a folder named `PEM` inside the scripts folder
- add the `owner.pem` file inside the previously created folder

## RUNNING THE SCRIPT

    [FIRST RUN]

`./script.sh install` - installs the everything needed to run the elrond-adapter;

    [START]
`./script.sh start_chainlink` - starts the Chainlink Node;
`./script.sh start_adapter` - starts the Elrond Adapter;

    [STOP]
`./script.sh stop_chainlink` - stops the Chainlink Node;
`./script.sh stop_adapter` - stops the Elrond Adapter;

    [CLEANUP]

`./script.sh clean` - #Removes installed packages;
