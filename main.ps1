Add-Type -AssemblyName PresentationFramework

[xml]$XML = @"
        <Window 
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" 
        x:Name="Window" Title="Test Connection Window" Height="150" Width="460" ResizeMode="NoResize">

    <Grid x:Name="LayoutRoot" Background="#FFF">
        <Button x:Name="Connect" Content="Connect" HorizontalAlignment="Left" Margin="327,10,0,0" VerticalAlignment="Top" Width="100" Height="54" />
        <Label Name="Label_Email" Content="Your email:" HorizontalAlignment="Left" Margin="10,10,0,0" VerticalAlignment="Top" Width="130"/>
        <TextBox Name="TextBox_Login" HorizontalAlignment="Left" Height="23" Margin="145,10,0,0" TextWrapping="Wrap" Text="youremail@domain.fr" VerticalAlignment="Top" Width="160"/>
        <Label Name="Label_Password" Content="Your Password" HorizontalAlignment="Left" Margin="10,41,0,0" VerticalAlignment="Top" Width="130"/>
        <PasswordBox Name="TextBox_Password" HorizontalAlignment="Left" Margin="145,41,0,0" VerticalAlignment="Top" Width="160" Height="23"/>
    </Grid>
</Window>
"@

$FormXML = (New-Object System.Xml.XmlNodeReader $XML)
$Window = [Windows.Markup.XamlReader]::Load($FormXML)

$Window.FindName("Connect").add_click({ 
    $login = $Window.FindName("TextBox_Login").Text
    $password = $Window.FindName("TextBox_Password").Text
    $login
    $password
    $Window.Close()
}) 


#Connect-VIServer "Server" -User user -Password pass -SaveCredentials

$Window.ShowDialog() | Out-Null