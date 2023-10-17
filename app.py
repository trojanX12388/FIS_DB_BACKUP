# https://console.cloud.google.com/

# pip install pydrive

from pydrive.auth import GoogleAuth
from pydrive.drive import GoogleDrive
import sys

# Create a PyDrive client

gauth = GoogleAuth()
drive = GoogleDrive(gauth)


# CONFIGURING BACKUP PATH AND FILE DIRECTORY

folder = '1TY-lX91kxKqt0UgnYuwhfilgqf0yjYxy'

file_path = "none"
if("--file" in  sys.argv):
    file_path = sys.argv[sys.argv.index("--file") + 1]        
file =  file_path

file1 = drive.CreateFile(metadata={
    "title": file.strip("Data\\"),
    "parents": [{"id": folder}],
    })
file1.SetContentFile(file)
file1.Upload()
  
