class tftp {
  service { 'tftp':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }

  file { '/usr/lib/systemd/system/tftp.service':
    ensure  => file,
    content => template('tftp/tftp.service.erb'),
    notify  => Exec['systemd-daemon-reload'],
  }

  exec { 'systemd-daemon-reload':
    command     => '/bin/systemctl daemon-reload',
    refreshonly => true,
    notify      => Service['tftp'],
  }
}
