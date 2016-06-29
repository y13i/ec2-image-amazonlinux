Dir.glob("attributes/*.yml").each do |path|
  YAML.load_file(path).each do |key, value|
    node[key] = value
  end
end

require "net/http"

node.region = Net::HTTP.get("169.254.169.254", "/latest/meta-data/placement/availability-zone").chop
