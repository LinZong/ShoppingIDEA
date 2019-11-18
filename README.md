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

0. 注意需要使用Ultimate的IDEA, 不能使用Community版本。因为Community没有Java EE支持。

1. 项目的MySQL Connector已经更新到8.0.12, 如果在MySQL 8.0及以上版本的数据库服务程序上仍然出现无法连接数据库的情况，尝试将服务端的密码验证机制改成旧版本。

   ```sql
   use mysql;
   ALTER USER 'username'@'%' IDENTIFIED WITH mysql_native_password BY 'password'
   flush privileges;
   ```
   
2. 有一些中文Windows 10 + 本地安装MySQL 8.0.18的系统环境会出现如下报错:

   ```
   2019-11-18T13:23:57.201+0800] [glassfish 5.0] [SEVERE] [] [] [tid: _ThreadID=30 _ThreadName=Thread-9] [timeMillis: 1574054637201] [levelValue: 1000] [[
     java.sql.SQLException: The server time zone value '???ú±ê×??±??' is unrecognized or represents more than one time zone. You must configure ....
   ```

   这种情况下可以尝试在JDBC的连接字符串中指定serverTimeZone解决，就像下面这样:

   ```
   jdbc:mysql://localhost:3306/shopping?user=root&password=1234&useSSL=false&serverTimezone=Hongkong
   ```
   
3. 还有一些同学反映说配置完成点击Run GlassFish后IDEA的控制台停留在以下命令上不再继续执行:
	```
	Attemping to start domain1.... Please look at the server log for more details.
	```

	这种情况比较复杂, 目前还没有找到一种行之有效的解决方法。一般情况下建议先检查自身有关Java的环境变量是否正常，最好保证java, javac和jar这三个命令都能正常地在终端中执行。
	
	然后尝试进入glassfish的bin目录，放有asadmin, asadmin.bat等等文件的文件夹，在终端中执行:
	
	```shell
	asadmin start-domain --verbose
	```
	
	观察终端中输出的信息，如果报错了（最好不过），可以尝试按照报错信息去进行进一步的处理。如果它报错报得不明就里，可以尝试完全卸载并重装JDK8。~~或者如果你在实验室，请重启机器；如果你在宿舍，请重装系统。~~
	
	实在不行可以尝试在IDEA -> Project Structure ->Artifacts -> 点击加号新增一个Web Application : Archive。确认退出，然后Build -> Build Artifacts -> 选择刚刚新建的Artifact，Build。完成后在IDEA的输出目录（一般为out）下找到新生成的war包，把它部署在一个你自己喜欢的容器里……
	

>	**这里给出手动把war包部署到当前正在运行的GlassFish中的方法**
>
>	0. 确保当前GlassFish容器服务正常运行。
>	
>	1. 按照上述操作完成打war包。假设输出的war包名称为```Shopping.war```
>	
>	2. 再次进入放有asadmin的文件夹, 终端输入
>	
>	 asadmin deploy /path/to/Shopping.war
>	
>	如果提示部署成功, 可以访问 http://localhost:8080/Shopping 或者你自己设置的网址访问容器中正在托管的Shopping网站。


​	如果对此问题有更好的解决方法，欢迎Pull Request。

4. 如果你成功了，欢迎开个issue告诉大家。