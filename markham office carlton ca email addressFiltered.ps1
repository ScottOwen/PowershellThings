<#Header
Scott Owen's Script
scott@owen.on.ca
 
#>

<#Links
#https://community.spiceworks.com/topic/491222-powershell-get-all-users-in-an-adgroup-with-the-displayname
#>

Import-Module ActiveDirectory
$test =(Get-ADUser -Filter {EmailAddress -like '*@sidney.office.Project4.ca'} -Properties EmailAddress)

Foreach($un in $test)
{
$un2= $un.UserPrincipalName.Substring(0, $un.UserPrincipalName.IndexOf('@'))
$un3 = $un2 + "@Project4.ca"
Set-ADUser -Identity $un -UserPrincipalName $un3
Echo $un +', ' + $un3
}
