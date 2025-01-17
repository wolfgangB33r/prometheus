FROM golang:1.22

WORKDIR /prometheus


COPY prometheus        ./
COPY promtool          ./
COPY documentation/examples/prometheus.yml  ./
COPY LICENSE                                ./
COPY NOTICE                                 ./


RUN chown -R nobody:nobody /etc/prometheus /prometheus

USER       nobody
EXPOSE     9090
VOLUME     [ "/prometheus" ]
ENTRYPOINT [ "/prometheus" ]
CMD        [ "--config.file=/prometheus.yml", \
             "--storage.tsdb.path=/prometheus" ]
