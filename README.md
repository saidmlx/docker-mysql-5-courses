# Docker image Mysql 5

This repo make a docker image with database 

## Mysql
- version 5.7

## Tables



<img src="https://raw.githubusercontent.com/saidmlx/docker-mysql-5-courses/master/Diagrama-ER.png" alt="Diagram-ER" title="Diagram-ER" width="30%" height="30%" />

#### Course

Name: course

| Field      | Type         | Null | Key | Default | Extra          |
|------------|:-------------|:-----|:----|:--------|:--------------:|
| id_course  | int(11)      | NO   | PRI | NULL    | auto_increment |
| id_teacher | int(11)      | YES  | MUL | NULL    |                |
| name       | varchar(250) | NO   |     | NULL    |                |
| themes     | text         | YES  |     | NULL    |                |
| project    | varchar(250) | YES  |     | NULL    |                |

#### Teacher

Name: teacher

| Field      | Type         | Null | Key | Default | Extra          |
|------------|:-------------|:-----|:----|:--------|:--------------:|
| id_teacher | int(11)      | NO   | PRI | NULL    | auto_increment |
| name       | varchar(250) | NO   |     | NULL    |                |
| avatar     | varchar(250) | NO   |     | NULL    |                |


#### Social Media

Name: social_media


| Field           | Type         | Null | Key | Default | Extra          |
|-----------------|:-------------|:-----|:----|:--------|:--------------:|
| id_social_media | int(11)      | NO   | PRI | NULL    | auto_increment |
| name            | varchar(250) | NO   |     | NULL    |                |
| icon            | varchar(250) | YES  |     | NULL    |                |


#### Teacher Social Media

Name: teacher_social_media


| Field                   | Type         | Null | Key | Default | Extra          |
|-------------------------|:-------------|:-----|:----|:--------|:---------------|
| id_teacher_social_media | int(11)      | NO   | PRI | NULL    | auto_increment |
| id_teacher              | int(11)      | NO   | MUL | NULL    |                |
| id_social_media         | int(11)      | NO   | MUL | NULL    |                |
| nickname                | varchar(250) | NO   |     | NULL    |                |


## Compile Docker Image

```terminal
$ git clone https://github.com/saidmlx/docker-mysql-5-courses.git
```

Inside repository directory 

```bash
$ docker build -t courses ./
Sending build context to Docker daemon  6.144kB
Step 1/2 : FROM mysql:5.7
 ---> ae6b78bedf88
Step 2/2 : COPY ./src/ /docker-entrypoint-initdb.d/
 ---> f968598de225
Successfully built f968598de225
Successfully tagged courses:latest
```

```bash
$ docker image ls
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
courses             latest              4429369fa8e1        20 seconds ago      372MB
```


## Set up image

```bash
$ docker run -d -p 33060:3306 --name mysql-db -e MYSQL_ROOT_PASSWORD=secret -e MYSQL_DATABASE=courses courses
```

```bash
docker ps -a
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                  PORTS                                NAMES
af89073555dc        courses             docker-entrypoint.s…   19 seconds ago      Up 18 seconds           33060/tcp, 0.0.0.0:33060->3306/tcp   mysql-db
```

## get inside mysql

```sql
$ docker exec -it mysql-db mysql -p
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 2
Server version: 5.7.24 MySQL Community Server (GPL)

Copyright (c) 2000, 2018, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use courses;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+----------------------+
| Tables_in_courses    |
+----------------------+
| course               |
| social_media         |
| teacher              |
| teacher_social_media |
+----------------------+
4 rows in set (0.00 sec)

mysql>
```
