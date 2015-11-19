# Class: xymon
# ===========================
#
# Full description of class xymon here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class xymon::client (
    $package_file = '',
    $package_provider = '',
    $servers = [],
) inherits ::xymon::params {

  if($package_file != ''){
    $real_package_file = $package_file
  } else {
    if($::operatingsystem == 'CentOS'){
        if(str2bool($::selinux_enforced)){
          fail('Default xymon RPMs are not compatible with SE linux. Please, disable SE Linux or provide a compatible RPM file')
        }
    }
    $real_package_file = $::xymon::params::default_client_package_file
  }

  if($package_provider != ''){
    $real_package_provider = $package_provider
  } else {
    $real_package_provider = $::xymon::params::default_client_package_provider
  }

  class { '::xymon::client::install': } ->
  class { '::xymon::client::config': } ~>
  class { '::xymon::client::service': } ->
  Class['::xymon::client']
}
