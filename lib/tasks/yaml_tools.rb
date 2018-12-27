require 'pathname'
require 'yaml'

class YamlTools
  class << self
    def open_yaml_as_hash(file_name)
      file_path = Pathname.new(file_name)
      raw_yaml = File.read(file_path)
      YAML.safe_load(raw_yaml)
    end

    def write_hash_to_yaml(hash, file_name)
      File.open(file_name, 'w') do |file|
        file.write(hash.to_yaml)
      end
    end
  end
end
