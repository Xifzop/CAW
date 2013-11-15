module Config_loader
    require 'yaml'
    begin
        puts 'Loading configuration...'
        CONFIG = YAML::load(File.open('../config/config.yml'))
        ROUTE = YAML::load(File.open('../config/route_map.yml'))
        puts 'Loading configuration successfully.'
    rescue
        puts 'Loading configuration err...'
        exit 0
    end
end