# @summary Manages DHCP server configuration
#
# This class handles the configuration of ISC DHCP server
#
# @example
#   include dhcp::config
class dhcp::config {
  $domain_name = lookup('dhcp.domain_name', String, 'first', 'example.com')
  $domain_name_servers = lookup('dhcp.domain_name_servers', Array, 'unique', ['8.8.8.8', '8.8.4.4'])
  $default_lease_time = lookup('dhcp.default_lease_time', Integer, 'first', 600)
  $max_lease_time = lookup('dhcp.max_lease_time', Integer, 'first', 7200)
  $networks = lookup('dhcp.networks', Hash, 'deep', {})
  $hosts = lookup('dhcp.hosts', Hash, 'deep', {})

  file { '/etc/dhcp/dhcpd.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => epp('dhcp/dhcpd.conf.epp', {
      'domain_name'         => $domain_name,
      'domain_name_servers' => $domain_name_servers,
      'default_lease_time'  => $default_lease_time,
      'max_lease_time'      => $max_lease_time,
      'networks'            => $networks,
      'hosts'               => $hosts,
    }),
    require => Package['dhcp'],
  }
} 
