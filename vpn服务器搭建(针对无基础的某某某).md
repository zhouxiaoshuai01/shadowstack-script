vpn服务器搭建(针对无基础的某某某)

实现目的： 节约资金消耗；

实现要求：能实现访问google等被动被屏蔽的网站需求；

实现步骤：

第一步目标：在云上找到自己购买的云主机

1.  点击箭头指的'管理控制台'

![image-20190717120804359](/Users/ni/Library/Application Support/typora-user-images/image-20190717120804359.png)

2. 进入下个页面后，点击左侧面板中的云服务器BBC

![image-20190717121326469](/Users/ni/Library/Application Support/typora-user-images/image-20190717121326469.png)

3. 进入下个页面后，点击左侧第二列面板中的'实例'按钮

![image-20190717121541690](/Users/ni/Library/Application Support/typora-user-images/image-20190717121541690.png)

4. 进入下个页面后，就能看到实例的存在。

![image-20190717122043667](/Users/ni/Library/Application Support/typora-user-images/image-20190717122043667.png)

5. 查看密码和ip地址(点击上个步骤的红框中的'详情'按钮)

![image-20190717122524287](/Users/ni/Library/Application Support/typora-user-images/image-20190717122524287.png)

第二步，远程登录或者cosole登录该服务器

6. 远程登录服务器

   1. 

   - window上需要安装xshell软件，然后装完在所有程序里面找到一个叫xshell名称的软件就可以了，软件可以自己百度它官网；

   - 打开这个软件后输入：

     ```shell
     ssh root@[IP地址]     
     ```

     [ip地址]表示的就是之前第五步找到公网ip地址

   - 然后敲击回车

   - 然后会弹出框让你输入密码，在点击确认按钮就算登录完成；

   2. console登录

   - 点击第五步的那个VNC，然后在新页面输入账号密码即可登录完成；

第三步，配置VPN环境

7. 登录以后，可以多敲几次回车熟悉熟悉，这个登录后的页面就被称为命令行页面
8. 下载脚本，准备开始配置vpn

```
输入第一个命令(末尾敲回车)：  
yum -y install git
输入第二个命令 (末尾敲回车)：
git clone https://github.com/zhouxiaoshuai01/shadowstack-script.git
输入第三个命令 (末尾敲回车)：
cd shadowstack-script
输入第四个命令 (末尾敲回车)：
chmod +x shadowstack.sh
输入第五个命令 (末尾敲回车)：
./shadowstack.sh
```

9. 如果最后发现和远程主机连接断开或者console界面连接断开，表示命令执行完了，主机开始重启；

10. 默认连接参数是：

```
端口号：  8082
用户名：	zhouxiaoshuai
协议：    aes-256-cfb
```

第四步，访问shadowstack服务器

11. 下载客户端(windows端)并安装，安装就不需要我叽叽歪歪了吧。

<https://github.com/shadowsocks/shadowsocks-windows/releases/download/4.1.7.1/Shadowsocks-4.1.7.1.zip>

12. 然后打开的客户端界面需要填的东西就是：

```
ip地址
端口号
协议
```

其它的配置都可以默认，不要动。

13. 就此完成配置。