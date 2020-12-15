

[CmdletBinding (DefaultParameterSetName = 'None')]
param
(
    [String] [Parameter(Mandatory = $true)] $sqlservername,
    [String] $ResourceGroup =   'Sql-rg',
    [String] $AzureFirewallName =   'ADOAgentFW'
)

$agentIP = curl ifconfig.me

New-AzureRMSqlServerFirewallRule -ResourceGroupName $ResourceGroup -ServerName $sqlservername -FirewallRuleName $AzureFirewallName -StartIPAddress $agentIP -EndIPAddress $agentIP
