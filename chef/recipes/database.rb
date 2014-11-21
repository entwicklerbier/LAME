node.default['postgresql']['config']['listen_addresses'] = node['database']['listen_addresses']

node['database']['create'].each do |database|
  node.default['postgresql']['pg_hba'].push({:comment => '# App servers', :type => 'host', :db => database['name'], :user => database['username'], :addr => node['database']['listen_range'], :method => 'md5'})
end

include_recipe 'lame::common'

include_recipe 'postgresql::server'
include_recipe 'database::postgresql'

# create databases defined in node config
node['database']['create'].each do |database|
  connection_info = {
    :host      => '127.0.0.1',
    :port      => 5432,
    :username  => 'postgres',
    :password  => node['postgresql']['password']['postgres']
  }

  postgresql_database_user database['username'] do
    connection connection_info
    password database['password']
    action :create
  end

  postgresql_database database['name'] do
    connection connection_info
    owner database['username']
    action :create
  end
end
