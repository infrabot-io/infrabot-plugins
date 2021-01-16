If ($args.Count -gt 0) {
    $arg1 = $args[0]
    try {
        $CredentialUser = "domain.local\admin"
        $Password = "super_password"
        $CredentialPassword = ConvertTo-SecureString $Password -AsPlainText -Force
        $Credential = New-Object System.Management.Automation.PSCredential ($CredentialUser, $CredentialPassword)
        Unlock-ADAccount -Identity $arg1 -Credential $Credential -ErrorAction Stop
        Write-Host -NoNewline 1
    }
    catch {
        Write-Host -NoNewline 2
    }
}
else {
    Write-Host -NoNewline 0
}