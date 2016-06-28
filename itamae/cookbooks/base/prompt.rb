remote_file "/etc/profile.d/prompt.sh" do
  action :create
  user   "root"
  owner  "root"
  group  "root"
  mode   "0644"
  source :auto
end
