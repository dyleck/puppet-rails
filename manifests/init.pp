class newrails ($rvm_downgrade=true) {
  system_rvm { "1.26.1":
    ensure => present,
    downgrade => $rvm_downgrade,
  }
}
