#connect
#select vm
#clone vm


New-Template – creates a new VM template.



$myVM = Get-VM -Name "MyVM1"
$drsCluster=Get-DatastoreCluster "MyDatastoreCluster"
New-Template -VM $myVM -Name "MyTemplate" -Datastore $drsCluster -Location Datacenter2

function template {
    param (
        $namevm,
        $nametemplate,
        $vcentercluster
    )
    $VM = Get-VM -Name $namevm
    
    

}

function main {
    $cluster
    $Datastore = Get-DatastoreCluster "PV_Cluster"
    template -namevm $vm -nametemplate $nemetemplate -vcentercluster $vcentercluster


}
#New-OSCustomizationSpec – creates a new guest OS customization specification.

#Get-OSCustomizationSpec – retrieves the OS customization specifications from vCenter.

#Set-OSCustomizationSpec – changes the specified OS customization specification.

#Get-OSCustomizationNicMapping – retrieves the NIC mapping settings for OS customization specification.

#Set-OSCustomizationNicMapping – change the NIC mapping settings for the specified OS customization specification.

#New-OSCustomizationNicMapping – adds the NIC mapping settings to the OS customization specification.