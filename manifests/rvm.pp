class rails::rvm ($rvm_downgrade=false,
                  $rvm_version="any",
                 ) {
  rvm { $rvm_version:
    ensure => present,
    downgrade => $rvm_downgrade,
  }
}
