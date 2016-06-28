["iptables", "ip6tables"].each do |iptables|
  service iptables do
    user "root"

    action(node[iptables].enabled ? :enable : :disable)
  end
end
