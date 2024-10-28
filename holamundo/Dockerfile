FROM mcr.microsoft.com/mssql/server:2017-latest

ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=Ferreiro_1
ENV MSSQL_AGENT_ENABLED=true

RUN mkdir -p /usr/src/app

COPY start-sqlserver.sh /usr/src/app/start-sqlserver.sh
COPY enable-cdc.sql /usr/src/app/enable-cdc.sql

RUN chmod +x /usr/src/app/start-sqlserver.sh

CMD ["/usr/src/app/start-sqlserver.sh"]
