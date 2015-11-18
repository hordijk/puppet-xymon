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
  
  concat{ $::xymon::params::default_client_task_file: }

  concat::fragment{ 'initial':
    target  => $::xymon::params::default_client_task_file,
    content => template('xymon/client/clientlaunch.cfg.erb'),
  }
  
}
