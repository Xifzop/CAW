require_relative 'db_conn'
require 'find'

META = Config_loader::CONFIG['meta']
DEBUG = META['DEBUG']
POSTFIX = META['DAO_POSTFIX']

puts "Now loading DAO class..."
Find.find META['DAO_DIR'] do |path|
    dao = File.basename path, POSTFIX || 'dao'
    if dao != 'dao'
        require_relative(META['DAO_DIR'] + dao)
        puts "#Loading dao class: #{dao}" if DEBUG == 1
    end
end





