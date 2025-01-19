FROM debian:bullseye-slim

WORKDIR /app

# COPY hostpath imagepath
#COPY ./documentation/examples/prometheus.yml  prometheus.yml
#COPY ./prometheus prometheus
COPY . .

EXPOSE     9090
VOLUME     [ "/prometheus" ]
# set the entrypoint command
ENTRYPOINT [ "/app/prometheus", \
             "--config.file=prometheus.yml", \
             "--storage.tsdb.path=/prometheus", \
             "--log.level=info" ] 
