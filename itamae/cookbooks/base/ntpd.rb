file "/etc/sysconfig/ntpd" do
  action :create
  user   "root"
  owner  "root"
  group  "root"
  mode   "0644"
end
