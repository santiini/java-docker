## docker-compose 的使用

docker-compose 构建 mysql、nignx、redis、Springboot 镜像，单独构建、共同构建以及镜像之间的互联;

### docker-compose 构建 mysql 镜像（简单的版本）

docker-compose.yml 文件配置:

```yml
# docker-compose 语法版本
version: '2'

# 服务列表，可以是多个
services:
  mysql:
    image: mysql:5.7
    container_name: mymysql
    ports:
      - 3306:3306
    # 环境变量配置: 这里配置了 mysql 密码，可以添加新的账号
    environment:
      MYSQL_ROOT_PASSWORD: 123456
      MYSQL_USER: 'test'
      MYSQL_PASS: '123456'
      # MYSQL_ROOT_HOST: '%'
    # 自动重启
    restart: always
    # 映射本地目录和 docker 容器的目录及文件
    volumes:
      - './db:/var/lib/mysql'
      - './init:/docker-entrypoint-initdb.d/'
      - './conf/my.cnf:/etc/my.cnf'
```

部分参数说明:

- volumes 映射文件中，db 是 mysql 文件的源文件，容器删除了，文件存在时，新的容器仍然能获取到数据;
  my.conf 是 mysql 的配置文件, /init 目录时初始化时执行的脚本，可以设置账号访问限制，建库建表等;

- environment 配置容器的环境变量

### docker-compose 构建 SpringBoot 应用, 使用 links 连接（老一代方式）

docker-compose.yml 文件配置:

```yml
app:
  container_name: java-docker
  # java-docker 不存在时，会根据 build 的路径下的 dockerfile 构建 images;
  image: java-docker
  build: ./app
  ports:
    - '8080:8080'
  volumes:
    - './logs:/logs'
```

### docker-compose 连接 mysql 和 SpringBoot 应用

```yml
version: '2'

services:
  mysql:
    network_mode: 'bridge'
    image: mysql:5.7
    container_name: mysql
    ports:
      - '3306:3306'
    environment:
      MYSQL_ROOT_PASSWORD: 123456
      # MYSQL_ROOT_HOST: '%'
    restart: always
    volumes:
      - './db:/var/lib/mysql'
      - './init:/docker-entrypoint-initdb.d/'
      - './conf/my.cnf:/etc/my.cnf'
  app:
    container_name: java-docker
    image: java-docker
    build: ./app
    ports:
      - '8080:8080'
    volumes:
      - './logs:/logs'
    # app 应用依赖于 mysql
    depends_on:
      - mysql
    # links 链接 app 和 mysql
    links:
      - mysql
```

### docker-compose 构建 SpringBoot 应用, 使用 networks (功能强大)
