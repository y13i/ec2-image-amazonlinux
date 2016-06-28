package "jq" do
  action :install
  user   "root"
end

remote_file "/etc/profile.d/_ec2_env.sh" do
  action :create
  user   "root"
  owner  "root"
  group  "root"
  mode   "0644"
  source :auto
end
