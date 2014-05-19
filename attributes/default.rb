default['phabricator']['username'] = 'admin'
default['phabricator']['email'] = 'jelmer@siphoc.com'
default['phabricator']['password'] = 'root'

default['phabricator']['domain'] = 'phabricator.dev'

# user to own the checked out files
default['phabricator']['user'] = 'phabricator'
# dir where phabricator and deps are installed
default['phabricator']['directory'] = '/home/phabricator'

# ngix service name, maybe different on platforms
default['phabricator']['nginx']['service'] = 'nginx'

# phabricator config saved into conf/local/local.json
# see ./bin/config list for available configuration
default['phabricator']['config'] = {
    'environment.append-paths' => ['/usr/bin', '/usr/local/bin'],
    # TODO: fix port
    'phabricator.base-uri' => 'http://phabricator.dev:4567',

    # mysql connection params
    'mysql.host' => 'localhost',
    'mysql.port' => 3306,
    'mysql.user' => 'root',
    'mysql.pass' => '',
}
