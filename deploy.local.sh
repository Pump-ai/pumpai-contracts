RPC_URL="http://127.0.0.1:8545"
PRIVATE_KEY="0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80"

# Get the address of the deployed contract
token_address=$(forge create Token --rpc-url=$RPC_URL --private-key=$PRIVATE_KEY --constructor-args 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266 | grep "Deployed to:" | awk '{print $3}')

echo "Token address: $token_address"

presale_address=$(forge create Presale --rpc-url=$RPC_URL --private-key=$PRIVATE_KEY --constructor-args $token_address 2381165156 | grep "Deployed to:" | awk '{print $3}')

echo "Presale address: $presale_address"