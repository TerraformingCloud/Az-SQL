


[CmdletBinding (DefaultParameterSetName = 'None')]
param
(
    [String] [Parameter(Mandatory = $true)] $sqlservername,
    [String] $ResourceGroup =   'Sql-rg',
    [String] $AzureFirewallName =   'ADOAgentFW'
)

Remove-AzureRMSqlServerFirewallRule -ServerName $sqlservername -FirewallRuleName $AzureFirewallName -ResourceGroupName $ResourceGroup
