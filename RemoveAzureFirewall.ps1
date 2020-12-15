


[CmdletBinding (DefaultParameterSetName = 'None')]
param
(
    [String] $sqlserver = 'vamsi-sqlserver13',
    [String] $ResourceGroup =   'Sql-rg',
    [String] $AzureFirewallName =   'ADOAgentFW'
)

Remove-AzureRMSqlServerFirewallRule -ServerName $sqlserver -FirewallRuleName $AzureFirewallName -ResourceGroupName $ResourceGroup
