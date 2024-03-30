setlocal
:: Lua安装绝对路径
set lua_install_dir=C:\Env\lua\build-5.3.5
:: Lua源码绝对路径
set lua_build_dir=C:\Env\lua\lua-5.3.5
:: 进入Lua源码路径并使用mingw中的gcc编译器进行编译Lua
cd /D %lua_build_dir%
:: make PLAT=mingw
mingw32-make mingw
echo **** BUILD LUA FINISH ****
:: 创建Lua安装目录以及该目录下的doc，bin，include和lib目录
mkdir %lua_install_dir%
mkdir %lua_install_dir%\doc
mkdir %lua_install_dir%\bin
mkdir %lua_install_dir%\include
mkdir %lua_install_dir%\lib
::拷贝编译后的文件到doc，bin，include和lib目录中
copy %lua_build_dir%\doc\*.* %lua_install_dir%\doc\*.*
copy %lua_build_dir%\src\*.exe %lua_install_dir%\bin\*.*
copy %lua_build_dir%\src\*.dll %lua_install_dir%\bin\*.*
copy %lua_build_dir%\src\luaconf.h %lua_install_dir%\include\*.*
copy %lua_build_dir%\src\lua.h %lua_install_dir%\include\*.*
copy %lua_build_dir%\src\lualib.h %lua_install_dir%\include\*.*
copy %lua_build_dir%\src\lauxlib.h %lua_install_dir%\include\*.*
copy %lua_build_dir%\src\lua.hpp %lua_install_dir%\include\*.*
copy %lua_build_dir%\src\liblua.a %lua_install_dir%\lib\liblua.a
echo **** COPY LUA FINISH ****
:: 使用Lua安装目录下的bin目录中的lua.exe来验证是否编译Lua成功
%lua_install_dir%\bin\lua.exe -e "print [[Hello!]];print[[Simple Lua test successful!!!]]"
:: Lua编译成功后设置Lua的环境变量来安装Lua
setx Path "%lua_install_dir%\bin;%Path%" /m
echo **** SET LUA ENV VAR  FINISH ****

pause