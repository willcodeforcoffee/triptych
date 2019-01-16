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

    def generate_override_file_name(override_level, environment_name)
      "docker-compose.#{override_level}.#{environment_name}.yml"
    end

    def existing_file_names_from(file_names_array)
      file_names_array.map { |file_name| file_name if FileTest.exist?(file_name) }.compact
    end

    def open_files_as_hash_array(file_names_array)
      file_names_array.map { |file_name| YamlTools.open_yaml_as_hash(file_name) if FileTest.exist?(file_name) }.compact
    end
  end
end
