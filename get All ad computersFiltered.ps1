<#Header
Scott Owen's Script
scott@owen.on.ca
 
#>

<#Links


#>

<#Notes
If using AD, make sure to import-module ActiveDirectory
https://blogs.technet.microsoft.com/askds/2010/02/04/inventorying-computers-with-ad-powershell/
http://www.oxfordsbsguy.com/2014/04/28/powershell-get-adcomputer-to-retrieve-computer-last-logon-date-part-1/
https://technet.microsoft.com/en-us/library/ee176924.aspx
#>
Import-Module ActiveDirectory
Get-ADComputer -Filter * -Properties * | Sort LastLogonDate | FT Name, LastLogonDate, OperatingSystem | Out-File C:\Users\minnie\Documents\output\adComputers.csv

write-host "Complete"
