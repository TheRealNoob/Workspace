<#
AD User Master Tool
V 1.0

Purpose : All-in-one Active Directory user creation tool
Author  : Mike111b

Version : 1.0
Date    : 01/08/2017
#>

#===========================================================================
# Variable Definitions / Setup
#===========================================================================

# Define the items in the Drop-Down menu lists
# 
# Each Drop-Down definition is comprised of the list and a "Selected" variable
# The "Selected" variable specifies the default item in the list, counting up from 0

## Define Org Units
$Defined_User_OrgUnits_Selected = "0"
$Defined_User_OrgUnits = @(
'OU=Users,OU=North America',
'OU=Users,OU=South America',
'OU=Users,OU=Europe'
)

## Define Office
$Defined_User_Office_Selected = "0"
$Defined_User_Office = @(
'Washington D.C.',
'São Paulo',
'London'
)

## Define State
$Defined_User_State_Selected = "0"
$Defined_User_State = @(
'Washington',
''
)

## Define Country
$Defined_User_Country_Selected = "0"
$Defined_User_Country = @(
'United States',
'Brazil',
'United Kingdom'
)


## Refine drop down items

## Org Units
$Defined_User_OrgUnits[$Defined_User_OrgUnits_Selected] = $Defined_User_OrgUnits[$Defined_User_OrgUnits_Selected] + '" IsSelected="True'
for ($i=0 ; $i -lt $Defined_User_OrgUnits.Count ; $i++) {$Defined_User_OrgUnits[$i] = '<ComboBoxItem Content="' + $Defined_User_OrgUnits[$i] + '"/>'}
## Office
$Defined_User_Office[$Defined_User_Office_Selected] = $Defined_User_Office[$Defined_User_Office_Selected] + '" IsSelected="True'
for ($i=0 ; $i -lt $Defined_User_Office.Count ; $i++) {$Defined_User_Office[$i] = '<ComboBoxItem Content="' + $Defined_User_Office[$i] + '"/>'}
## Country
$Defined_User_Country[$Defined_User_Country_Selected] = $Defined_User_Country[$Defined_User_Country_Selected] + '" IsSelected="True'
for ($i=0 ; $i -lt $Defined_User_Country.Count ; $i++) {$Defined_User_Country[$i] = '<ComboBoxItem Content="' + $Defined_User_Country[$i] + '"/>'}
## State
$Defined_User_State[$Defined_User_State_Selected] = $Defined_User_State[$Defined_User_State_Selected] + '" IsSelected="True'
for ($i=0 ; $i -lt $Defined_User_State.Count ; $i++) {$Defined_User_State[$i] = '<ComboBoxItem Content="' + $Defined_User_State[$i] + '"/>'}

#===========================================================================
# XAML code
#===========================================================================

