# Install latest phpMyAdmin

class phpmyadmin::install {

  # Get a new copy of the latest phpMyAdmin release
  # FILE TO DOWNLOAD: https://files.phpmyadmin.net/phpMyAdmin/4.6.6/phpMyAdmin-4.6.6-all-languages.tar.gz
  # !!Issue!! - currently not direct download URL

  exec { 'download-phpmyadmin': #tee hee
    command => '/usr/bin/wget https://files.phpmyadmin.net/phpMyAdmin/4.6.6/phpMyAdmin-4.6.6-all-languages.tar.gz -O /vagrant/phpmyadmin.tar.gz',
    cwd     => '/vagrant/',
    creates => '/vagrant/phpmyadmin.tar.gz'
  }

  exec { 'untar-phpmyadmin':
    cwd     => '/vagrant/',
    command => '/bin/tar -xzvf /vagrant/phpmyadmin.tar.gz',
    require => Exec['download-phpmyadmin'],
    creates => '/vagrant/phpMyAdmin-4.6.6-all-languages'
  }

  exec { "move-phpmyadmin":
    path    => ['/usr/bin','/usr/sbin','/bin','/sbin'],
    cwd     => '/vagrant/',
    command => "/bin/cp -Rf /vagrant/phpMyAdmin-4.6.6-all-languages/* /vagrant/sites/db/",
    require => Exec['untar-phpmyadmin'],
    returns => [0,1]
  }

  exec { "owner-phpmyadmin":
    path    => ['/usr/bin','/usr/sbin','/bin','/sbin'],
    cwd     => '/vagrant/',
    command => "/bin/chown -Rf vagrant.vagrant /sites/db/*",
    require => Exec['move-phpmyadmin'],
    returns => [0,1]
  }

  exec { "permissions-phpmyadmin":
    path    => ['/usr/bin','/usr/sbin','/bin','/sbin'],
    cwd     => '/vagrant/',
    command => "/bin/chmod -Rf ug+rw /sites/db/*",
    require => Exec['move-phpmyadmin'],
    returns => [0,1]
  }

}
