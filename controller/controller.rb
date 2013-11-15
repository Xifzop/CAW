require 'sinatra'
require 'erb'
require 'rdiscount'
Dir.chdir '../model/'
require_relative '../model/provider'
Dir.chdir '../controller/'
include Provider

routes = Config_loader::ROUTE
set :views, '../views'
use Rack::Session::Pool, :expire_after => 2592000

puts "Bundling route mapping..."
routes.each { |url, view|
    get url do
        @_ = Provider::VAR_POOL[view.to_sym].call(params)
        erb view.to_sym, layout: (Provider::LAYOUT[view.to_sym] || :layout)
    end
}


