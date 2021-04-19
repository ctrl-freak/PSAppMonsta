param (
    [Array] $App = @()
    ,[String] $File = ''
    ,[Parameter(Mandatory=$true)][String] $APIKey # = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
    ,[String] $APIStore = '/stores/android'
)

If ($File -ne $null -and $File -ne '') {
    $App = (Import-PowerShellDataFile $File).Apps
}

If ($App.Count -gt 0) {
    . .\AppMonsta.ps1

    $AppMonsta = [AppMonsta]@{
        APIKey = $APIKey
        APIStore = $APIStore
    }

    $AppDetails = @()

    Foreach ($AppID in $App) {
        $AppDetails += $AppMonsta.GetAppDetails($AppID)
    }

    $AppDetails | Select app_name,id,version
} else {
    Throw 'Please supply an Android App ID'
}