## XAML GUI interface
$inputXML = @"
<Window x:Class="AD_Master_GUI.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:AD_Master_GUI"
        mc:Ignorable="d"
        Title="AD Master GUI" Width="600" Height="650">
    <Grid>
        <TabControl x:Name="tabControl" HorizontalAlignment="Left" Height="570" VerticalAlignment="Top" Width="592">
            <TabItem Header="User">
                <Grid Background="#FFE5E5E5">
                    <Label x:Name="User_Label_Domain" Content="Domain" HorizontalAlignment="Left" Margin="10,10,0,0" VerticalAlignment="Top" Width="120" Foreground="Red"/>
                    <TextBox x:Name="User_TextBox_FirstName_Copy" HorizontalAlignment="Left" Height="23" Margin="135,13,0,0" VerticalAlignment="Top" Width="156"/>
                    <Label x:Name="User_Label_OrgUnit" Content="Org Unit" HorizontalAlignment="Left" Margin="10,41,0,0" VerticalAlignment="Top" Width="120" ToolTip="If left blank the Domain's default OU is used"/>
                    <ComboBox x:Name="User_ComboBox_OrgUnit" HorizontalAlignment="Left" Height="23" Margin="135,44,0,0" VerticalAlignment="Top" Width="156">
                        $Defined_User_OrgUnits
                    </ComboBox>

                    <Label x:Name="User_Header_UserProperties" Content="User Properties" HorizontalAlignment="Left" Margin="10,72,0,0" VerticalAlignment="Top" FontWeight="Bold" FontSize="14" Padding="5" BorderThickness="0"/>
                    <Label x:Name="User_Label_FirstName" Content="First Name" HorizontalAlignment="Left" Margin="10,106,0,0" VerticalAlignment="Top" Width="120"/>
                    <TextBox x:Name="User_TextBox_FirstName" HorizontalAlignment="Left" Height="23" Margin="135,109,0,0" VerticalAlignment="Top" Width="156"/>
                    <Label x:Name="User_Label_LastName" Content="Last Name" HorizontalAlignment="Left" Margin="10,137,0,0" VerticalAlignment="Top" Width="120"/>
                    <TextBox x:Name="User_TextBox_LastName" HorizontalAlignment="Left" Height="23" Margin="135,140,0,0" VerticalAlignment="Top" Width="156"/>
                    <Label x:Name="User_Label_Name" Content="Name" HorizontalAlignment="Left" Margin="10,168,0,0" VerticalAlignment="Top" Width="120" Foreground="Red"/>
                    <TextBox x:Name="User_TextBox_Name" HorizontalAlignment="Left" Height="23" Margin="135,171,0,0" VerticalAlignment="Top" Width="156"/>
                    <Label x:Name="User_Label_SamAccountName" Content="SamAccountName" HorizontalAlignment="Left" Margin="10,230,0,0" VerticalAlignment="Top" Width="120"/>
                    <TextBox x:Name="User_TextBox_SamAccountName" HorizontalAlignment="Left" Height="23" Margin="135,233,0,0" VerticalAlignment="Top" Width="156"/>
                    <Label x:Name="User_Label_UserPrincipalName" Content="UserPrincipalName" HorizontalAlignment="Left" Margin="10,261,0,0" VerticalAlignment="Top" Width="120"/>
                    <TextBox x:Name="User_TextBox_UserPrincipalName" HorizontalAlignment="Left" Height="23" Margin="135,264,0,0" VerticalAlignment="Top" Width="156"/>
                    <Label x:Name="User_Label_Password" Content="Password" HorizontalAlignment="Left" Margin="10,292,0,0" VerticalAlignment="Top" Width="120" ToolTip="If left blank no password will be set.  However depending on your Domain's password policy this could result in a disabled account."/>
                    <PasswordBox x:Name="User_PasswordBox_Password" HorizontalAlignment="Left" Height="23" Margin="135,295,0,0" VerticalAlignment="Top" Width="156"/>
                    <CheckBox x:Name="User_CheckBox_ResetPasswordOnNextLogon" Content="Reset Password on Next Logon" HorizontalAlignment="Left" Margin="10,343,0,0" VerticalAlignment="Top"/>

                    <Label x:Name="User_Header_PhoneNumber" Content="Phone Number" HorizontalAlignment="Left" Margin="10,394,0,0" VerticalAlignment="Top" FontWeight="Bold" FontSize="14" Padding="5" BorderThickness="0"/>
                    <Label x:Name="User_Label_OfficePhone" Content="Office Phone" HorizontalAlignment="Left" Margin="10,428,0,0" VerticalAlignment="Top" Width="120" RenderTransformOrigin="0.508,0.885"/>
                    <TextBox x:Name="User_TextBox_OfficePhone" HorizontalAlignment="Left" Height="23" Margin="135,431,0,0" VerticalAlignment="Top" Width="156"/>
                    <Label x:Name="User_Label_MobilePhone" Content="Mobile Phone" HorizontalAlignment="Left" Margin="10,459,0,0" VerticalAlignment="Top" Width="120"/>
                    <TextBox x:Name="User_TextBox_MobilePhone" HorizontalAlignment="Left" Height="23" Margin="135,462,0,0" VerticalAlignment="Top" Width="156"/>
                    <Label x:Name="User_Label_IPPhone" Content="IP Phone" HorizontalAlignment="Left" Margin="10,490,0,0" VerticalAlignment="Top" Width="120"/>
                    <TextBox x:Name="User_TextBox_IPPhone" HorizontalAlignment="Left" Height="23" Margin="135,493,0,0" VerticalAlignment="Top" Width="156"/>

                    <Label x:Name="User_Header_Professional" Content="Professional" HorizontalAlignment="Left" Margin="296,10,0,0" VerticalAlignment="Top" FontWeight="Bold" FontSize="14" Padding="5" BorderThickness="0"/>
                    <Label x:Name="User_Label_Title" Content="Title" HorizontalAlignment="Left" Margin="296,41,0,0" VerticalAlignment="Top" Width="120"/>
                    <TextBox x:Name="User_TextBox_Title" HorizontalAlignment="Left" Height="23" Margin="421,44,0,0" VerticalAlignment="Top" Width="156"/>
                    <Label x:Name="User_Label_Department" Content="Department" HorizontalAlignment="Left" Margin="296,72,0,0" VerticalAlignment="Top" Width="120"/>
                    <TextBox x:Name="User_TextBox_Department" HorizontalAlignment="Left" Height="23" Margin="421,75,0,0" VerticalAlignment="Top" Width="156"/>
                    <Label x:Name="User_Label_Office" Content="Office" HorizontalAlignment="Left" Margin="296,103,0,0" VerticalAlignment="Top" Width="120"/>
                    <ComboBox x:Name="User_ComboBox_Office" HorizontalAlignment="Left" Height="23" Margin="421,106,0,0" VerticalAlignment="Top" Width="156">
                        $Defined_User_Office
                    </ComboBox>
                    <Label x:Name="User_Label_Company" Content="Company" HorizontalAlignment="Left" Margin="296,134,0,0" VerticalAlignment="Top" Width="120"/>
                    <TextBox x:Name="User_TextBox_Company" HorizontalAlignment="Left" Height="23" Margin="421,137,0,0" VerticalAlignment="Top" Width="156"/>
                    <Label x:Name="User_Label_Manager" Content="Manager" HorizontalAlignment="Left" Margin="296,165,0,0" VerticalAlignment="Top" Width="120" ToolTip=""/>
                    <TextBox x:Name="User_TextBox_Manager" HorizontalAlignment="Left" Height="23" Margin="421,168,0,0" VerticalAlignment="Top" Width="156" ToolTip="Manager's Username"/>

                    <Label x:Name="User_Header_Address" Content="Address" HorizontalAlignment="Left" Margin="296,196,0,0" VerticalAlignment="Top" FontWeight="Bold" FontSize="14" Padding="5" BorderThickness="0"/>
                    <Label x:Name="User_Label_StreetAddress" Content="Street Address" HorizontalAlignment="Left" Margin="296,230,0,0" VerticalAlignment="Top"/>
                    <TextBox x:Name="User_TextBox_StreetAddress" HorizontalAlignment="Left" Height="23" Margin="421,233,0,0" VerticalAlignment="Top" Width="156"/>
                    <Label x:Name="User_Label_City" Content="City" HorizontalAlignment="Left" Margin="296,261,0,0" VerticalAlignment="Top"/>
                    <TextBox x:Name="User_TextBox_City" HorizontalAlignment="Left" Height="23" Margin="421,264,0,0" VerticalAlignment="Top" Width="156"/>
                    <Label x:Name="User_Label_State" Content="State / Province" HorizontalAlignment="Left" Margin="296,292,0,0" VerticalAlignment="Top"/>
                    <ComboBox x:Name="User_ComboBox_State" HorizontalAlignment="Left" Height="23" Margin="421,295,0,0" VerticalAlignment="Top" Width="156">
                        $Defined_User_State
                    </ComboBox>
                    <Label x:Name="User_Label_Country" Content="Country" HorizontalAlignment="Left" Margin="296,323,0,0" VerticalAlignment="Top"/>
                    <ComboBox x:Name="User_ComboBox_Country" HorizontalAlignment="Left" Height="23" Margin="421,326,0,0" VerticalAlignment="Top" Width="156">
                        $Defined_User_Country
                    </ComboBox>

                    <Label x:Name="User_Header_Miscellaneous" Content="Miscellaneous" HorizontalAlignment="Left" Margin="296,354,0,0" VerticalAlignment="Top" FontWeight="Bold" FontSize="14" Padding="5" BorderThickness="0"/>
                    <Label x:Name="User_Label_LogonScript" Content="Logon Script" HorizontalAlignment="Left" Margin="296,388,0,0" VerticalAlignment="Top"/>
                    <TextBox x:Name="User_TextBox_LogonScript" HorizontalAlignment="Left" Height="23" Margin="421,391,0,0" VerticalAlignment="Top" Width="156"/>
                    <Label x:Name="User_Label_Webpage" Content="Webpage" HorizontalAlignment="Left" Margin="296,419,0,0" VerticalAlignment="Top"/>
                    <TextBox x:Name="User_TextBox_Webpage" HorizontalAlignment="Left" Height="23" Margin="421,422,0,0" VerticalAlignment="Top" Width="156"/>
                    <Label x:Name="User_Label_AccountExpirationDate" Content="Account Expiration Date" HorizontalAlignment="Left" Margin="10,363,0,0" VerticalAlignment="Top" Width="148" ToolTip="If left blank Account is set to 'Never Expire'"/>
                    <DatePicker HorizontalAlignment="Left" Margin="163,365,0,0" VerticalAlignment="Top" Width="128"/>
                    <Label x:Name="User_Label_DisplayName" Content="Display Name" HorizontalAlignment="Left" Margin="10,199,0,0" VerticalAlignment="Top" Width="120"/>
                    <TextBox x:Name="User_TextBox_DisplayName" HorizontalAlignment="Left" Height="23" Margin="135,202,0,0" VerticalAlignment="Top" Width="156"/>
                    <CheckBox x:Name="User_CheckBox_RandomizePassword" Content="Randomize Password" HorizontalAlignment="Left" Margin="10,323,0,0" VerticalAlignment="Top" ToolTip="Length: 12, Complexity Requirements: All excluding Ambiguous Symbols"/>

                </Grid>
            </TabItem>
            <TabItem Header="Mailbox / Lync">
                <Grid Background="#FFE5E5E5" Margin="0,-3,0,3">
                    <Label x:Name="Mailbox_Header_UserProperties" Content="User Properties" HorizontalAlignment="Left" Margin="10,10,0,0" VerticalAlignment="Top" FontWeight="Bold" FontSize="14" Padding="5" BorderThickness="0"/>
                    <Label x:Name="Mailbox_Label_FirstName" Content="First Name" HorizontalAlignment="Left" Margin="10,44,0,0" VerticalAlignment="Top" Width="120"/>
                    <TextBox x:Name="Mailbox_TextBox_FirstName" HorizontalAlignment="Left" Height="23" Margin="135,47,0,0" VerticalAlignment="Top" Width="156"/>
                    <Label x:Name="Mailbox_Label_LastName" Content="Last Name" HorizontalAlignment="Left" Margin="10,75,0,0" VerticalAlignment="Top" Width="120"/>
                    <TextBox x:Name="Mailbox_TextBox_LastName" HorizontalAlignment="Left" Height="23" Margin="135,78,0,0" VerticalAlignment="Top" Width="156"/>
                    <Label x:Name="Mailbox_Label_Name" Content="Name" HorizontalAlignment="Left" Margin="10,106,0,0" VerticalAlignment="Top" Width="120" Foreground="Red"/>
                    <TextBox x:Name="Mailbox_TextBox_Name" HorizontalAlignment="Left" Height="23" Margin="135,109,0,0" VerticalAlignment="Top" Width="156"/>
                    <Label x:Name="Mailbox_Label_DisplayName" Content="Display Name" HorizontalAlignment="Left" Margin="10,137,0,0" VerticalAlignment="Top" Width="120"/>
                    <TextBox x:Name="Mailbox_TextBox_DisplayName" HorizontalAlignment="Left" Height="23" Margin="135,140,0,0" VerticalAlignment="Top" Width="156"/>
                    <Label x:Name="Mailbox_Label_SamAccountName" Content="SamAccountName" HorizontalAlignment="Left" Margin="10,168,0,0" VerticalAlignment="Top" Width="120"/>
                    <TextBox x:Name="Mailbox_TextBox_SamAccountName" HorizontalAlignment="Left" Height="23" Margin="135,171,0,0" VerticalAlignment="Top" Width="156"/>
                    <Label x:Name="Mailbox_Label_UserPrincipalName" Content="UserPrincipalName" HorizontalAlignment="Left" Margin="10,199,0,0" VerticalAlignment="Top" Width="120" Foreground="Red"/>
                    <TextBox x:Name="Mailbox_TextBox_UserPrincipalName" HorizontalAlignment="Left" Height="23" Margin="135,202,0,0" VerticalAlignment="Top" Width="156"/>
                    <Label x:Name="Mailbox_Label_Password" Content="Password" HorizontalAlignment="Left" Margin="10,230,0,0" VerticalAlignment="Top" Width="120" Foreground="Red"/>
                    <PasswordBox x:Name="Mailbox_PasswordBox_Password" HorizontalAlignment="Left" Height="23" Margin="135,233,0,0" VerticalAlignment="Top" Width="156" IsEnabled="False"/>
                    <CheckBox x:Name="User_CheckBox_ResetPasswordOnNextLogon_Copy" Content="Reset Password on Next Logon" HorizontalAlignment="Left" Margin="10,261,0,0" VerticalAlignment="Top"/>

                    <Label x:Name="Mailbox_Header_Professional" Content="Mailbox" HorizontalAlignment="Left" Margin="296,10,0,0" VerticalAlignment="Top" FontWeight="Bold" FontSize="14" Padding="5" BorderThickness="0"/>
                    <CheckBox x:Name="Mailbox_CheckBox_Mailbox" Content="Create Mailbox" HorizontalAlignment="Left" Margin="296,44,0,0" VerticalAlignment="Top"/>
                    <Label x:Name="Mailbox_Label_Alias" Content="Alias" HorizontalAlignment="Left" Margin="296,64,0,0" VerticalAlignment="Top" Width="120"/>
                    <TextBox x:Name="Mailbox_TextBox_Alias" HorizontalAlignment="Left" Height="23" Margin="421,67,0,0" VerticalAlignment="Top" Width="156"/>
                    <Label x:Name="Mailbox_Label_Database" Content="Database" HorizontalAlignment="Left" Margin="296,95,0,0" VerticalAlignment="Top" Width="120"/>
                    <ComboBox x:Name="Mailbox_ComboBox_Database" HorizontalAlignment="Left" Margin="421,99,0,0" VerticalAlignment="Top" Width="156">
                        <ComboBoxItem/>
                    </ComboBox>
                    <CheckBox x:Name="User_CheckBox_EnableArchive" Content="Enable Archive" HorizontalAlignment="Left" Margin="296,126,0,0" VerticalAlignment="Top"/>
                    <Label x:Name="Mailbox_Label_EnableArchive" Content="Archive Database" HorizontalAlignment="Left" Margin="296,146,0,0" VerticalAlignment="Top" Width="120"/>
                    <ComboBox x:Name="Mailbox_ComboBox_ArchiveDatabase" HorizontalAlignment="Left" Margin="421,150,0,0" VerticalAlignment="Top" Width="156">
                        <ComboBoxItem/>
                    </ComboBox>
                    <CheckBox x:Name="Mailbox_CheckBox_MailboxDisabled" Content="Mailbox Disabled" HorizontalAlignment="Left" Margin="296,177,0,0" VerticalAlignment="Top"/>

                    <Label x:Name="Lync_Header_Lync" Content="Lync" HorizontalAlignment="Left" Margin="296,197,0,0" VerticalAlignment="Top" FontWeight="Bold" FontSize="14" Padding="5" BorderThickness="0"/>
                    <CheckBox x:Name="Lync_CheckBox_Lync" Content="Create Lync Account" HorizontalAlignment="Left" Margin="296,231,0,0" VerticalAlignment="Top"/>
                    <Label x:Name="Lync_Label_Identity" Content="Identity" HorizontalAlignment="Left" Margin="296,251,0,0" VerticalAlignment="Top" Width="120" Foreground="Red"/>
                    <TextBox x:Name="Lync_TextBox_Identity" HorizontalAlignment="Left" Height="23" Margin="421,254,0,0" VerticalAlignment="Top" Width="156"/>
                    <Label x:Name="Lync_Label_DomainController" Content="DomainController" HorizontalAlignment="Left" Margin="296,282,0,0" VerticalAlignment="Top" Width="120"/>
                    <TextBox x:Name="Lync_TextBox_DomainController" HorizontalAlignment="Left" Height="23" Margin="420,285,0,0" VerticalAlignment="Top" Width="156"/>
                    <Label x:Name="Lync_Label_SipAddress" Content="SipAddress" HorizontalAlignment="Left" Margin="296,313,0,0" VerticalAlignment="Top" Width="120"/>
                    <TextBox x:Name="Lync_TextBox_SipAddress" HorizontalAlignment="Left" Height="23" Margin="420,316,0,0" VerticalAlignment="Top" Width="156"/>
                    <Label x:Name="Lync_Label_SipDomain" Content="SipDomain" HorizontalAlignment="Left" Margin="296,344,0,0" VerticalAlignment="Top" Width="120"/>
                    <TextBox x:Name="Lync_TextBox_SipDomain" HorizontalAlignment="Left" Height="23" Margin="420,347,0,0" VerticalAlignment="Top" Width="156"/>
                </Grid>
            </TabItem>
            <TabItem Header="Group Membership">
                <Grid Background="#FFE5E5E5">
                </Grid>
            </TabItem>
            <TabItem Header="Custom Script">
                <Grid Background="#FFE5E5E5">
                </Grid>
            </TabItem>
        </TabControl>
        <Button x:Name="User_Button_Create" Content="Create" HorizontalAlignment="Left" Margin="406,585,0,0" VerticalAlignment="Top" Width="75" ToolTip="Creates user account"/>
        <Button x:Name="User_Button_Cancel" Content="Cancel" HorizontalAlignment="Left" Margin="500,585,0,0" VerticalAlignment="Top" IsCancel="True" Width="75"/>
        <Label x:Name="Label_RequiredField" Content="*Required Field" HorizontalAlignment="Left" Margin="10,582,0,0" VerticalAlignment="Top" Foreground="Red"/>
    </Grid>
