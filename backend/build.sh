docker build -t  provedcode-backend . --platform linux/x86_64 \
    --build-arg S3_REGION=$S3_REGION \
    --build-arg BUCKET=$BUCKET \
    --build-arg S3_ACCESS_KEY=$S3_ACCESS_KEY \
    --build-arg S3_SECRET_KEY=$S3_SECRET_KEY \
    --build-arg DB_URL=$DB_URL \
    --build-arg DB_LOGIN=$DB_LOGIN \
    --build-arg DB_PASSWORD=$DB_PASSWORD \
    --build-arg SPRING_PROFILES_ACTIVE=$SPRING_PROFILES_ACTIVE \
    --build-arg EMAIL_USER=$EMAIL_USER \
    --build-arg EMAIL_PASSWORD=$EMAIL_PASSWORD
    
docker tag provedcode-backend mnemov/provedcode-backend
docker push mnemov/provedcode-backend