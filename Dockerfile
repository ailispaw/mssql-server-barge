FROM ailispaw/ubuntu-essential:16.04-nodoc

RUN apt-get update -q && \
    DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends \
      curl ca-certificates apt-transport-https sudo && \

    curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/ubuntu/16.04/mssql-server.list \
      | tee /etc/apt/sources.list.d/mssql-server.list && \

    apt-get update -q && \
    DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends mssql-server && \

    apt-get clean -q && \
    rm -rf /var/cache/apt /var/lib/apt/lists /var/cache/debconf/* /var/log/*

EXPOSE 1433

VOLUME /var/opt/mssql/data

WORKDIR /var/opt/mssql

COPY entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]

CMD [ "/opt/mssql/bin/sqlservr" ]
