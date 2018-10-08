workflow Start-VM-textual-workflow
{
    $c=Get-AutomationConnection -Name 'AzureRunAsConnection'
    add-AzureRmaccount -ServicePrincipal -Tenant $c.TenantID -ApplicationId $c.ApplicationID -CertificateThumbprint $c.CertificateThumbprint
    $vm1=Get-AutomationVariable -Name 'VM1'
    $vm0=Get-AutomationVariable -Name 'VM0'
    $rg=Get-AutomationVariable -Name 'ResourceGroup'
    Parallel
    {
        Start-AzureRmVM -Name $vm0 -ResourceGroupName $rg
        Start-AzureRmVm -Name $vm1 -ResourceGroupName $rg
    }
}