# == Class xymon::client::install
#
# This class is called from xymon for install.
#
class xymon::client::install {

  package { 'xymon-client':
    ensure   => present,
    source   => $::xymon::client::real_package_file,
    provider => $::xymon::client::real_package_provider,
  }
  
}
