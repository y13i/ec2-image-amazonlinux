file "/etc/modprobe.d/ipv6.conf" do
  action  :create
  user    "root"
  owner   "root"
  group   "root"
  mode    "0644"
  content "options ipv6 disable=#{node.ipv6 ? 0 : 1}\n"
end
