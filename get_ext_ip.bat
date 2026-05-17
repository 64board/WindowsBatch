@echo off

REM Check which is your external IP.
REM janeiros@mbfcc.com
REM 2026.05.16

REM curl ifconfig.me
REM curl icanhazip.com
REM curl api.ipify.org

REM In case curl is not available:
REM Windows native alternative to wget/curl:
REM powershell -Command "(Invoke-WebRequest ifconfig.me).Content"

REM Using nslookup (Windows native fastest alternative to dig, no HTTP)

REM -query=txt: This specifies the type of DNS record you are looking for. Usually, you look for
REM A records (which turn a name like google.com into an IP). A TXT record is just raw,
REM arbitrary text. Cloudflare uses a text record to pass your IP back to you.

REM -class=chaos: This stands for the Chaosnet class. While 99% of internet traffic uses the IN
REM (Internet) class, some network tools use the historical Chaosnet class for local
REM server information and diagnostics.

REM whoami.cloudflare: This is the specific zone/domain name you are querying.
REM Cloudflare has programmed their servers so that if anyone asks for "whoami",
REM the server looks at the incoming connection, grabs the public IP it came from,
REM and spits it right back.

REM 1.1.1.1: This forces nslookup to ask Cloudflare's public DNS server (1.1.1.1) directly,
REM rather than asking your local home router or your ISP's DNS server.

nslookup -query=txt -class=chaos whoami.cloudflare 1.1.1.1

pause

REM END