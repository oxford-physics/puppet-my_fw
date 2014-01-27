class my_fw ($confs = $my_fw::params::confs )  
inherits my_fw::params 
{

  include 'firewall'
  class { 'my_fw::pre': }
  -> class {'my_fw::main':}
  -> class {'my_fw::post':}


  
}
class my_fw::main ( $confs = $my_fw::params::confs )
{
  create_resources(firewall, $confs, {})
}
