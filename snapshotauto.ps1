Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
$vcenter = "172.20.20.5"
$login = "administrator@vsphere.local"
$password = "Azerty@77"

connect-VIServer $vcenter -User $login -Password $password

Get-VM | ForEach-Object {
    $VM = $_.Name
    if ($_.Name -notlike "vCLS*"){
        Get-Snapshot -VM $_.Name | ForEach-Object {
            $snapshot = $_.Name
            $date = (Get-Date).AddDays(-2).ToString("yyMMdd")
            if ($_.Name -like "$date*"){
                Remove-Snapshot -Snapshot $snapshot -RemoveChildren
            }
        }
        $dateday = Get-Date -Format "yyMMdd"
        New-Snapshot -VM $VM -Name "$VM$dateday"
    }
}