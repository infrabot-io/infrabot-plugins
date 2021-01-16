If ($args.Count -gt 0) {
    $arg1 = $args[0]
    try {
        $name = [System.Net.Dns]::GetHostByAddress($arg1).HostName
        Write-Host -NoNewline $name
    }
    catch {
        Write-Host -NoNewline 1
    }
}
else {
    Write-Host -NoNewline 0
}