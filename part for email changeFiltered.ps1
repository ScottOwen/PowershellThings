<#Header
Scott Owen's Script
scott@owen.on.ca
 
#>

<#Links
#https://community.spiceworks.com/topic/491222-powershell-get-all-users-in-an-adgroup-with-the-displayname
#>

#change the CHANGEME to a group in AD
$list =(Get-ADGroupMember -identity "Auth" -Recursive | Get-ADUser -Property DisplayName | Select name)
$name = 'scott owen'
$body ="testing
testing 123"
if($list -match $name)
{
$text1 = " text 1"
$body = -join($body,$text1)
}
$text2 = " text 2"
$body = -join($body,$text2)
echo $body
