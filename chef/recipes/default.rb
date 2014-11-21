#
# Cookbook Name:: lame
# Recipe:: default
#
# Copyright (C) 2014 Markus Klepp
#
# All rights reserved - Do Not Redistribute
#

#own recipes
include_recipe 'lame::web'
include_recipe 'lame::database'
include_recipe 'lame::redis'
