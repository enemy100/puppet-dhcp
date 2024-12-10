class site::add_host {
  $server_name = lookup('server_name')
  $domain = lookup('domain')
  $fqdn = "${server_name}.mcng.local"

  if $facts['networking']['fqdn'] == $fqdn {
#    include dns
    include dhcp

    $hosts = lookup('hosts', Array, 'first', [])

#    $hosts.each |$host| {
#      dns::add_record { $host['hostname']:
#        hostname   => $host['hostname'],
#        ip_address => $host['ip_address'],
#        aliases    => $host['aliases'],
#      }
#    }
  }
}
