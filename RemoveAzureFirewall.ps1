


[CmdletBinding (DefaultParameterSetName = 'None')]
param
(
    [String] $sqlserver = 'vamsi-sqlserver13',
    [String] $ResourceGroupName =   'Sql-rg',
    [String] $AzureFirewallName =   'ADOAgentFW'
)

#Remove-AzureRMSqlServerFirewallRule -ServerName $sqlserver -FirewallRuleName $AzureFirewallName -ResourceGroupName $ResourceGroup


$ErrorActionPreference = 'Stop'

If ((Get-AzureRMSqlServerFirewallRule -ServerName $sqlserver -FirewallRuleName $AzureFirewallName -ResourceGroupName $ResourceGroupName -ErrorAction SilentlyContinue))
{
    Remove-AzureRmSqlServerFirewallRule -FirewallRuleName $AzureFirewallName -ServerName $sqlserver -ResourceGroupName $ResourceGroupName
}
