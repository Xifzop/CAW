
activate = lambda{
    current = Dir.pwd
    Dir.chdir './controller'
    exec('ruby controller.rb')
    Dir.chdir current
}

FUNCTIONS = {
    :launch => activate
}

FUNCTIONS[ARGV[0].to_sym].call unless ARGV[0].nil?