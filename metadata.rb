name             'phabricator'
maintainer       'Jelmer Snoeck'
maintainer_email 'jelmer.snoeck@gmail.com'
license          'BSD'
description      'Chef cookbook to install Phabricator'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

depends 'git'
depends 'mysql'
depends 'nginx'
depends 'php'
depends 'php-fpm'
depends 'runit'
