# MySQL

We are running mulitple MySQL servers in haakma.org


**haakma.org**
- haakma.org
- webmail.haakma.org
- verbouw.haakma.org

**grotevriendelijkedames.nl**
- grotevriendelijkedames.nl
- admin.grotevriendelijkedames.nl

When you want to connect to the docker please execute t he following command:

```mysql --port=13306 --host=127.0.0.1 -u sido -p```

Make sure you use ***127.0.0.1*** and NOT localhost. Docker binds to 127.0.0.1 not to localhost. Localhost is reserved for any local mysql server that are running on the host.

## Backup

Runs via the [Jenkins](http://jenkins.haakma.org)

## Restore

Put the backups in the initialization directory of the mysql-docker (***/docker-entrypoint-initdb.d***).
When the docker boots all the schema's that are in that directoryt will be loaded in the MySQL server.  





