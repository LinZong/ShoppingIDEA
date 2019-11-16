## Shopping IDEA .ver

### 一般情况下的运行步骤

0. 克隆本仓库到本地，注意不要使用老师给的版本，此版本已做IDEA兼容及Servlet容器部署的预设置

1. 确保本机使用JDK 8（已知JDK12会导致GlassFish报错，懒得研究为什么）
2. 打开IDEA，Open 当前文件夹
3. Run -> Edit Configurations -> Application server -> 重新指定GlassFish的目录 (GlassFish[去这里下载](http://download.oracle.com/glassfish/5.0/release/glassfish-5.0-web.zip))。如果IDEA提示Debug选项非法，点一下Fix
4. 找个MySQL服务器，运行SQL\Shopping.sql文件，建表
5. 修改src\com\bjsxt\shopping\util\DB.java里面的
```java
conn = DriverManager.getConnection("jdbc:mysql://server-ip:port/shopping?user=your-username&password=your-passwd&useSSL=false");
```
​	为真实的数据库连接字符串

### 注意事项

1. 项目的MySQL Connector已经更新到8.0.12, 如果在MySQL 8.0及以上版本的数据库服务程序上仍然出现无法连接数据库的情况，尝试将服务端的密码验证机制改成旧版本。

   ```sql
   use mysql;
   ALTER USER 'username'@'%' IDENTIFIED WITH mysql_native_password BY 'password'
   flush privileges;
   ```

### 说明

1. 本项目已经在MySQL 8.0.12 for Ubuntu + Windows 10 Pro + JDK 1.8.0_221 + IDEA 2019.1 Ultimate 及 macOS 10.13.6 + JDK 1.8.0_221 + IDEA 2019.2.4 Ultimate上验证成功