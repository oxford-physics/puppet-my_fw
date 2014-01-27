class my_fw::post {
  firewall { '999 drop all':
    proto   => 'all',
    action  => 'drop',
    before  => undef,
    require   => Class['my_fw::pre','my_fw']
  }
}
