module Commands
    ACTIVATE = lambda{
        require 'fssm'
        current = Dir.pwd
        Dir.chdir './controller'
        spawn 'start cmd /c ruby controller.rb'
        Dir.chdir current
        m = Thread.start do
            require_relative 'util'
            include Util
            puts 'Server started..'
            Signal.trap('INT') { |signo|
                Util.kill_pid
                puts 'Server Quitted..'
                exit 0
            }
            #FSSM.monitor('config/', '**/*', directories: true) do
            FSSM.monitor do
                path 'config/' do
                    glob '**/*.yml'
                    update {|base, relative, type|
                        puts "##{type} modified: @#{base}/#{relative}."
                        Util.kill_pid
                        puts "Restarting Server..."
                        FUNCTIONS[ACTION].call
                    }
                end
                path 'controller/' do
                    glob '**/*.rb'
                    update {|base, relative, type|
                        puts "##{type} modified: @#{base}/#{relative}."
                        Util.kill_pid
                        puts "Restarting Server..."
                        FUNCTIONS[ACTION].call
                    }
                end
                path 'model/' do
                    glob '**/*.rb'
                    update {|base, relative, type|
                        puts "##{type} modified: @#{base}/#{relative}."
                        Util.kill_pid
                        puts "Restarting Server..."
                        FUNCTIONS[ACTION].call
                    }
                end
            end
        end
        m.join
    }
end