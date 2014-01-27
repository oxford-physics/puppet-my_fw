class my_fw::params ()
{   
   $confs = hiera_hash ("my_fw::params::confs",  {} )
}
