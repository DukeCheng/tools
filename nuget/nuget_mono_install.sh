#!/bin/bash

wget https://dist.nuget.org/win-x86-commandline/latest/nuget.exe -O /tmp/nuget.exe

installPath="/usr/lib/nuget"

mkdir $installPath

mv /tmp/nuget.exe $installPath/nuget.exe 

echo "#!/bin/bash" >> /usr/bin/nuget
echo "exec /usr/bin/cli /usr/lib/nuget/nuget-util.exe "$@"" >> /usr/bin/nuget
chmod 777 /usr/bin/nuget

