docker run \
    -v ./db/init.sql:/docker-entrypoint-initdb.d/init.sql \
    -v ./db/test_data.sql:/docker-entrypoint-initdb.d/test_data.sql \
    -v my_pagedata:/var/lib/postgresql/data \
    -e POSTGRES_PASSWORD=password \
    -e POSTGRES_USER=admin \
    -e POSTGRES_DB=post_geo \
    -p 5432:5432 \
    --name postgres \
    -d postgres:latest
