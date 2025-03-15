# @summary Main DHCP class to manage the DHCP service
#
# This class handles the installation, configuration and service management
# for ISC DHCP server
#
# @example
#   include dhcp
class dhcp {
  include dhcp::config

  package { 'dhcp':
    ensure => present,
  }

  service { 'dhcpd':
    ensure    => running,
    enable    => true,
    subscribe => File['/etc/dhcp/dhcpd.conf'],
    require   => [Package['dhcp'], File['/etc/dhcp/dhcpd.conf']],
  }
} 
