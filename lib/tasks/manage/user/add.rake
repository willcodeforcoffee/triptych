require_relative '../../rake_helper.rb'

namespace :manage do
    namespace :user do
        desc "Add a user: [email,password]"
        task :add, [:email, :password] => :environment do |_t, args|
            unless args[:email].present? && args[:password].present?
                puts "Email and password are required".colorize(:yellow)
                exit -1
            end

            user = User.new(:email => args[:email], :password => args[:password])
            if !user.valid?
                puts "User is not valid:".colorize(:yellow)
                user.errors.each do |key|
                    puts "\t#{key.to_s}:".colorize(:yellow)
                    user.errors[key].each do |message|
                        puts "\t\t#{message}".colorize(:red)
                    end
                end
            elsif user.save
                puts "User #{args[:email]} created successfully".colorize(:green)
            else
                puts "Saving the user failed".colorize(:red)
            end
        end
    end
end
