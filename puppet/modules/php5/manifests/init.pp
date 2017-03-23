# Install PHP

class php5::install {

  package { [
      'php5',
      'php5-mysql',
      'php5-curl',
      'php5-gd',
      'php5-fpm',
      'libapache2-mod-php5',
    ]:
    ensure => present,
  }
  
}

# PHP config http://stackoverflow.com/questions/10800199/set-config-value-in-php-ini-with-puppet;
augeas { 'php_dev_config':
  context => '/files/etc/php5/apache2/php.ini/PHP',
  changes => [
    'set max_execution_time 60',
    'set max_input_time 90',
    'set memory_limit 256M',
    'set post_max_size 34M',
    'set upload_max_filesize 32M',

    'set error_reporting E_ALL | E_STRICT',

    'set display_errors On',
    'set display_startup_errors On',
    'set html_errors On',
  ],
  require => Package['php5'],
  notify => Exec['reload apache']
}
