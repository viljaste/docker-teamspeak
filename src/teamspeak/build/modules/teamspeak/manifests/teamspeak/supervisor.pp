class teamspeak::teamspeak::supervisor {
  file { '/etc/supervisor/conf.d/teamspeak.conf':
    ensure => present,
    source => 'puppet:///modules/teamspeak/etc/supervisor/conf.d/teamspeak.conf',
    mode => 644
  }
}
