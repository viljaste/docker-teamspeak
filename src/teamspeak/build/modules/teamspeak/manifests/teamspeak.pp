class teamspeak::teamspeak {
  require teamspeak::teamspeak::supervisor

  file { '/tmp/teamspeak3-server_linux-amd64-3.0.11.2.tar.gz':
    ensure => present,
    source => 'puppet:///modules/teamspeak/tmp/teamspeak3-server_linux-amd64-3.0.11.2.tar.gz'
  }

  bash_exec { 'cd /tmp && tar xzf teamspeak3-server_linux-amd64-3.0.11.2.tar.gz':
    require => File['/tmp/teamspeak3-server_linux-amd64-3.0.11.2.tar.gz']
  }

  bash_exec { 'mv /tmp/teamspeak3-server_linux-amd64 /usr/local/src/teamspeak3-server':
    require => Bash_exec['cd /tmp && tar xzf teamspeak3-server_linux-amd64-3.0.11.2.tar.gz']
  }

  bash_exec { 'rm -rf /usr/local/src/teamspeak3-server/files':
    require => Bash_exec['mv /tmp/teamspeak3-server_linux-amd64 /usr/local/src/teamspeak3-server']
  }

  bash_exec { 'mkdir -p /usr/local/src/teamspeak3-server/logs':
    require => Bash_exec['mv /tmp/teamspeak3-server_linux-amd64 /usr/local/src/teamspeak3-server']
  }
}
