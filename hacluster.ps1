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


Set-Cluster "PV_Cluster" -HAEnabled:$true
Set-Cluster "PV_Cluster" -HAAdmissionControleEnabled:$true
Set-Cluster "PV_Cluster" -HAIsolationResponse PowerOff