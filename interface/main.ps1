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

function label {
    param (
        $text,
        $location,
        $size

    )
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point($location)
    $label.Size = New-Object System.Drawing.Size($size)
    $label.Text = $text
    return $label
}

function textBox {
    param (
        $text,
        $location,
        $size
    )
    $textBox = New-Object System.Windows.Forms.TextBox
    $textBox.Location = New-Object System.Drawing.Point($location)
    $textBox.Size = New-Object System.Drawing.Size($size)
    $textBox.Text = $text
    return $textBox
}
function MaskedTextBox {
    param (
        $text,
        $location,
        $size
    )
    $MaskedTextBox = New-Object System.Windows.Forms.MaskedTextBox
    $MaskedTextBox.Location = New-Object System.Drawing.Point($location)
    $MaskedTextBox.Size = New-Object System.Drawing.Size($size)
    $MaskedTextBox.PasswordChar = '*'
    return $MaskedTextBox

}
function Button {
    param (
        $text,
        $location,
        $size,
        $DialogResult
    )
    $Button = New-Object System.Windows.Forms.Button
    $Button.Location = New-Object System.Drawing.Point($location)
    $Button.Size = New-Object System.Drawing.Size($size)
    $Button.Text = $text
    $Button.DialogResult = [System.Windows.Forms.DialogResult]::$DialogResult
    return $Button
    
}

function windowslogin {
    Add-Type -AssemblyName System.Windows.Forms
    Add-Type -AssemblyName System.Drawing

    $window = New-Object System.Windows.Forms.Form
    $window.Text = 'Vcenter Connect'
    $window.AutoSize = $true
    $window.Height = 1
    $window.FormBorderStyle = 3
    #$window.Size = New-Object System.Drawing.Size(300,250)
    $window.StartPosition = 'CenterScreen'

    $windowLayout = New-Object System.Windows.Forms.TableLayoutPanel
    $windowLayout.AutoSize = $true
    $windowLayout.ColumnCount = 1
    $windowLayout.RowCount = 2

    #mise en page des champs prénom / nom
    $nameLayout = New-Object System.Windows.Forms.FlowLayoutPanel
    $nameLayout.AutoSize = $true


    $vcenter_label = label -text 'vcenter' -location (10,20) -size (280,20)
    $window.Controls.Add($vcenter_label)

    $vcenter_textBox = textBox -text '172.20.20.5' -location (10,40) -size (260,20)
    $window.Controls.Add($vcenter_textBox)

    $login_label = label -text 'Login' -location (10,60) -size (280,20)
    $window.Controls.Add($login_label)

    $login_textBox = textBox -text 'administrator@vsphere.local' -location (10,80) -size (260,20)
    $window.Controls.Add($login_textBox)


    $password_label = label -text 'Password' -location (10,100) -size (260,20)
    $window.Controls.Add($password_label)

    $password_textBox = MaskedTextBox -location (10,120) -size (260,20)
    $window.Controls.Add($password_textBox)

    $okButton = Button -text 'OK' -location (75,150) -size (75,23) -DialogResult 'OK'
    #$window.AcceptButton = $okButton
    $window.Controls.Add($okButton)

    $cancelButton = Button -text 'Cancel' -location (150,150) -size (75,23) -DialogResult 'Cancel'
    #$window.AcceptButton = $cancelButton
    $window.Controls.Add($cancelButton)
    $result = $window.ShowDialog()
    if ($result -eq [System.Windows.Forms.DialogResult]::Cancel){
        echo 'disconect'
    }    
    if ($result -eq [System.Windows.Forms.DialogResult]::OK){
        $vcenter = $vcenter_textBox.Text
        $login = $login_textBox.Text
        $password = $password_textBox.Text

        $vcenterconnect = connectvcenter -vcenter $vcenter -login $login -Password $password
        echo $vcenterconnect
        if ($vcenterconnect -eq $true){
            return $true
        }else{
            return $false
        }
    }

}

function main {
    $windowsreturn = windowslogin
    if ($windowsreturn -eq $True){
        $menu = New-Object System.Windows.Forms.Form
            $menu.Text = 'Vcenter Connect'
            $menu.Size = New-Object System.Drawing.Size(300,250)
            $menu.StartPosition = 'CenterScreen'

            $vcenter_label = New-Object System.Windows.Forms.Label
            $vcenter_label.Location = New-Object System.Drawing.Point(10,20)
            $vcenter_label.Size = New-Object System.Drawing.Size(280,20)
            $vcenter_label.Text = 'vcenter'
            $menu.Controls.Add($vcenter_label)
            $menu.Topmost = $true

            $menu.Add_Shown({$login_textBox.Select()})
            $result = $menu.ShowDialog()
    }elseif ($windowsreturn -eq $fase) {
        [System.Windows.Forms.MessageBox]::Show("la connection a échoué")
    }
    else{
        echo "autre"
    }
}


main
