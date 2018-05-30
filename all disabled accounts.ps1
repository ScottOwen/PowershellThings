<#Header
Scott Owen's Script
scott@owen.on.ca
#>

<#Links


#>

<#Notes
If using AD, make sure to import-module ActiveDirectory

#>
Import-Module ActiveDirectory
$AllAdAccounts = (Search-ADAccount -AccountDisabled).SamAccountName #all accounts locked out
#$DoNotDisable = "Guest" #accounts that should be locked out
#$Disable = Compare-Object -ReferenceObject $DoNotDisable -DifferenceObject $AllAdAccounts -PassThru #compare all accounts to accounts that should be locked
$RefNum = 0 #reference number to select user
Foreach($un in $AllAdAccounts)
{
    $RefNum = $RefNum + 1
    Write-Host $RefNum $un #list users and numbers
}
<#
if($refnum -gt 0)
{
    write-host "which user would you like to enable?"
    $readInt = read-host
    if($readInt -gt 0 -And $readInt -le $RefNum + 1)
    {
        Disable-ADAccount $Disable[$readint-1] #note that arrays are 0 based
        Write-Host $Disable[$readint-1] " is now Disableed"
    }
}
else #if there are no user accounts locked out
{
    Write-Host "No user accounts are Disabled"
}
#>


write-host "Complete"
