# Ramonware

<h3 align="center"><img src="media/demo2.png"></h3>

<p align="center">
  <a href="#about">About</a> •
  <a href="#features">Features</a> •
  <a href="#quick-start--information">Quick Start & Information</a> •
  <a href="#download">Download</a> 
</p>

## About
[![Top language](https://img.shields.io/github/languages/top/SegoCode/Ramonware?style=flat-square)](https://github.com/SegoCode/Ramonware)
[![Repository size](https://img.shields.io/github/repo-size/SegoCode/Ramonware?style=flat-square&label=repo%20size)](https://github.com/SegoCode/Ramonware)
[![Commit activity per year](https://img.shields.io/github/commit-activity/y/SegoCode/Ramonware?style=flat-square&label=commits)](https://github.com/SegoCode/Ramonware/graphs/commit-activity)
[![License: MIT License](https://img.shields.io/badge/license-MIT-blue?style=flat-square)](https://github.com/SegoCode/Ramonware/blob/main/LICENSE)
[![Bitcoin BTC](https://img.shields.io/badge/buy_me_a_coffee-BTC-F7931A?style=flat-square&logo=bitcoin&logoColor=white)](https://github.com/SegoCode/SegoCode/discussions/2)

I built RamonWare as an experiment in minimum ransomware. You get a disk scan and AES on the matched files. The same .bat then opens a fullscreen HTA lock screen. People copy this file as a template and customize it... Trend Micro published a write-up on one of those forks: https://www.trendmicro.com/vinfo/us/threat-encyclopedia/malware/trojan.bat.ramonware.thjoebc

The logic and the HTML share one .bat, a text payload that YARA and similar rules skip because they target binaries. The PowerShell AES block and the del stay in REM, and the HTA still opens fullscreen with HTML left to edit.

> [!NOTE]
> Experimental research. I take no responsibility for damage, loss, or legal trouble that follows from running or sharing this file.

## Features

- Lock screen: opens a fullscreen HTA with a WannaCry-style note after the scan.

- Single file: `code/Ramonware.bat` holds the scan and the HTML. No extra install.

## Quick Start & Information

```shell
git clone https://github.com/SegoCode/Ramonware
cd Ramonware/code
Ramonware.bat
```

> [!CAUTION]
> The scan starts at `%homedrive%\` and walks every folder.
> Uncommenting the PowerShell AES lines and `del` encrypts the file and removes the original.

## Download

https://raw.githubusercontent.com/SegoCode/Ramonware/refs/heads/master/code/Ramonware.bat

---
<p align="center"><a href="https://github.com/SegoCode/Ramonware/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=SegoCode/Ramonware" />
</a></p>
