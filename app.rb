require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'sinatra/rest'
require_relative './lib/rubyshoes'
require_relative './routes/brands'
require_relative './routes/stores'

if development?
  require 'sinatra/reloader'
  also_reload('**/*.rb')
end

# Sinatra App for Rubyshoes
class RubyshoesApp < Sinatra::Application
  def params
    super.symbolize
  end

  set :root, File.dirname(__FILE__)

  enable :sessions

  register Sinatra::Rshoes::Routing::Store
  register Sinatra::Rshoes::Routing::Store

  run! if app_file == $PROGRAM_NAME
end
