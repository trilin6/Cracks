@echo off
set dn=Info
set rp=HKEY_CURRENT_USER\Software\Classes\CLSID
reg delete HKEY_CURRENT_USER\Software\PremiumSoft\NavicatPremium\Registration16XCS /f
reg delete HKEY_CURRENT_USER\Software\PremiumSoft\NavicatPremium\Update /f
echo Searching...
for /f "tokens=*" %%a in ('reg query "%rp%"') do (
 echo %%a
for /f "tokens=*" %%l in ('reg query "%%a" /f "%dn%" /s /e ^|findstr /i "%dn%"') do (
  echo Deleting: %%a
  reg delete %%a /f
)
)
echo Done!
 
pause
exit