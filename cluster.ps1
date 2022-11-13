# crée un nouveau cluster
# 1 cree un centre de donée
# 2 cree le cluster
# 3 add host esxi on cluster

function connect {
    Set-PowerCLIConfiguration -Scope User -InvalidCertificateAction warn
    connect-VIServer 172.20.20.5
}

function Set-cluster{
    param (
        $datacenter,
        $cluster
    )
    $location = Get-Folder -NoRecursion

    
    New-DataCenter -Location $location -Name $datacenter


    New-Cluster -Name $cluster -Location $datacenter

}


function New-hostesxi {
    param (
        $server_hosts,
        $datacenter
    )

    $server_hosts | ForEach-Object {
            $_.ip
            $_.login
            $_.password
            Add-VMHost -Server $_.ip -Name MyVMHost1 -Location MyDatacenter1 -User MyUsername1 -Password MyPassword1
            #Add-VMHost -Server $myServer -Name MyVMHost1 -Location MyDatacenter1 -User MyUsername1 -Password MyPassword1
    
        }
    
}

function main {
    $datacenter = "PV_Datacenter"
    $cluster = "PV_Cluster"
    Set-cluster -datacenter $datacenter -cluster $cluster

    $server_hosts = @(
        [pscustomobject]@{name='esx1';ip='172.20.20.6';login='root';password='Azerty@77'}
        [pscustomobject]@{name='esx2';ip='172.20.20.7';login='root';password='Azerty@77'}
        [pscustomobject]@{name='esx3';ip='172.20.20.8';login='root';password='Azerty@77'}
    )

    New-hostesxi -server_hosts $server_hosts -datacenter $datacenter

}

main