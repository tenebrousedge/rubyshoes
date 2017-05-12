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

  get('/') do
    erb(:index)
  end

  run! if app_file == $PROGRAM_NAME
end
