# crée un nouveau cluster
# 1 cree un centre de donée
# 2 cree le cluster
# 3 add host esxi on cluster

function connect {
    Set-PowerCLIConfiguration -Scope User -InvalidCertificateAction warn
    connect-VIServer 172.20.20.5
}

function main() {

    $location = Get-Folder -NoRecursion

    $datacenter = "PV_Datacenter"
    New-DataCenter -Location $location -Name $datacenter

    $cluster = "PV_Cluster"

    New-Cluster -Name $cluster -Location $datacenters

}








function esxi() {
    $server_hosts = @(
        [pscustomobject]@{ip='172.20.20.6';login='root';password='Azerty@77'}
        [pscustomobject]@{ip='172.20.20.7';login='root';password='Azerty@77'}
        [pscustomobject]@{ip='172.20.20.8';login='root';password='Azerty@77'}
    )
    $server_hosts
    
    
    $server_hosts | ForEach-Object {
            $_.ip
            $_.login
            $_.password

            #Add-VMHost -Server $myServer -Name MyVMHost1 -Location MyDatacenter1 -User MyUsername1 -Password MyPassword1
    
        }
    
}
main
esxi


