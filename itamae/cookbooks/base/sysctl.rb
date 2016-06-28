file "/etc/sysctl.d/01-tunings.conf" do
  action   :create
  user     "root"
  owner    "root"
  group    "root"
  mode     "0644"
  content  node.sysctl.parameters.map {|k, v| "#{k} = #{v.inspect}\n"}.join
  notifies :run, "execute[/usr/local/sbin/apply_sysctl; true]"
end

remote_file "/usr/local/sbin/apply_sysctl" do
  action :create
  user   "root"
  owner  "root"
  group  "root"
  mode   "0755"
  source :auto
end

execute "/usr/local/sbin/apply_sysctl; true" do
  action :nothing
  user   "root"
end
