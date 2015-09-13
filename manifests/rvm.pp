class rails::rvm ($rvm_downgrade=false,
                  $rvm_version="any",
                  $action=install,
                 ) {
  if $action == install {
    $ensure = present
  }
  else {
    $ensure = absent
  }

  require 'rails::rvm::gpgkey'

  rvm { $rvm_version:
    ensure => $ensure,
    downgrade => $rvm_downgrade,
  }
}
