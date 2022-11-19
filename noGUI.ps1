function connectvcenter {
    param(
        $vcenter,
        $login,
        $password
    )
    Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
    connect-VIServer $vcenter -User $login -Password $password
    if ($? -eq $true){
        return $true
    }else{
        return $false
    }
}

function main {
    $ErrorActionPreference= 'silentlycontinue'
    $vcenter = Read-Host "address ip du vcenter"
    $login = Read-Host "login"
    $password = Read-Host "password"
    try{
        Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
        connect-VIServer $vcenter -User $login -Password $password
    }catch{
        Write-host "error"
        Write-Host $_
    }finally{
        write-host "ok"
    }
}
main
