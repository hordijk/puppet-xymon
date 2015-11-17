# == Class xymon::params
#
# This class is meant to be called from xymon.
# It sets variables according to platform.
#
class xymon::params {

  $default_client_config_file = '/etc/default/xymon-client'
  
  case $::osfamily {
    'Debian'           : {
      if ($::architecture == 'amd64') {
        $default_client_package_file = 'http://downloads.sourceforge.net/project/xymon/Xymon/4.3.17/xymon-client_4.3.17_amd64.deb'
      } else {
        $default_client_package_file = 'http://downloads.sourceforge.net/project/xymon/Xymon/4.3.17/xymon-client_4.3.17_i386.deb'
      }
      $default_client_package_provider = 'dpkg'
    }
    'RedHat': {
      case $::operatingsystem {
        'RedHat', 'CentOS': {
          if ($::architecture == 'x86_64') {
            if versioncmp($::operatingsystemrelease, '6.0.0') < 0 {
              $default_client_package_file = 'http://downloads.sourceforge.net/project/xymon/Xymon/4.3.10/RHEL5/xymon-client-4.3.10-1.x86_64.rpm'
            } else {
              $default_client_package_file = 'http://downloads.sourceforge.net/project/xymon/Xymon/4.3.10/RHEL6/xymon-client-4.3.10-1.x86_64.rpm'
            }
          }
        }
        'Fedora':{
          if ($::architecture == 'x86_64') {
            $default_client_package_file = 'http://downloads.sourceforge.net/project/xymon/Xymon/4.3.10/Fedora17/xymon-client-4.3.10-1.x86_64.rpm'
          } else {
            $default_client_package_file = 'http://downloads.sourceforge.net/project/xymon/Xymon/4.3.10/Fedora17/xymon-client-4.3.10-1.i386.rpm'
          }
        }
        default: {
          fail("${::operatingsystem} not supported")
        }
      }
      $default_client_package_provider = 'rpm'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}