</Window>
"@

$inputXML = $inputXML -replace 'mc:Ignorable="d"','' -replace "x:N",'N' -replace '^<Win.*', '<Window'
[void][System.Reflection.Assembly]::LoadWithPartialName('presentationframework')
[xml]$XAML = $inputXML

#Check for a text changed value (which we cannot parse)
If ($xaml.SelectNodes("//*[@Name]") | ? TextChanged)
{
    write-error "This Snippet can't convert any lines which contain a 'textChanged' property. `n please manually remove these entries"
    $xaml.SelectNodes("//*[@Name]") | ? TextChanged | ForEach
    {
        write-warning "Please remove the TextChanged property from this entry $($_.Name)"
    }
    return
}

## Read XAML
$reader=(New-Object System.Xml.XmlNodeReader $xaml) 
try{$Form=[Windows.Markup.XamlReader]::Load($reader)}
catch [System.Management.Automation.MethodInvocationException] {
    Write-Warning "We ran into a problem with the XAML code.  Check the syntax for this control..."
    write-host $error[0].Exception.Message -ForegroundColor Red
    if ($error[0].Exception.Message -like "*button*"){
        write-warning "Ensure your &lt;button in the `$inputXML does NOT have a Click=ButtonClick property.  PS can't handle this`n`n`n`n"
    }
}
catch {
    Write-Host "Unable to load Windows.Markup.XamlReader. Double-check syntax and ensure .net is installed."
}

