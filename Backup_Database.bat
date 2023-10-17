@ECHO OFF
@setlocal enableextensions
@cd /d "%~dp0"

SET PGPATH="bin\"
SET SVPATH="Data\"
SET PRJDB='DATABASE NAME'
SET DBUSR='DBUSERNAME'

FOR /F "TOKENS=1,2,3 DELIMS=/ " %%i IN ('DATE /T') DO SET d=%%i-%%j-%%k
FOR /F "TOKENS=1,2,3 DELIMS=: " %%i IN ('TIME /T') DO SET t=%%i%%j%%k
SET y=%date:~10,4%

SET DBDUMP=%PRJDB%_%d%_%y%_%t%.backup
echo AUTO BACKUP : 'NAME OF DB TO BACK UP'
@ECHO OFF
%PGPATH%pg_dump -h 'YOUR HOST' -p 'YOUR PORT' -U 'YOUR DBUSERNAME' -w --format custom %PRJDB% > %SVPATH%%DBDUMP%

echo Backup Taken Complete %SVPATH%%DBDUMP%

python app.py --file Data\%DBDUMP%

echo Backup to DRIVE Taken Complete %DBDUMP%

pause