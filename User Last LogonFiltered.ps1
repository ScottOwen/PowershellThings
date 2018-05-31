<#Header
Scott Owen's Script
scott@owen.on.ca
 
#>

<#Links
http://stackoverflow.com/questions/6779186/powershell-try-catch-finally
https://www.reddit.com/r/PowerShell/comments/42ulty/exclude_a_sub_ou_from_searchbase_variable/
http://stackoverflow.com/questions/14406315/how-to-get-an-objects-propertys-value-by-property-name-in-powershell


#>

<#Notes
If using AD, make sure to import-module ActiveDirectory

#>

Import-Module ActiveDirectory
$OUDN = "OU=Off Site" #off site ou
$test=(Get-ADUser -SearchBase "OU=Project4,DC=sidney,DC=office,DC=Project4,DC=ca" -Filter * -SearchScope Subtree  | Where-Object {$_.DistinguishedName -notmatch "$OUDN"})  #gets all users no in the off site OU
$a = Get-Date #gets the date and assigns it to $a
  $time = $a.AddDays(-30) #change this number for how far back you want, it is currently set to 30 days
  
  foreach($un in $test)
  {
 try
  { 
  $user=get-aduser $un | Get-ADObject -Properties lastLogon
  
    if($user.LastLogon -lt $time) 
    {
      Write-Host $un.SamAccountName
    }
  }
  
  
 Catch
  {
  #Write-Host "busted"
  }
  }
