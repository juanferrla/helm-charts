# Iniciar SQL Server en segundo plano
/opt/mssql/bin/mssql-conf set sqlagent.enabled true
/opt/mssql/bin/sqlservr &
#/opt/mssql/bin/sqlservr-agent --start --background

# Esperar a que SQL Server inicie
sleep 30s

# Habilitar SQL Server Agent (Agent XPs)
ENABLE_AGENT_SQL="EXEC sp_configure 'show advanced options', 1; RECONFIGURE; EXEC sp_configure 'Agent XPs', 1; RECONFIGURE;"

# Ejecutar el comando SQL para habilitar el agente
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "$SA_PASSWORD" -Q "$ENABLE_AGENT_SQL"
# Ejecutar el script para habilitar CDC
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "$SA_PASSWORD" -i /usr/src/app/enable-cdc.sql
# Mantener el contenedor en ejecución
wait
