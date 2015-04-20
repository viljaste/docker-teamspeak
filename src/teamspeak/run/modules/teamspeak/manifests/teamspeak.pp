class teamspeak::teamspeak {
  bash_exec { 'mkdir -p /teamspeak/files': }

  file { '/usr/local/src/teamspeak3-server/files':
    ensure => 'link',
    target => '/teamspeak/files',
    require => Bash_exec['mkdir -p /teamspeak/files']
  }

  file { '/usr/local/src/teamspeak3-server/ts3server.sqlitedb':
    ensure => 'link',
    target => '/teamspeak/ts3server.sqlitedb',
  }
}
