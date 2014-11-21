include_recipe 'lame::common'
include_recipe 'postgresql'
include_recipe 'postgis'
include_recipe 'ruby_install'
include_recipe 'chruby'
include_recipe 'git'
include_recipe 'nodejs'
include_recipe 'imagemagick'

# Prevents ssh timeout when installing ruby
Thread.new do
  loop do
    print "keep alive\n"
    sleep 60
  end
end

#install ruby
ruby_install_ruby 'ruby 2.1.3'

execute 'install bundler' do
  command 'chruby-exec 2.1.3 -- gem install bundle'
end

#set rails environment
template 'environment' do
  path '/etc/profile.d/env.sh'
end

#create required folders - recursive true does not set correct rights
%w[ /var/www /var/www/lame /var/www/lame/current/ /var/www/lame/current/public /var/www/lame/shared /var/www/lame/shared/config  ].each do |path|
  directory path do
    action :create
    mode '2775'
    only_if { !File.exists?(path) }
  end
end

#write database config
template '/var/www/lame/shared/config/database.yml' do
  source 'database.yml.erb'
end

template '/var/www/lame/shared/config/secrets.yml' do
  source 'rails_secrets.yml.erb'
end
