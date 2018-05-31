<# important first stuffs
you might have to cd to the user desktop (for example I couldnt load from windows\system32)
****First Troubleshooting step*****
Run these two commands, 
IF YOU GET ANY RED ERRORS 
https://gallery.technet.microsoft.com/scriptcenter/1abd77a5-9c0b-4a2b-acef-90dbb2b84e85
redownload, send to C:\Users\minnie\Documents\WindowsPowerShell\Modules\NTFSSecurity
right click BEFORE YOU EXTRACT and select properties, then at the bottom there is an "Unblock" button. Select that, then extract here
Rerun the two commands above


#>

<# Extra Help

https://technet.microsoft.com/en-us/library/ee692790.aspx (variables)
https://community.spiceworks.com/topic/456933-powershell-command-issues


#>

#searchbase and OU stuff
#https://community.spiceworks.com/topic/456933-powershell-command-issues
#use below line to get all users
#$test=(Get-ADUser -SearchBase "OU=Project4,DC=sidney,DC=office,DC=Project4,DC=ca" -Filter * -SearchScope Subtree).SamAccountName


#http://www.computerperformance.co.uk/powershell/powershell-get-aduser-filter.htm
#use below line for specific user
$test=(Get-ADUser -LDAPfilter '(name=Tim Liu)').SamAccountName

Foreach($un in $test)
{
#change the home directory in AD
#https://www.reddit.com/r/sysadmin/comments/5i5qg4/windows_2012_r2_powershell_for_user_home/     wyoak answer
 Set-ADuser $un -homedirectory "\\office-nas\UserHome$\$un" -homedrive H:

#create directory on nas
#http://stackoverflow.com/questions/16906170/create-directory-if-it-does-not-exist
[system.io.directory]::CreateDirectory("\\office-nas\userhome$\$un")

#set ntfs access
#https://blogs.technet.microsoft.com/heyscriptingguy/2014/11/22/weekend-scripter-use-powershell-to-get-add-and-remove-ntfs-permissions/
Remove-NTFSAccess -Path \\office-nas\userhome$\$un -Account "NT AUTHORITY\Authenticated Users" -AccessRights ReadAndExecute, Synchronize
Add-NTFSAccess -Path \\office-nas\userhome$\$un -Account "sidney\$un" -AccessRights FullControl
}
