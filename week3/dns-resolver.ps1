# dns resolver for powershell

# establish parameters
param (
	[string]$net_pre,
	[string]$dns_serv
)

# establish loop for 1-254
for ($i = 1; $i -le 254; $i++) {
	$ip_addr = "$net_pre.$i"

	#resolve dns name for current IP in the for loop
	try {
	$output = Resolve-DnsName -DnsOnly $ip_addr -Server $dns_serv -ErrorAction Ignore
	if ($output -ne $null) {
		Write-host "IP: $ip_addr Host: $($output.NameHost)"
		}
		else {
		}
	}
	catch {
		Write-Host "$ip_addr - Error Resolving"
	}
}
