class my_fw::pre {

Firewall {
    require => undef
}

  #This is a workarond for yumautoupdate errors trying to parse iptables.save
  file { "/etc/sysconfig/iptables.save" :
         ensure => absent,
  }
  file { "/etc/sysconfig/iptables.old" :
         ensure => absent,
  }
  # Default firewall rules
  firewall { '000 accept all icmp':
    proto   => 'icmp',
    action  => 'accept',
  }->
  firewall { '001 accept all to lo interface':
    proto   => 'all',
    iniface => 'lo',
    action  => 'accept',
  }->
  firewall { '002 accept related established rules':
    proto   => 'all',
    state   => ['RELATED', 'ESTABLISHED'],
    action  => 'accept',
  }->
  firewall { "003 management access":
  proto  => "tcp",
  port => [ 22, 1839, 834, 835, 5666] ,
  action => "accept",
  }->
  firewall { "004 file system access tcp":
  proto  => "tcp",
  port => [ 2049, 111, 875, 32803, 892, 662] ,
  action => "accept",
  }->
  firewall { "005 file system access udp":
  proto  => "udp",
  port => [ 32769 ,] ,
  action => "accept",
  }->
  firewall {"006 ypbind":
  proto  => ["tcp", "udp"],
  port => [ 883] ,
  action => "accept",
  }

} 

