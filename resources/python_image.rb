# To learn more about Custom Resources, see https://docs.chef.io/custom_resources.html
resource_name :docker_image
property :tag, String, name_property: true

property :dockerfile, String

action :create do
  package 'docker'
  
  service 'docker' do
    action :start
  end
  
  directory '/root/python'
  
  template '/root/python/Dockerfile' do
    source 'Dockerfile.erb'
  end
  
  bash 'create python image' do
    cwd '/root/python/'
    code <<-EOH
    docker build -t #{tag} .
    EOH
  end
end
