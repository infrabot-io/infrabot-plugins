If ($args.Count -gt 0) {
    $arg1 = $args[0]
    try {
		$DomainControllerServer = $LockADUser_DCServer
        $Password = ConvertTo-SecureString "NOTMYPASSWORDAASDASD" -AsPlainText -Force
        $User = Get-ADUser -Identity $arg1 -Properties SamAccountName, UserPrincipalName, LockedOut
        Do {
            Invoke-Command -ComputerName "dc01" { Get-Process
            } -Credential (New-Object System.Management.Automation.PSCredential ($($User.UserPrincipalName), $Password)) -ErrorAction SilentlyContinue
        }
        Until ((Get-ADUser -Identity $User.SamAccountName -Properties LockedOut).LockedOut)
        Write-Host -NoNewline 1
    }
    catch {
        Write-Host -NoNewline 2
    }
}
else {
    Write-Host -NoNewline 0
}