class teamspeak::supervisor {
  file { '/etc/supervisor/conf.d/teamspeak.conf':
    ensure => present,
    source => 'puppet:///modules/teamspeak/etc/supervisor/conf.d/teamspeak.conf',
    mode => 644
  }

  file { '/etc/supervisor/conf.d/teamspeak_stdout.conf':
    ensure => present,
    source => 'puppet:///modules/teamspeak/etc/supervisor/conf.d/teamspeak_stdout.conf',
    mode => 644
  }
}
