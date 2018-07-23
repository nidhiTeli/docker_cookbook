# To learn more about Custom Resources, see https://docs.chef.io/custom_resources.html
action :create
property :tag, String, name_property: true
property :dockerfile, String
action :create do
  package 'docker'
  
  service 'docker' do
    action :start
  end
  
  directory '/root/python'
  
  template #{dockerfile} do
    source 'Dockerfile.erb'
  end
  
  bash 'create python image using docker file' do
    cwd '/root/python/'
    code <<-EOH
    docker build -t #{tag} .
    EOH
  end 
end
