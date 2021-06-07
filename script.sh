#!/bin/bash
set -e

#Color to the people
RED='\x1B[0;31m'
CYAN='\x1B[0;36m'
GREEN='\x1B[0;32m'
NC='\x1B[0m'

#Make script aware of its location
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

source $SCRIPTPATH/CONFIGS/variables.cfg
source $SCRIPTPATH/CONFIGS/functions.cfg


case "$1" in

'install')
  #Check if CUSTOM_HOME exists
  if ! [ -d "$CUSTOM_HOME" ]; then echo -e "${RED}Please configure your variables first ! (variables.cfg)${NC}"; exit; fi
  prerequisites
  echo -e
  echo -e "${GREEN}--> Continuing the install process...${NC}"
  echo -e
  paths
  go_lang
  nvm_install
  install_nodejs
  install_pgsql
  pgsql_user
  echo -e
  echo -e "${GREEN}--> All required packages installed. Building projects...${NC}"
  echo -e
  chainlink_build
  adapter_build
  systemd
  ;;

'start_chainlink')
  #Start chainlink node
  echo -e
  echo -e "${GREEN}Starting the Chainlink Node binary...${NC}"
  echo -e
  sudo systemctl start chainlink-node.service
  ;;

'start_adapter')
  #Start elrond adapter
  echo -e
  echo -e "${GREEN}Starting the Elrond Adapter binary...${NC}"
  echo -e
  sudo systemctl start elrond-adapter.service
  ;;

'stop_chainlink')
  #Stop chainlink node
  echo -e
  echo -e "${GREEN}Stopping the Chainlink Node binary...${NC}"
  echo -e
  sudo systemctl stop chainlink-node.service
  ;;

'stop_adapter')
  #Stop elrond adapter
  echo -e
  echo -e "${GREEN}Stopping the Elrond Adapter binary...${NC}"
  echo -e
  sudo systemctl stop elrond-adapter.service
  ;;

'clean')
  #Remove everything
  paths
  echo -e 
  read -p "Do you want to delete installed projects (Default No) ? (Yy/Nn)" yn
  echo -e
  case $yn in
       [Yy]* )
          echo -e "${RED}OK ! Cleaning everything !${NC}"
          clean
            ;;

       [Nn]* )
          echo -e "${GREEN}Fine ! Skipping cleanup...${NC}"
            ;;
            
           * )
           echo -e "${GREEN}I'll take that as a no then... moving on...${NC}"
            ;;
      esac
  ;;

*)
  echo "Usage: Missing parameter ! [install|start_chainlink|start_adapter|stop_chainlink|stop_adapter|clean]"
  ;;

esac