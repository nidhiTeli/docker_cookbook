# Cookbook:: docker
# Recipe:: default

docker_image 'python:3.6.5' do
  dockerfile '/root/python/Dockerfile'
  action :create
end
