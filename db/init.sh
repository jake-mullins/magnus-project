#!/bin/bash

# Define database variables
DB_NAME="post_geo"
DB_USER="admin"
DB_PASSWORD="password"
DB_VOLUME="post_geo_data"
DB_CONTAINER_NAME="postgres"
POSTGRES_VERSION="latest"  # or any preferred version

PORT=5432

# Step 1: Create a persistent volume
echo "Creating persistent volume for PostgreSQL..."
docker volume create $DB_VOLUME

# Step 2: Create and start PostgreSQL container
echo "Creating PostgreSQL container..."
docker run \
    -v ./init.sql:/docker-entrypoint-initdb.d/init.sql \
    -v ./test_data.sql:/docker-entrypoint-initdb.d/test_data.sql \
    -v post_geo_data:/var/lib/postgresql/data \
    -e POSTGRES_PASSWORD=$DB_PASSWORD \
    -e POSTGRES_USER=$DB_USER \
    -e POSTGRES_DB=$DB_NAME \
    -p 5432:5432 \
    --name postgres \
    -d postgres:latest

# Wait for PostgreSQL to start
# echo "Waiting for PostgreSQL to start..."
sleep 2

# Step 3: Check if PostgreSQL is running
echo "Checking PostgreSQL status..."
if docker exec -it $DB_CONTAINER_NAME pg_isready -U $DB_USER > /dev/null 2>&1; then
    echo "PostgreSQL is ready!"
else
    echo "Error: PostgreSQL failed to start!"
    exit 1
fi

# Step 5: Final check
echo "Database setup is complete. Container '$DB_CONTAINER_NAME' is running with persistent volume '$DB_VOLUME'."
