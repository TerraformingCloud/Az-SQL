

[CmdletBinding (DefaultParameterSetName = 'None')]
param
(
    [String] $sqlserver = 'vamsi-sqlserver13',
    [String] $ResourceGroup =   'Sql-rg',
    [String] $AzureFirewallName =   'ADOAgentFW'
)

$agentIP = curl ifconfig.me

New-AzureRMSqlServerFirewallRule -ResourceGroupName $ResourceGroup -ServerName $sqlserver -FirewallRuleName $AzureFirewallName -StartIPAddress $agentIP -EndIPAddress $agentIP
