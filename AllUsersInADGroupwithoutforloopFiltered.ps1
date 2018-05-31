<#Header
Scott Owen's Script
scott@owen.on.ca
 
#>

<#Links
#https://community.spiceworks.com/topic/491222-powershell-get-all-users-in-an-adgroup-with-the-displayname
#>

Import-Module ActiveDirectory
$name = (Get-ADGroupMember -identity "OPCTeamMembers" -Recursive | Get-ADUser -Property SAMAccountName | Select SAMAccountName )
echo $name
