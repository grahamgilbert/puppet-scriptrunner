define scriptrunner::every(
    $script,
    $priority = $scriptrunner::priority
){
    require scriptrunner::setup

    file {"/Library/Management/scriptRunner/every/${priority}-${title}":
        source => $script,
        owner  => 0,
        group  => 0,
        mode   => '0755',
    }

}