> :warning: ~~**The AppMonsta API doesn't seem to be responding since their [acquisition](https://twitter.com/appmonsta/status/1267593032322301952).** YMMV~~ They're back!

# PSAppMonsta
PowerShell class to simplify [AppMonsta](https://appmonsta.com/) API calls for app details

## Example
    $AppID = 'com.adobe.reader'
    
    . .\AppMonsta.ps1

    $AppMonsta = [AppMonsta]@{
        APIKey = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
        APIStore = '/stores/android'
    }
    $AppMonsta.GetAppDetails($AppID)
    
See also [Check-AppVersion.ps1](/Check-AppVersion.ps1)
