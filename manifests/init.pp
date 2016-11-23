
class xymon (
    $enable_terabithia_repo = false
) {

  if($enable_terabithia_repo){

    case $::osfamily {
      'RedHat': {
        case $::operatingsystem {
          'RedHat', 'CentOS': {
            $opsystem = "el${::operatingsystemmajrelease}"
          }
          'Fedora':{
            $opsystem = "f${::operatingsystemmajrelease}"
          }
          default: {
            fail("${::operatingsystem} not supported by terabithia repo")
          }
        }
      }
      default: {
        fail("${::operatingsystem} not supported by terabithia repo")
      }
    }

    $releasever = $::operatingsystemmajrelease

    file { '/etc/yum.repos.d/terabithia-xymon.repo':
      ensure  => file,
      content => template('xymon/terabithia-xymon.repo.erb')
    }
  }
}