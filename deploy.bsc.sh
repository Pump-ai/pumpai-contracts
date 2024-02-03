source .env
# Get the address of the deployed contract
token_address=$(forge create Token --rpc-url=$RPC_URL --private-key=$PRIVATE_KEY --constructor-args 0x6d3eB1ca33112CEf8334adC2018dD6000d37a473 | grep "Deployed to:" | awk '{print $3}')

echo "Token address: $token_address"

presale_address=$(forge create Presale --rpc-url=$RPC_URL --private-key=$PRIVATE_KEY --constructor-args $token_address 1707566400 | grep "Deployed to:" | awk '{print $3}')

echo "Presale address: $presale_address"