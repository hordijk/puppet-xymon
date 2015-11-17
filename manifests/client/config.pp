# == Class xymon::client::config
#
# This class is called from xymon for service config.
#
class xymon::client::config {
  
  $servers = join($::xymon::client::servers, ' ')
  
  file{ $::xymon::params::default_client_config_file:
    ensure  => present,
    content => "XYMONSERVERS=\"${servers}\"",
  }
  
}