## Store Form Objects In PowerShell
$xaml.SelectNodes("//*[@Name]") | %{Set-Variable -Name "WPF$($_.Name)" -Value $Form.FindName($_.Name)}
Function Get-FormVariables{
    if ($global:ReadmeDisplay -ne $true) {
        $global:ReadmeDisplay=$true
    }
}

#===========================================================================
# Define actions based on GUI input
#===========================================================================

$ErrorActionPreference = 'SilentlyContinue'

$WPFUser_TextBox_FirstName.Add_TextChanged({
    #Clean First
    $WPFUser_TextBox_FirstName.Text = $($WPFUser_TextBox_FirstName.Text.Substring(0,1).ToUpper()) + $($WPFUser_TextBox_FirstName.Text.ToString().Substring(1).ToLower())
    #DisplayName
    $WPFUser_TextBox_DisplayName.Text = "$($WPFUser_TextBox_FirstName.Text) $($WPFUser_TextBox_LastName.Text)"
    #SamAccountName
    $WPFUser_TextBox_SamAccountName.Text = $($WPFUser_TextBox_FirstName.Text.ToString().Substring(0,1).ToUpper()) + $($WPFUser_TextBox_LastName.Text.ToString().Substring(0,1).ToUpper()) + $($WPFUser_TextBox_LastName.Text.ToString().Substring(1).ToLower())
    #UserPrincipalName
    $WPFUser_TextBox_UserPrincipalName.Text = $($WPFUser_TextBox_FirstName.Text.ToString().Substring(0,1).ToUpper()) + $($WPFUser_TextBox_LastName.Text.ToString().Substring(0,1).ToUpper()) + $($WPFUser_TextBox_LastName.Text.ToString().Substring(1).ToLower()) + '@ConvergeOne.com'
})

