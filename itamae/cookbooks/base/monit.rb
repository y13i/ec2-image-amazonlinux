package "monit" do
  action  :install
  user    "root"
  options "--enablerepo=epel"
end

%w(
  auditd
  crond
  ntpd
  postfix
  rsyslog
  sshd
).each do |service_name|
  remote_file "/etc/monit.d/#{service_name}.conf" do
    action   :create
    user     "root"
    owner    "root"
    group    "root"
    mode     "0644"
    source   :auto
    notifies :restart, "service[monit]"
  end
end

service "monit" do
  action :enable
  user   "root"
end
