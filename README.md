# Docker image Mysql 5

This repo make a docker image with database 

## Mysql
- version 5.7

## Database
 Courses

### Tables

#### Course

Name: course

| Column     |      Type     |       |
|------------|:-------------:|------:|
| id_course  | int(11)       |       |
| id_teacher | int(11)       |       |
| name       | varchar(250)  |       |
| themes     | text          |       |
| project    | varchar(250)  |       |

#### Teacher

Name: teacher

| Column     |      Type     |       |
|------------|:-------------:|------:|
|            |               |       |

#### Social Media

Name: social_media

| Column     |      Type     |       |
|------------|:-------------:|------:|
|            |               |       |

#### Teacher Social Media

Name: teacher_social_media

| Column     |      Type     |       |
|------------|:-------------:|------:|
|            |               |       |

## Compile image as docker

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

```
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

```terminal
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
