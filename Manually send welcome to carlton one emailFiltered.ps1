$un2 = Read-Host -prompt "username"
#$un2 = $user + "@Project4.ca"
$ScriptToRun = "C:\Welcome_Email.ps1"
&$ScriptToRun -username $un2
