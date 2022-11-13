# crée un nouveau cluster
# 1 cree un centre de donée
# 2 cree le cluster
# 3 add host esxi on cluster

$location = Get-Folder -NoRecursion
New-DataCenter -Location $location -Name $datacenter


New-Cluster -Name "MyCluster" -Location "MyDatacenter"


$server_hosts = @(
    [pscustomobject]@{ip='172.20.20.6';login='root';password='Azerty@77'}
    [pscustomobject]@{ip='172.20.20.7';login='root';password='Azerty@77'}
    [pscustomobject]@{ip='172.20.20.8';login='root';password='Azerty@77'}
)
$server_hosts


$server_hosts | ForEach-Object {
        $_.ip
        $conect_host = Connect-VIServer -Server $_.ip

        Add-VMHost -Server $myServer -Name MyVMHost1 -Location MyDatacenter1 -User MyUsername1 -Password MyPassword1

    }


#Add-VMHost -Server $myServer -Name MyVMHost1 -Location MyDatacenter1 -User MyUsername1 -Password MyPassword1
