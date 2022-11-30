 #create vm from template
 $myResourcePool = Get-ResourcePool -Name Resources
 $myTemplate = Get-Template -Name MyTemplateLinux01
 New-VM -Name pv_linux02 -Template $myTemplate -ResourcePool $myResourcePool 
 