Class AppMonsta {
    [String] $APIKey = ''
    [String] $APIEndpoint = 'https://api.appmonsta.com'
    [String] $APIVersion = '/v1'
    [String] $APIStore # '/stores/android' '/stores/itunes'
    [String] $APICountryCode = 'ALL'

    AppMonsta () {}





    [PSObject] Request(
        [String] $Resource
        ,[String] $APICountryCode = $this.APICountryCode
    ) {
        $BasicCredentials = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($this.APIKey+":"))
        $BasicHeader = "Basic $BasicCredentials"
        $Headers = @{
            Authorization = $BasicHeader
        }

        $Uri = ($this.APIEndpoint+$this.APIVersion+$this.APIStore+$Resource+'.json?country='+$APICountryCode)
        $Return = Invoke-RestMethod -Method Get -Uri $Uri -Headers $Headers
        Return $Return
    }
    

    [PSObject] Request(
        [String] $Resource
    ) {
        Return $this.Request($Resource, $this.APICountryCode)
    }




    
    [PSObject] GetAppDetails([String] $AppID) {
        Return $this.Request('/details/'+$AppID)
    }
}
