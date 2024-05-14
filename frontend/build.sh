docker build -t  provedcode-frontend . --platform linux/x86_64

docker tag provedcode-frontend mnemov/provedcode-frontend
docker push mnemov/provedcode-frontend