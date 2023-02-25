export $(echo $(cat .env | sed 's/#.*//g'| xargs) | envsubst)

rm -f data/db/data/.gitkeep
chmod 600 acme.json

# set postgres password in app.ini
sed -i 's/^PASSWD   = .*/PASSWD   = '$POSTGRES_PASSWORD'/g' data/app/gogs/conf/app.ini
