git clone https://github.com/M2tec/gamechanger-dapp-cli.git
cd gamechanger-dapp-cli
npm install .
sudo npm install -g pkg
pkg . 

gamechanger-dapp-cli testnet build qr -a '{"type":"tx","title":"Demo","description":"created with gamechanger-dapp-cli","metadata":{"123":{"message":"Hello World!"}}}' > qr_output.png


# Remove excess modules
https://github.com/tj/node-prune

# Graph dependencies
http://npm.anvaka.com/#/view/2d/gamechanger-dapp-cli



