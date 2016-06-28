template "/etc/sysconfig/clock" do
  user   "root"
  action :create
  owner  "root"
  group  "root"
  mode   "0644"
  source :auto

  variables(
    timezone: node.timezone,
  )
end

link "/etc/localtime" do
  user   "root"
  action :create
  to     "/usr/share/zoneinfo/#{node.timezone}"
  force  true
end
