FROM golang:1.22

WORKDIR /app

# COPY hostpath imagepath
COPY ./documentation/examples/prometheus.yml  /etc/prometheus/prometheus.yml
COPY ./prometheus prometheus

USER       nobody
EXPOSE     9090
VOLUME     [ "/prometheus" ]
# set the entrypoint command
ENTRYPOINT [ "prometheus", \
             "--config.file=/etc/prometheus/prometheus.yml", \
             "--storage.tsdb.path=/prometheus", \
             "--storage.tsdb.retention=365d", \
             "--log.level=info", \
             "--log.format=logger:stderr" ] 
