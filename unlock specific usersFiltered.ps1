<#
Scott Owen's Script
scott@owen.on.ca
 
December 23rd 2016
#>

<#
http://stackoverflow.com/questions/707646/echo-equivalent-in-powershell-for-script-testing
https://blogs.technet.microsoft.com/heyscriptingguy/2011/08/31/use-powershell-to-find-locked-out-user-accounts/
https://blogs.technet.microsoft.com/heyscriptingguy/2011/12/19/use-powershell-to-find-and-unlock-users-in-active-directory/

#>

If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
<#Notes
If using AD, make sure to import-module ActiveDirectory
Need to run as admin
note that arrays are 0 based
#>
#Start-Process powershell -Verb runAs
#import the ad module and run the single line command
Import-Module ActiveDirectory
$AllAdAccounts = (Search-ADAccount -LockedOut).SamAccountName #all accounts locked out
$DoNotUnlock = "Guest" #accounts that should be locked out
$Unlock = Compare-Object -ReferenceObject $DoNotUnlock -DifferenceObject $AllAdAccounts -PassThru #compare all accounts to accounts that should be locked
$RefNum = 0 #reference number to select user
Foreach($un in $Unlock)
{
    $RefNum = $RefNum + 1
    Write-Host $RefNum $un #list users and numbers
}
if($refnum -gt 0)
{
    write-host "which user would you like to unlock?"
    $readInt = read-host 
    if($readInt -gt 0 -And $readInt -le $RefNum + 1)
    {
        Unlock-ADAccount $unlock[$readint-1] #note that arrays are 0 based
        Write-Host $unlock[$readint-1] " is now unlocked"
    }
}
else #if there are no user accounts locked out
{
    Write-Host "No user accounts are locked"
}

}
