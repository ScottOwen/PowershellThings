<#Header
Scott Owen's Script
scott@owen.on.ca
 
#>

<#Links
#https://community.spiceworks.com/topic/491222-powershell-get-all-users-in-an-adgroup-with-the-displayname
#>

Import-Module ActiveDirectory
$name = (Get-ADGroupMember -identity "Offsite" -Recursive | Get-ADUser -Property SAMAccountName | Select SAMAccountName )
Out-String -Stream | Select-String $name
