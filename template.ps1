function connectvcenter {
    param(
        $vcenter,
        $login,
        $password
    )
    Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
    connect-VIServer $vcenter -User $login -Password $password
}

function disconnectvcenter {
    disconnect-viserver -confirm:$false | out-null    
}

$vcenter = Read-Host "address ip du vcenter"
$login = Read-Host "login"
$password = Read-Host "password"
connectvcenter -vcenter $vcenter -login $login -password $password

$VM_to_template = Read-Host "entrer le nom de la machine virtuel a templaté"
$datastore = Read-Host "selectionner votre datastore"
$name_template = Read-Host "le nom du template"

$VM_to_template = Get-VM -Name $VM_to_template
$datastore=Get-Datastore $datastore

New-Template -VM $VM_to_template -Name $name_template -Datastore $datastore -Location Pv_Datacenter