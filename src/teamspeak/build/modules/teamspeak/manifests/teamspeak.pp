class teamspeak::teamspeak {
  require teamspeak::teamspeak::supervisor

  file { '/tmp/teamspeak3-server_linux-amd64-3.0.11.2.tar.gz':
    ensure => present,
    source => 'puppet:///modules/teamspeak/tmp/teamspeak3-server_linux-amd64-3.0.11.2.tar.gz'
  }

  bash_exec { 'cd /tmp && tar xzf teamspeak3-server_linux-amd64-3.0.11.2.tar.gz':
    require => File['/tmp/teamspeak3-server_linux-amd64-3.0.11.2.tar.gz']
  }

  bash_exec { 'mv /tmp/teamspeak3-server_linux-amd64-3.0.11.2 /usr/local/src/ts3':
    require => Bash_exec['cd /tmp && tar xzf teamspeak3-server_linux-amd64-3.0.11.2.tar.gz']
  }
}
