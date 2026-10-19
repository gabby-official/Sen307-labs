Microsoft Windows [Version 10.0.26300.9550]
(c) Microsoft Corporation. All rights reserved.

C:\Program Files\MySQL\MySQL Server 26.7\bin>mysql -u root -p
Enter password: *********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 18
Server version: 26.7.0 MySQL Community Server - GPL

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE database uchechukwu_ogbobe;
Query OK, 1 row affected (0.266 sec)

mysql> DROP database uchechukwu_ogbobe;
Query OK, 0 rows affected (0.190 sec)

mysql> SHOW database;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'database' at line 1
mysql> SHOW databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
6 rows in set (0.026 sec)

mysql> CREATE database SEN_307_11799;
Query OK, 1 row affected (0.144 sec)

mysql> USE database SEN_307_11799;
ERROR 1049 (42000): Unknown database 'database'
mysql> USE SEN_307_11799;
Database changed
mysql> SELECT DATABASE();
+---------------+
| DATABASE()    |
+---------------+
| sen_307_11799 |
+---------------+
1 row in set (0.006 sec)

mysql> SELECT DATABASES;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DATABASES' at line 1
mysql> SHOW databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sen_307_11799      |
| sys                |
| world              |
+--------------------+
7 rows in set (0.016 sec)

mysql> SELECT version();
+-----------+
| version() |
+-----------+
| 26.7.0    |
+-----------+
1 row in set (0.008 sec)

mysql> SELECT current_user();
+----------------+
| current_user() |
+----------------+
| root@localhost |
+----------------+
1 row in set (0.005 sec)

mysql> SELECT now();
+---------------------+
| now()               |
+---------------------+
| 2026-10-19 15:07:07 |
+---------------------+
1 row in set (0.007 sec)

mysql> STATUS
--------------
mysql  Ver 26.7.0 for Win64 on x86_64 (MySQL Community Server - GPL)

Connection id:          18
Current database:       sen_307_11799
Current user:           root@localhost
SSL:                    Cipher in use is TLS_AES_128_GCM_SHA256
Using delimiter:        ;
Server version:         26.7.0 MySQL Community Server - GPL
Protocol version:       10
Connection:             localhost via TCP/IP
Server characterset:    utf8mb4
Db     characterset:    utf8mb4
Client characterset:    cp850
Conn.  characterset:    cp850
TCP port:               3306
Binary data as:         Hexadecimal
Uptime:                 35 min 18 sec

Threads: 4  Questions: 6596  Slow queries: 0  Opens: 410  Flush tables: 3  Open tables: 319  Queries per second avg: 3.114
--------------

mysql> SHOW VARIABLES LIKE 'port';
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| port          | 3306  |
+---------------+-------+
1 row in set (0.058 sec)

mysql> SHOW TABLES;
Empty set (0.027 sec)
