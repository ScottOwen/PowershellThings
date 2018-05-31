#$adGroup = read-host "which ad group are you looking for"
$adGroup = "Ops"
$test=get-adgroup -Filter { name -like "'*'$adGroup'*'"}
Foreach($un in $test)
{
write-host $un.Name
}
