package "awslogs" do
  action :install
  user   "root"
end

service "awslogs" do
  action [:enable, :start]
  user   "root"
end

template "/etc/awslogs/awscli.conf" do
  action   :create
  user     "root"
  owner    "root"
  group    "root"
  mode     "0600"
  source   :auto
  notifies :restart, "service[awslogs]"

  variables(
    region: ENV["AWS_REGION"]
  )
end
