remote_file "/etc/rc.d/init.d/set-rpsrfs" do
  action :create
  user   "root"
  owner  "root"
  group  "root"
  mode   "0755"
  source :auto
end

execute "chkconfig --add set-rpsrfs" do
  action :run
  user   "root"
  not_if "chkconfig set-rpsrfs"
  notifies :start, "service[set-rpsrfs]"
end

service "set-rpsrfs" do
  action :enable
  user   "root"
end
