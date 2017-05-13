# Controller class for Stores
class StoresController < Sinatra::Base
  def params
    super.symbolize
  end

  M = Rubyshoes::Store

  get '/stores' do
    @stores = M.all
    haml :stores
  end

  get '/stores/new' do
    haml :new_store
  end

  get '/stores/:id' do |id|
    @store = M.find(id)
    haml :store
  end

  post '/stores' do
    new_store = params.fetch(:store)
    M.create(new_store)
    @stores = M.all
    haml :stores
  end

  patch '/stores/:id' do |id|
    new_data = params.fetch(:store)
    @store = M.find(id).update(new_data)
    redirect_back
  end

  delete '/stores/:id' do |id|
    M.find(id).destroy
    redirect '/stores'
  end
end
