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

set :public_folder, File.absolute_path('../_static')

puts "Bundling route mapping.."
routes.each { |url, view|
    get url do
        @_ = Provider::VAR_POOL[view.to_sym].call(params)
        erb view.to_sym, layout: (Provider::LAYOUT[view.to_sym] || :layout)
    end
}

get %r{/([\w]+)\.(jpg|png|gif)}  do
    (file, exp) = params[:captures]
    file_name = "#{file}.#{exp}"
    if File.exists? file_name
        send_file file_name
    else
        pass
    end
end


post '/index' do
    request.body.rewind  # 如果已经有人读了它
    #data = JSON.parse request.body.read
    #content = request.body.read
    #puts content
=begin
    puts request.form_data?
    puts request.media_type
    puts request.instance_variable_names
=end
    #puts request.env.keys
    form_data = request.env['rack.request.form_hash']
    current_dir = Dir.pwd
    img_url = ''
    form_data['files'].each { |file_info|
        file_name = file_info[:filename]
        file_type = file_info[:type]
        tmp_file = file_info[:tempfile]
        content = tmp_file.read
        img = File.open(file_name, 'wb') do |file|
            file.write content
        end
        img_url = '/' + file_name
    }
    img_url
end

=begin
status, headers, body = call env.merge("PATH_INFO" => '/bar')
[status, headers, body.map(&:upcase)]
=end

error do
    'Sorry there was a nasty error - ' + env['sinatra.error'].name
end

not_found do
    #redirect , 'wrong place, buddy'
    '404~~'
end

