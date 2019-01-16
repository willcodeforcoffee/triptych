require_relative '../yaml_tools'

namespace :build do
  namespace :compose do
    desc 'Build/Generate docker-compose files for the appropriate environments'
    task files: :environment do
      time_stamp = Time.now.localtime.strftime('%Y-%m-%dT%H:%M:%S %Z')
      environments = ([ENV['RAILS_ENV']] if ENV.has_key?('RAILS_ENV'))  || ['development', 'production']
      puts "Generating for environment(s): #{environments.join(", ")}"
      for environment in environments
        # First get the base files then the base overrides then local overrides
        file_names = YamlTools.existing_file_names_from([
          './docker-compose.base.yml',
          "./#{YamlTools.generate_override_file_name('base', environment)}",
          './docker-compose.local.yml',
          "./#{YamlTools.generate_override_file_name('local', environment)}",
        ])
        file_hashes = YamlTools.open_files_as_hash_array(file_names)

        result = {}
        file_hashes.each { |file_hash| result = result.deep_merge(file_hash) }

        result_file_name = if 'development' == environment
                             'docker-compose.yml'
                           else
                             "docker-compose.#{environment}.yml"
                           end

        puts "Generating #{result_file_name}"
        File.open(result_file_name, 'w') do |file|
          file.puts("# GENERATED FILE [#{time_stamp}] run `RAILS_ENV=#{environment} rake build:compose_files` to regenerate this file.")
          file.puts("# For #{environment} environment combined `docker-compose.base.yml` << `#{file_names.join("`, `")}`")
          file.write(result.to_yaml)
        end
      end
    end
  end
end
