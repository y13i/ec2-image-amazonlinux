package "https://amazon-ssm-#{node.region}.s3.amazonaws.com/latest/linux_amd64/amazon-ssm-agent.rpm" do
  action :install
  user   "root"
end

execute "start amazon-ssm-agent" do
  action :run
  user   "root"
  not_if "status amazon-ssm-agent | grep start/running"
end
