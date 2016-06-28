Dir.glob("attributes/*.yml").each do |path|
  YAML.load_file(path).each do |key, value|
    node[key] = value
  end
end
