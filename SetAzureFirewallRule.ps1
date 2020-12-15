

[CmdletBinding (DefaultParameterSetName = 'None')]
param
(
    [String] $sqlserver = 'vamsi-sqlserver13',
    [String] $ResourceGroupName =   'Sql-rg',
    [String] $AzureFirewallName =   'ADOAgentFW'
)


#New-AzureRMSqlServerFirewallRule -ResourceGroupName $ResourceGroup -ServerName $sqlserver -FirewallRuleName $AzureFirewallName -StartIPAddress $agentIP -EndIPAddress $agentIP

$ErrorActionPreference = 'Stop'

function New-AzureSQLServerFirewallRule {
    $agentIP = curl ifconfig.me
    New-AzureRMSqlServerFirewallRule -StartIPAddress $agentIp -EndIPAddress $agentIp -FirewallRuleName $AzureFirewallName -ServerName $sqlserver -ResourceGroupName $ResourceGroupName
  }

function Update-AzureSQLServerFirewallRule{
    $agentIP = curl ifconfig.me
    Set-AzureRMSqlServerFirewallRule -StartIPAddress $agentIp -EndIPAddress $agentIp -FirewallRuleName $AzureFirewallName -ServerName $sqlserver -ResourceGroupName $ResourceGroupName
  }
  
  If ((Get-AzureRMSqlServerFirewallRule -ServerName $sqlserver -FirewallRuleName $AzureFirewallName -ResourceGroupName $ResourceGroupName -ErrorAction SilentlyContinue) -eq $null)
  {
    New-AzureSQLServerFirewallRule
  }
  else
  {
    Update-AzureSQLServerFirewallRule
  }