define dhcp::host($hostname, $ip, $mac) {
  file { "/etc/dhcp/dhcpd.conf":
    ensure  => file,
    content => epp('dhcp/dhcpd.conf.epp', { 'domain' => $domain, 'hosts' => $hosts }),
  }
}
