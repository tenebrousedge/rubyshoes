require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra-flash'
require 'rubyshoes'

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

  rest Rubyshoes::Brand, renderer: :haml
  rest Rubyshoes::Store, renderer: :haml

  run! if app_file == $PROGRAM_NAME
end
