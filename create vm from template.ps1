function connectvcenter {
    param(
        $vcenter,
        $login,
        $password
    )
    Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
    connect-VIServer $vcenter -User $login -Password $password
}

$vcenter = Read-Host "address ip du vcenter"
$login = Read-Host "login"
$password = Read-Host "password"
connectvcenter -vcenter $vcenter -login $login -password $password

#create vm from template


$name_template = Read-Host "le nom du template"
$name_newvm = Read-Host "le nom de la nouvelle machine"

$myResourcePool = Get-ResourcePool -Name Resources
$myTemplate = Get-Template -Name $name_template
New-VM -Name $name_newvm -Template $myTemplate -ResourcePool $myResourcePool 
