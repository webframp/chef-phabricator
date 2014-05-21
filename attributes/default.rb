default['phabricator']['username'] = 'admin'
default['phabricator']['email'] = 'jelmer@siphoc.com'
default['phabricator']['password'] = 'root'

default['phabricator']['domain'] = 'phabricator.dev'

default['phabricator']['user'] = 'phabricator'
default['phabricator']['db_user'] = 'root'
default['phabricator']['directory'] = '/home/phabricator'
default['phabricator']['mysql_conf_d'] = '/etc/mysql/conf.d'
default['phabricator']['php_conf_d'] = '/etc/php5/conf.d'

# phabricator config saved into conf/local/local.json
# see ./bin/config list for available configuration
default['phabricator']['config'] = {
    'environment.append-paths' => ['/usr/bin', '/usr/local/bin'],
    # TODO: fix port
    'phabricator.base-uri' => 'http://phabricator.dev:4567',
    'repository.default-local-path' => '/var/repo',
    'storage.upload-size-limit' => '10M',

    # mysql connection params
    'mysql.host' => 'localhost',
    'mysql.port' => '3306',
    'mysql.user' => 'root',
    'mysql.pass' => '',
}
