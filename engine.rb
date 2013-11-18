require_relative 'cmds'
include Commands

FUNCTIONS = {
    :launch => Commands::ACTIVATE,
    :default => lambda{},
}

ACTION = ARGV[0].to_sym unless ARGV[0].nil?
FUNCTIONS[ACTION].call