# MultiversX Chainlink Adapter

## INTRODUCTION

Scripts will install and run a Chainlink Node complete with Postgresql DB and the MultiversX Chainlink Connector.
The Chainlink Node and MultiversX Adapter will run as system services that can be turned on/off independently.

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

`./script.sh install` - installs everything needed to run the elrond-adapter;

    [START]
`./script.sh start_chainlink` - starts the Chainlink Node;
`./script.sh start_adapter` - starts the MultiversX Adapter;

    [STOP]
`./script.sh stop_chainlink` - stops the Chainlink Node;
`./script.sh stop_adapter` - stops the MultiversX Adapter;

    [CLEANUP]

`./script.sh clean` - #Removes installed packages;

## API Examples (elrond-adapter)

### HTTP `POST /write` endpoint

Sends transaction and writes the request data to the MultiversX network

Input:

```json
{
  "id": "bbfd3e3a8aed4d46abb0a89764951bf9",
  "data": {
    "value": "15051",
    "data": {},
    "sc_address": "erd1...",
    "function": "submit_endpoint",
    "round_id": "145"
  }
}
```

Output:

```json
{
  "jobRunID": "bbfd3e3a8aed4d46abb0a89764951bf9",
  "data": {
    "result": "19feccf4b8590bcc9554ad632ff23f8344d0318fbac643bdba5fa7a605373bf4"
  },
  "result": "19feccf4b8590bcc9554ad632ff23f8344d0318fbac643bdba5fa7a605373bf4",
  "statusCode": 200
}
```

### HTTP `POST /price-job` endpoint

Starts a price feed job which aggregates feeds from multiple sources and pushes data in the aggregator smart contract

Data body can be left empty, it reads input values from `config.toml`

Input:

```json
{
  "id": "bbfd3e3a8aed4d46abb0a89764951bf9",
  "data": {}
}
```

Output:

```json
{
  "jobRunID": "bbfd3e3a8aed4d46abb0a89764951bf9",
  "data": {
    "result": {
      "txHashes": [
        "25d1731151692cd75aa605dcad376c6acf0cd22d6fe0a1ea50a8e2cd25c16f27",
        "f95060ff47bc676f63a72cc5a51ead7ebbb1a21131d60e2273d5148a2fea3d95",
        "3a3092ba6bf49ad54afbdb2b08efa91b6b024e25753797dee675091c9b8f1891",
        "102ff3ef391cb4c53de2b9c672a98a4dca0c93da53be7255c827c60c8da029d3",
        "9c0c4c1ab8372efc21c4bbcadfc79162564e9895c91f73d942cb96be53ddd27e"
      ]
    }
  },
  "result": {
    "txHashes": [
      "25d1731151692cd75aa605dcad376c6acf0cd22d6fe0a1ea50a8e2cd25c16f27",
      "f95060ff47bc676f63a72cc5a51ead7ebbb1a21131d60e2273d5148a2fea3d95",
      "3a3092ba6bf49ad54afbdb2b08efa91b6b024e25753797dee675091c9b8f1891",
      "102ff3ef391cb4c53de2b9c672a98a4dca0c93da53be7255c827c60c8da029d3",
      "9c0c4c1ab8372efc21c4bbcadfc79162564e9895c91f73d942cb96be53ddd27e"
    ]
  },
  "statusCode": 200
}
```

### HTTP `POST /ethgas/denominate` endpoint

Fetched latest eth gas prices, in gwei and denominates the value in a specified asset. e.g GWEI/EGLD

Data body can be left empty, it reads input values from `config.toml`

Input:

```json
{
  "id": "bbfd3e3a8aed4d46abb0a89764951bf9",
  "data": {}
}
```

Output:

```json
{
  "jobRunID": "bbfd3e3a8aed4d46abb0a89764951bf9",
  "data": {
    "result": "19feccf4b8590bcc9554ad632ff23f8344d0318fbac643bdba5fa7a605373bf4"
  },
  "result": "19feccf4b8590bcc9554ad632ff23f8344d0318fbac643bdba5fa7a605373bf4",
  "statusCode": 200
}
```
