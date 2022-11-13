# crée un nouveau cluster
# 1 cree un centre de donée
# 2 cree le cluster
# 3 add host esxi on cluster

function connect {
    #Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
    Set-PowerCLIConfiguration -Scope User -InvalidCertificateAction warn
    connect-VIServer 172.20.20.5
}
function diconect {
    disconnect-viserver -confirm:$false | out-null    
}



function Set-cluster{
    param (
        $datacenter,
        $cluster
    )
    if ((Get-Datacenter -Name $datacenter) -eq $false){
        New-DataCenter -Location $location -Name $datacenter
    }else{
        Write-Host "le datacenter $datacenter existe deja"
    }
    if ((Get-Cluster -Name $cluster) -eq $false){
        New-Cluster -Name $cluster -Location $datacenter
    }else{
        Write-Host "le cluster $cluster existe deja"
    }
}


function New-hostesxi {
    param (
        $server_hosts,
        $cluster
    )

    $server_hosts | ForEach-Object {
        
        if ((Get-VMHost -Name $_.ip) -eq $false){
            Write-Host "ajout d'un nouvelle host dans le cluster $cluster : $($_.ip)"
            Add-VMHost -Name $_.ip -Location $cluster -User $_.user -Password $_.password -Force
        }else{
            Write-Host "l'esxi $($_.ip) existe deja"
        }
    }
}

function main {
    $vCenter
    connect -vcenter $vCenter
    $datacenter = "PV_Datacenter"
    $cluster = "PV_Cluster"
    Set-cluster -datacenter $datacenter -cluster $cluster

    $server_hosts = @(
        [pscustomobject]@{ip='172.20.20.6';user='root';password='Azerty@77'}
        [pscustomobject]@{ip='172.20.20.7';user='root';password='Azerty@77'}
        [pscustomobject]@{ip='172.20.20.8';user='root';password='Azerty@77'}
    )

    New-hostesxi -server_hosts $server_hosts -cluster $cluster
    diconect

}

main