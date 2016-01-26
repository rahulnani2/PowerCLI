$myESXiHosts = Get-VMHost | %{ $_ | Select Name,
  @{N="ESXi Version";E={"$($_.Version) build $($_.Build)"}},
  @{N="vCenter";E={$_.ExtensionData.Client.ServiceUrl.Split('/')[2]}},
  @{N="vCenter version";E={
      $global:DefaultVIServers | 
      where {$_.Name -eq ($_.ExtensionData.Client.ServiceUrl.Split('/')[2])} | 
      %{"$($_.Version) build $($_.Build)"}
    }}
}

$myESXiHosts