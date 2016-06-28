template "/etc/sudoers" do
  action :create
  user   "root"
  owner  "root"
  group  "root"
  mode   "0440"
  source :auto

  variables(
    allow_wheel: node.sudo.allow_wheel,
    require_tty: node.sudo.require_tty,
  )
end
