#!/bin/bash
TYPE="$1"
: ${TYPE:="m"}

############ MDL or Fabric setting ############
if [ "$TYPE" == "m" ]; then
    echo "MDL Fabric Peer Start"
    export GRPC_VERBOSITY=error
    export GRPC_LOG_SEVERITY_LEVEL=error
    export GRPC_GO_GRPC_VERBOSITY=error
    export GRPC_GO_LOG_SEVERITY_LEVEL=error

    export CORE_MDL_MXP=true 

    export CORE_LEDGER_STATE_LEVELDBCONFIG_BLOCKCACHECAPACITY=128
    export CORE_LEDGER_STATE_LEVELDBCONFIG_WRITEBUFFER=64
    export CORE_LEDGER_STATE_LEVELDBCONFIG_BLOCKSIZE=
    export CORE_LEDGER_STATE_LEVELDBCONFIG_OPENFILESCACHECAPACITY=
    export CORE_LEDGER_STORAGE_MAXBLOCKFILESIZE=64
elif [ "$TYPE" == "f" ]; then
    export CORE_MDL_PEER_MXP=false
    echo "Fabric Peer Start"
else
    echo "ERROR : The second parameter is process type. [f|m] The default is m."
    exit 1
fi

export PATH=${PWD}/bin:$PATH
export PATH=${PWD}/ca-bin:$PATH
export FABRIC_CFG_PATH=${PWD}/config
export VERBOSE=false

#Generic peer variables
export CORE_VM_ENDPOINT=unix:///host/var/run/docker.sock
export CORE_VM_DOCKER_HOSTCONFIG_NETWORKMODE=fabric_test
export FABRIC_LOGGING_SPEC=INFO
#- FABRIC_LOGGING_SPEC=DEBUG
export CORE_PEER_FILESYSTEMPATH=${PWD}/production/peer/peer0.org2
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_PROFILE_ENABLED=false
export CORE_PEER_TLS_CERT_FILE=${PWD}/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/server.crt
export CORE_PEER_TLS_KEY_FILE=${PWD}/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/server.key
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt
# Peer specific variabes
export CORE_PEER_ID=peer0.org2.example.com
export CORE_PEER_ADDRESS=peer0.org2.example.com:9051
export CORE_PEER_LISTENADDRESS=0.0.0.0:9051
export CORE_PEER_CHAINCODEADDRESS=peer0.org2.example.com:9052
export CORE_PEER_CHAINCODELISTENADDRESS=0.0.0.0:9052
export CORE_PEER_GOSSIP_BOOTSTRAP=peer0.org2.example.com:9051
export CORE_PEER_GOSSIP_EXTERNALENDPOINT=peer0.org2.example.com:9051
export CORE_PEER_LOCALMSPID=Org2MSP
export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/msp
export CORE_OPERATIONS_LISTENADDRESS=peer0.org2.example.com:9445

peer node start