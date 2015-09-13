class rails::rvm ($rvm_downgrade=false,
                  $rvm_version="any",
                  $action=install,
                  $manage_gpg=false,
                 ) {
  if $action == install {
    $ensure = present
  }
  else {
    $ensure = absent
  }

  if $manage_gpg {
    require 'rails::rvm::gpgkey'
  }

  rvm { $rvm_version:
    ensure => $ensure,
    downgrade => $rvm_downgrade,
  }
}
