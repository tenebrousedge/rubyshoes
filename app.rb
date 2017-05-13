require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/rest'
require_relative './lib/rubyshoes'

if development?
  require 'sinatra/reloader'
  also_reload('**/*.rb')
end

# Sinatra App for Rubyshoes
class RubyshoesApp < Sinatra::Base
  def params
    super.symbolize
  end

  set :root, File.dirname(__FILE__)

  enable :method_override

  enable :sessions
    configure :production, :development do
      enable :logging
    end

  class AppController < RubyshoesApp
  end

  class StoreController < AppController
  end

  class BrandController < RubyshoesApp
  end

  run! if app_file == $PROGRAM_NAME
end

require_relative './controllers/app_controller'
require_relative './controllers/store_controller'
require_relative './controllers/brand_controller'
