#  这个是构建MySQL的dockerfile

FROM MYSQL:5.7

# mysql的工作位置
ENV WORK_PATH /usr/local/

# 定义会被容器自动执行的目录
ENV AUTO_RUN_DIR /docker-entrypoint-initdb.d

# 初始化数据库的SQL
ENV FILE_0 sell-schema.sql
ENV FILE_1 sell-data.sql

# 执行 SQL 脚本
ENV INSTALL_DATA_SHELL docker-entrypoint.sh

# 把 sql 文件放到工作目录
COPY ./$FILE_0 $WORK_PATH/
COPY ./$FILE_1 $WORK_PATH/

# 把要执行的shell文件放到 /docker-entrypoint-initdb.d/ 目录下，容器会自动执行这个shell
COPY ./$INSTALL_DATA_SHELL $AUTO_RUN_DIR/

#给执行文件增加可执行权限
RUN chmod a+x $AUTO_RUN_DIR/$INSTALL_DATA_SHELL

# 设置容器启动时执行的命令
# CMD ["sh", "/docker-entrypoint-initdb.d/import.sh"]
