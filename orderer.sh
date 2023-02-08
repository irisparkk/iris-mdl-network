#!/bin/bash
TYPE="$1"
: ${TYPE:="m"}

############ MDL or Fabric setting ############
if [ "$TYPE" == "m" ]; then
    echo "MDL Fabric Orderer Start"
    export CONFIGTX_ORDERER_BATCHTIMEOUT="2s"
    export CONFIGTX_ORDERER_BATCHSIZE_MAXMESSAGECOUNT="1500"
    export CONFIGTX_ORDERER_BATCHSIZE_ABSOLUTEMAXBYTES="98 MB"
    export CONFIGTX_ORDERER_BATCHSIZE_PREFERREDMAXBYTES="512 KB"
    
    export CORE_MDL_MXP=true

    export GRPC_VERBOSITY=error
    export GRPC_LOG_SEVERITY_LEVEL=error
    export GRPC_GO_GRPC_VERBOSITY=error
    export GRPC_GO_LOG_SEVERITY_LEVEL=error

elif [ "$TYPE" == "f" ]; then
    export CORE_MDL_PEER_MXP=false
    echo "Fabric Orderer Start"
else
    echo "ERROR : The second parameter is process type. [f|m] The default is m."
    exit 1
fi

export PATH=${PWD}/bin:$PATH
export PATH=${PWD}/ca-bin:$PATH
export FABRIC_CFG_PATH=${PWD}/config
export VERBOSE=false

export FABRIC_LOGGING_SPEC=INFO
export ORDERER_GENERAL_LISTENADDRESS=0.0.0.0
export ORDERER_GENERAL_LISTENPORT=7050
export ORDERER_GENERAL_GENESISMETHOD=file
export ORDERER_GENERAL_GENESISFILE=${PWD}/system-genesis-block/genesis.block
export ORDERER_GENERAL_LOCALMSPID=OrdererMSP
export ORDERER_GENERAL_LOCALMSPDIR=${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp
export ORDERER_OPERATIONS_LISTENADDRESS=orderer.example.com:9443
export ORDERER_GENERAL_TLS_ENABLED=true
export ORDERER_GENERAL_TLS_PRIVATEKEY=${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/tls/server.key
export ORDERER_GENERAL_TLS_CERTIFICATE=${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/tls/server.crt
export ORDERER_GENERAL_TLS_ROOTCAS=[${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/tls/ca.crt]
export ORDERER_KAFKA_TOPIC_REPLICATIONFACTOR=1
export ORDERER_KAFKA_VERBOSE=true
export ORDERER_GENERAL_CLUSTER_CLIENTCERTIFICATE=${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/tls/server.crt
export ORDERER_GENERAL_CLUSTER_CLIENTPRIVATEKEY=${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/tls/server.key
export ORDERER_GENERAL_CLUSTER_ROOTCAS=[${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/tls/ca.crt]

orderer