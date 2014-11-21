include_recipe 'lame::default'

#write database config
template '/var/www/lame/current/config/database.yml' do
  source 'database.yml.erb'
end
