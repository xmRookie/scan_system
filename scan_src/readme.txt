1、整体包结构：
	 .
	├── readme.txt
	├── scan_code                  # 源代码
	│   ├── cpp_code
	│   │   └── src.tar.gz         # 底层cpp代码
	│   └── web_code
	│       └── code.tar.gz        # web代码
	└── target
		├── shell              
		│   ├── compile_cpp_code.sh    # 自动编译cpp代码脚本 
		│   ├── start_webserver.sh     # 启动服务器脚本
		│   ├── stop_webserver.sh      # 停止服务器脚本
		│   └── web_env_install.sh     # web环境自动安装脚本
		├── web_env
		│   └── web_env_install.tar.gz # web环境包
		└── web_war
		    └── scan.war	       # war包
