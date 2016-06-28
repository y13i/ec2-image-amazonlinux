remote_file "/etc/logrotate.conf" do
  action :create
  user   "root"
  owner  "root"
  group  "root"
  mode   "0644"
  source :auto
end
