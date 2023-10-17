@ECHO OFF
@setlocal enableextensions
@cd /d "%~dp0"

SET PGPATH="bin\"
SET SVPATH="Data\"
SET PRJDB=FIS
SET DBUSR=FIS
FOR /F "TOKENS=1,2,3 DELIMS=/ " %%i IN ('DATE /T') DO SET d=%%i-%%j-%%k
FOR /F "TOKENS=1,2,3 DELIMS=: " %%i IN ('TIME /T') DO SET t=%%i%%j%%k
SET y=%date:~10,4%

SET DBDUMP=%PRJDB%_%d%_%y%_%t%.backup
echo AUTO BACKUP : FIS DATABASE
@ECHO OFF
%PGPATH%pg_dump -h 34.72.164.60 -p 5432 -U FIS --format custom %PRJDB% > %SVPATH%%DBDUMP%

echo Backup Taken Complete %SVPATH%%DBDUMP%

python app.py --file Data\%DBDUMP%

echo Backup to DRIVE Taken Complete %DBDUMP%

pause