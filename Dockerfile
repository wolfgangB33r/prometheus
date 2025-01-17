FROM golang:1.22

WORKDIR /app


COPY . /app


RUN chown -R nobody:nobody /etc/prometheus /prometheus

USER       nobody
EXPOSE     9090
VOLUME     [ "/prometheus" ]
ENTRYPOINT [ "/app/prometheus" ]
CMD        [ "--config.file=/app/documentation/examples/prometheus.yml", \
             "--storage.tsdb.path=/prometheus" ]
