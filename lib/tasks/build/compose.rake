require_relative '../yaml_tools'

namespace :build do
  namespace :compose do
    desc 'Build/Generate docker-compose files for the appropriate environments'
    task files: :environment do
      time_stamp = Time.now.localtime.strftime('%Y-%m-%dT%H:%M:%S %Z')
      environments = ([ENV['RAILS_ENV']] if ENV.has_key?('RAILS_ENV'))  || ['development', 'production']
      puts "Generating for environment(s): #{environments.join(", ")}"
      for environment in environments
        override_file_name = "docker-compose.base.#{environment}.yml"

        base = YamlTools.open_yaml_as_hash('./docker-compose.base.yml')
        override = YamlTools.open_yaml_as_hash("./#{override_file_name}")
        result = base.deep_merge(override)

        result_file_name = if 'development' == environment
                             'docker-compose.yml'
                           else
                             "docker-compose.#{environment}.yml"
                           end

        puts "Generating #{result_file_name}"
        File.open(result_file_name, 'w') do |file|
          file.puts("# GENERATED FILE [#{time_stamp}] run `RAILS_ENV=#{environment} rake build:compose_files` to regenerate this file.")
          file.puts("# For #{environment} environment combined `docker-compose.base.yml` << `#{override_file_name}`")
          file.write(result.to_yaml)
        end
      end
    end
  end
end
