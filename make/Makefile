restart_mono:
	/root/mono/monoser.sh stop
	/root/mono/monoser.sh start

delete_current_build:
	rm -rf /home/pubsite

redeploy-qin-core:
	cd qin.core && git pull
	find ./qin.core/ -name "*.sln" -exec nuget restore {} \;
	xbuild /home/source/qin.core/Core/API/Qin.Core.Api/Qin.Core.Api.csproj /t:Build /p:OutputPath="/home/pubsite/qin.core.api" /p:Configuration="Release"

redeploy-backoffice:
	cd qin.backoffice && git pull
	find ./qin.backoffice/ -name "*.sln" -exec nuget restore {} \;
	xbuild /home/source/qin.backoffice/Qin.BackOffice.Web/Qin.BackOffice.Web.csproj /t:Build /p:OutputPath="/home/pubsite/qin.backoffice.vs" /p:Configuration="Release"
   
redeploy-n-website:
	cd qin.website && git pull
	find ./qin.website/ -name "*.sln" -exec nuget restore {} \;
	xbuild /home/source/qin.website/Qin.Tour.Web/Qin.Tour.Web.csproj  /t:Build /p:OutputPath="/home/pubsite/qin.website" /p:Configuration="Release"

deploy: delete_current_build redeploy-qin-core redeploy-backoffice redeploy-qin-website restart_mono
