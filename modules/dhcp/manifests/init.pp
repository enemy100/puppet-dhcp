class dhcp {
  $domain = lookup('domain')
  $server_name = lookup('server_name')
  $server_ip = lookup('server_ip')
  $dhcp_config = lookup('dhcp', Hash, 'first', {})
  $range_start = $dhcp_config['range_start']
  $range_end = $dhcp_config['range_end']
  $routers = $dhcp_config['routers']
  $subnet_mask = $dhcp_config['subnet_mask']
  $subnet_network = $dhcp_config['subnet_network']
  $domain_name_servers = $dhcp_config['domain_name_servers']
  $default_lease_time = $dhcp_config['default_lease_time']
  $max_lease_time = $dhcp_config['max_lease_time']
  $interfaces = $dhcp_config['interfaces']
  $hosts = lookup('hosts', Array, 'first', [])

  file { '/etc/dhcp/dhcpd.conf':
    ensure  => file,
    content => epp('dhcp/dhcpd.conf.epp', {
      'domain' => $domain,
      'range_start' => $range_start,
      'range_end' => $range_end,
      'routers' => $routers,
      'subnet_mask' => $subnet_mask,
      'subnet_network' => $subnet_network,
      'domain_name_servers' => $domain_name_servers,
      'default_lease_time' => $default_lease_time,
      'max_lease_time' => $max_lease_time,
      'interfaces' => $interfaces,
      'server_name' => $server_name,
      'server_ip' => $server_ip,
      'hosts' => $hosts,
    }),
  }

  service { 'dhcpd':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
}

