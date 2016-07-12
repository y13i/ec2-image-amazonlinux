template "/etc/sysconfig/ntpd" do
  action :create
  user   "root"
  owner  "root"
  group  "root"
  mode   "0644"
  source :auto
  notifies :restart, "service[ntpd]"
end