$WPFUser_TextBox_LastName.Add_TextChanged({
    #Clean Last
    $WPFUser_TextBox_LastName.Text = $($WPFUser_TextBox_LastName.Text.Substring(0,1).ToUpper()) + $($WPFUser_TextBox_LastName.Text.ToString().Substring(1).ToLower())
    #DisplayName
    $WPFUser_TextBox_DisplayName.Text = "$($WPFUser_TextBox_FirstName.Text) $($WPFUser_TextBox_LastName.Text)"
    #SamAccountName
    $WPFUser_TextBox_SamAccountName.Text = $($WPFUser_TextBox_FirstName.Text.ToString().Substring(0,1).ToUpper()) + $($WPFUser_TextBox_LastName.Text.ToString().Substring(0,1).ToUpper()) + $($WPFUser_TextBox_LastName.Text.ToString().Substring(1).ToLower())
    #UserPrincipalName
    $WPFUser_TextBox_UserPrincipalName.Text = $($WPFUser_TextBox_FirstName.Text.ToString().Substring(0,1).ToUpper()) + $($WPFUser_TextBox_LastName.Text.ToString().Substring(0,1).ToUpper()) + $($WPFUser_TextBox_LastName.Text.ToString().Substring(1).ToLower()) + '@ConvergeOne.com'
})

$WPFUser_CheckBox_RandomizePassword.Add_Checked({
    $WPFUser_PasswordBox_Password.IsEnabled = $false
})

$WPFUser_CheckBox_RandomizePassword.Add_UnChecked({
    $WPFUser_PasswordBox_Password.IsEnabled = $true
})

#==========================================================================
# Execute 'Create' Button
#==========================================================================



#===========================================================================
# Run Script
#===========================================================================

$Form.ShowDialog() | out-null