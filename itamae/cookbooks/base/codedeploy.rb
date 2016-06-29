execute "install codedeploy-agent" do
  action :run
  user   "root"
  not_if "rpm -q codedeploy-agent"

  command <<-EOS
curl -s -o install_codedeploy https://aws-codedeploy-#{node.region}.s3.amazonaws.com/latest/install
chmod +x install_codedeploy
./install_codedeploy auto
rm -f install_codedeploy
  EOS
end

service "codedeploy-agent" do
  action :enable
  user   "root"
end
