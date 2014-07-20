class scriptrunner::setup{
    include scriptrunner
    if ! defined(File['/Library/Management/scriptRunner']) {
      file { '/Library/Management/scriptRunner':
        ensure => directory,
      }
    }

    if ! defined(File['/Library/Management/scriptRunner/once']) {
      file { '/Library/Management/scriptRunner/once':
        ensure => directory,
      }
    }

    if ! defined(File['/Library/Management/scriptRunner/every']) {
      file { '/Library/Management/scriptRunner/every':
        ensure => directory,
      }
    }

    file {'/Library/LaunchAgents/com.grahamgilbert.scriptrunner.plist':
        owner  => root,
        group  => wheel,
        mode   => '0644',
        source => 'puppet:///modules/scriptrunner/com.grahamgilbert.scriptrunner.plist'
    }

    if ! defined(File['/usr/local']) {
      file { '/usr/local':
        ensure => directory,
      }
    }

    if ! defined(File['/usr/local/bin']) {
      file { '/usr/local/bin':
        ensure => directory,
      }
    }

    file{'/usr/local/bin/scriptRunner.py':
        owner  => root,
        group  => wheel,
        mode   => '0755',
        source => 'puppet:///modules/scriptrunner/scriptRunner.py'
    }

}