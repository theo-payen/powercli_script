Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
connect-VIServer 172.20.20.5 -User administrator@vsphere.local -Password Azerty@77



#create template
$myVM = Get-VM -Name "pv_linux01"
$datastore=Get-Datastore "Storage1"
New-Template -VM $myVM -Name "MyTemplateLinux01" -Datastore $datastore -Location Pv_Datacenter


#create vm 

$myResourcePool = Get-ResourcePool -Name Resources
$myTemplate = Get-Template -Name MyTemplateLinux01
New-VM -Name pv_linux02 -Template $myTemplate -ResourcePool $myResourcePool 
