source .env
# Get the address of the deployed contract
token_address=$(forge create Token --rpc-url=$RPC_URL --private-key=$PRIVATE_KEY --constructor-args 0x8844EF70A127476F480B572786Dfbc78211A7154 | grep "Deployed to:" | awk '{print $3}')

echo "Token address: $token_address"

presale_address=$(forge create Presale --rpc-url=$RPC_URL --private-key=$PRIVATE_KEY --constructor-args $token_address 2381165156 | grep "Deployed to:" | awk '{print $3}')

echo "Presale address: $presale_address"