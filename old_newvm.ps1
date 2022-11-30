function connectvcenter {
    param(
        $vcenter
    )
    Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
    connect-VIServer $vcenter
}
function disconnectvcenter {
    disconnect-viserver -confirm:$false | out-null    
}
function select-esx {
    $Memory = 10000
    Get-VMHost | ForEach-Object {
        if ($_.ConnectionState -eq "Connected"){
            if ($_.MemoryUsageGB -lt $Memory){
                $Memory = $_.MemoryUsageGB
                $esxiname = $_.name
            }
        }
    }
    return Get-VMHost -Name $esxiname
}



function main {
    connectvcenter -vcenter 172.20.20.5
    esx = select-esx
    New-VM \
    -Name MyVM1 \
    -ResourcePool $esx \
    -Datastore MyDatastore1 \
    -NumCPU 2 \
    -MemoryGB 4 \
    -DiskGB 40 \
    -NetworkName "VM Network" \
    -Floppy \
    -CD \
    -DiskStorageFormat Thin \
    -GuestID winNetDatacenterGuest
}


#objectif 
#crée une fonction pour déterminé quelle esxi sera choisi 

