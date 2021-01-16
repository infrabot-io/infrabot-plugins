If ($args.Count -gt 0) {
    $arg1 = $args[0]
    try {
        $ip = [System.Net.Dns]::GetHostAddresses($arg1).IPAddressToString
        Write-Host -NoNewline $ip
    }
    catch {
        Write-Host -NoNewline 1
    }
}
else {
    Write-Host -NoNewline 0
}