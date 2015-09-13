class rails::rvm::gpgkey {
  package { "gnupg2":
    ensure => present,
  }

  rvmgpgkey { "409B6B1796C275462A1703113804BB82D39DC0E3": 
    ensure => present,
    require => Package[gnupg2],
  }
}

