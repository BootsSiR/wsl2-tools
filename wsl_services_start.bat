@ECHO OFF
wsl /home/steve/scripts/startdocker.sh
FOR /F "tokens=1" %%g IN ('wsl hostname -I') do (SET WSLIP=%%g)
echo WSL IP: %WSLIP%

set TCPPORTS=10101 53 2050

FOR %%g IN (%TCPPORTS%) do (
	echo Deleting TCP port forward for port %%g
	netsh interface portproxy delete v4tov4 listenaddress=0.0.0.0 listenport=%%g
	echo Creating TCP port forward for port %%g
	netsh interface portproxy add v4tov4 listenport=%%g listenaddress=0.0.0.0 connectport=%%g connectaddress=%WSLIP%
)

set UDPPORTS=53 67

echo Deleting all UDP forwards
taskkill /im sudppipe.exe /f

FOR %%g IN (%UDPPORTS%) do (
	echo Creating UDP port forward for port %%g
	START /B C:\wsl2_util\sudppipe\sudppipe -q -b 0.0.0.0 %WSLIP% %%g %%g
)

echo[
echo Current Port Forwards
echo ----------------------------
netsh interface portproxy show v4tov4
