# Microsoft SQL Server for Linux on Barge


## Start MS SQL Server
```
$ vagrant up
```

## Connect to the SQL Server
```
$ docker run -it --rm --link mssql-server:mssql-server ailispaw/mssql-tools-linux sqlcmd -S mssql-server -U SA -P 'Your@Strong@Password'
1> SELECT Name from sys.Databases;
2> GO
Name
--------------------------------------------------------------------------------------------------------------------------------
master
tempdb
model
msdb

(4 rows affected)
```
