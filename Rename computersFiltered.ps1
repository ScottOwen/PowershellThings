#region Info on this script
<#
Creator: Scott Owen
04/13/2018
scott@owen.on.ca

Requirements
Know the name of the computer you want to change
Know the name of the computer you want the name to be
Use the domain admin account assigned to you

Notes

#>
#endregion

#region change computer name
$computer = Read-Host "Computer name you wish to change"
$newName = Read-Host "Computer name you wish to change to"
#$computer = "minnie-win-lt"
#$newName = "minnie-e560"
rename-computer -ComputerName $computer -NewName $newName -DomainCredential sidney\

#endregion
