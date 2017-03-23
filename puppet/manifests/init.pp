# Define puppet run order customization
stage { 'setup':
  require => Stage['main'],
}

stage { 'final':
  require => Stage['setup'],
}

exec { 'apt_update':
  command => 'apt-get update',
  path    => '/usr/bin'
}

class { 'git::install': }
class { 'apache2::install': }
class { 'php5::install': }
class { 'mysql::install': }

class { 'wordpress::install': stage => 'setup' }
class { 'phpmyadmin::install': stage => 'setup' }

class { 'cleanup::install': stage => 'final' }
