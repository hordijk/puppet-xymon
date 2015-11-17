# == Class xymon::client::service
#
# This class is meant to be called from xymon.
# It ensure the service is running.
#
class xymon::client::service {

  service { 'xymon-client':
    ensure     => running,
    enable     => true,
    hasstatus  => false,
    hasrestart => true,
  }
}
