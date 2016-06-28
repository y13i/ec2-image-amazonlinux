execute "curl -s https://s3.amazonaws.com/download.draios.com/stable/install-sysdig | bash" do
  action :run
  user   "root"
  not_if "rpm -q sysdig"
end
