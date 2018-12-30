# Base image
FROM mysql:5.7

# Add all scripts 
COPY ./src/ /docker-entrypoint-initdb.d/
