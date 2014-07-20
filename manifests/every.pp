define scriptrunner::every(
    $script,
    $priority = '10',
    $ensure = 'present'
){
    require scriptrunner::setup

    if $ensure != 'present' and $ensure !='absent'{
        fail('Invalid value for ensure')
    }

    if $ensure == 'present'{
        file {"/Library/Management/scriptRunner/every/${priority}-${title}":
            source => $script,
            owner  => 0,
            group  => 0,
            mode   => '0755',
        }
    }

    if $ensure == 'absent' {
        file {"/Library/Management/scriptRunner/every/${priority}-${title}":
            ensure => absent,
        }
    }

}