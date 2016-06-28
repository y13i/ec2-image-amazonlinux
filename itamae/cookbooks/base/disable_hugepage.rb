remote_file "/etc/rc.d/init.d/disable-hugepage" do
  action :create
  user   "root"
  owner  "root"
  group  "root"
  mode   "0755"
  source :auto
end

execute "chkconfig --add disable-hugepage" do
  action :run
  user   "root"
  not_if "chkconfig disable-hugepage"
  notifies :start, "service[disable-hugepage]"
end

service "disable-hugepage" do
  action :enable
  user   "root"
end
