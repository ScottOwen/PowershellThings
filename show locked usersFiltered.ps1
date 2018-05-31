<#
Scott Owen's Script
scott@owen.on.ca
 
#>

<#
http://stackoverflow.com/questions/707646/echo-equivalent-in-powershell-for-script-testing
https://blogs.technet.microsoft.com/heyscriptingguy/2011/08/31/use-powershell-to-find-locked-out-user-accounts/
https://blogs.technet.microsoft.com/heyscriptingguy/2011/12/19/use-powershell-to-find-and-unlock-users-in-active-directory/

#>

#import the ad module and run the single line command
Import-Module ActiveDirectory
$AllAdAccounts = (Search-ADAccount -LockedOut).SamAccountName
$DoNotUnlock = "Guest","SQLService","accountant","ap"
$Unlock = Compare-Object -ReferenceObject $DoNotUnlock -DifferenceObject $AllAdAccounts -PassThru
Foreach($un in $Unlock)
{
 write-host "User: " $un #" is unlocked"
 #Unlock-ADAccount $un
}
write-host "Complete"
