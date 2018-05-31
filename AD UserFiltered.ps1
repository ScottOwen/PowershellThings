<#Header
Scott Owen's Script
scott@owen.on.ca
 
#>

<#Links
#https://community.spiceworks.com/topic/491222-powershell-get-all-users-in-an-adgroup-with-the-displayname
#>

Import-Module ActiveDirectory
$user = Read-Host -Prompt 'What is the username of the new user'
$name =(Get-ADUser -LDAPFilter "(samaccountname=*$user*)")

echo $name.SamAccountName

