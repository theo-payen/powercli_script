$myVM = Get-VM -Name "Vm_debian"
$drsCluster=Get-DatastoreCluster "FreeNas_LabVMware"
New-Template -VM $myVM -Name "MyTemplate" -Datastore $drsCluster -Location Datacenter2

