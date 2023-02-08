#!/bin/bash
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
