if node.yum.update_all
  execute "yum -y update" do
    action   :run
    user     "root"
    not_if   "test -f /home/ec2-user/yum_updated"
    notifies :create, "file[/home/ec2-user/yum_updated]"
  end

  file "/home/ec2-user/yum_updated" do
    action  :nothing
    owner   "ec2-user"
    group   "ec2-user"

    content <<-EOS
  yum updated at #{Time.now}
    EOS
  end
end

node.yum.packages.each do |package_name|
  package package_name do
    user    "root"
    action  :install
    options "--enablerepo=epel"
  end
end
