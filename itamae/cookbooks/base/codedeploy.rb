execute "install codedeploy-agent" do
  action :run
  user   "root"
  not_if "rpm -q codedeploy-agent"

  command <<-EOS
aws s3 cp s3://aws-codedeploy-us-east-1/latest/install .
chmod +x install
./install auto
rm -f install
  EOS
end

service "codedeploy-agent" do
  action [:enable, :start]
  user   "root"
end
