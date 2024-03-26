#yang di folder ini pake fabric-ca versi 1.5.5
#sama fabric versi 2.4.9

# chmod -R 0755 ./crypto-config
# #delete existing artifacts
# rm -rf ./crypto-config
# rm genesis.block mychannel.tx
# rm -rf ../../channel-artifacts/*

#Generate crypto artifacts for organizations
# cryptogen generate --config=./crypto-config.yaml --output=./crypto-config/

SYS_CHANNEL="sys-channel"
CHANNEL_NAME="nsdm" 
# #Generate System Genesis Block
# configtxgen -profile OrdererGenesis -configPath . -channelID $SYS_CHANNEL -outputBlock ./genesis.block
# #Generate channel configuration Block
# configtxgen -profile BasicChannel -configPath . -outputCreateChannelTx ./nsdm.tx -channelID $CHANNEL_NAME


echo "#######    Generating anchor peer update for GeologiMSP  ##########"
configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./GeologiMSPanchors.tx -channelID $CHANNEL_NAME -asOrg GeologiMSP

echo "#######    Generating anchor peer update for MinerbaMSP  ##########"
configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./MinerbaMSPanchors.tx -channelID $CHANNEL_NAME -asOrg MinerbaMSP


echo "#######    Generating anchor peer update for OrgBadanUsaha1MSP  ##########"
configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./BadanUsaha1MSPanchors.tx -channelID $CHANNEL_NAME -asOrg BadanUsaha1MSP

echo "#######    Generating anchor peer update for OrgBadanUsaha2MSP  ##########"
configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./BadanUsaha2MSPanchors.tx -channelID $CHANNEL_NAME -asOrg BadanUsaha2MSP


echo "#######    Generating anchor peer update for OrgThirdPartyMSP  ##########"
configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./ThirdPartyMSPanchors.tx -channelID $CHANNEL_NAME -asOrg ThirdPartyMSP