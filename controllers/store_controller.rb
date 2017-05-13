class RubyshoesApp
  # Controller class for Stores
  class StoreController
    M = Rubyshoes::Store

    get '/' do
      @stores = M.all
      haml :stores
    end

    get '/new' do
      @brands = Rubyshoes::Brand.all
      haml :new_store
    end

    get '/:id' do |id|
      @brands = Rubyshoes::Brand.all
      @store = M.find(id)
      haml :store
    end

    post '/' do
      new_store = params.fetch(:store)
      s = M.create(new_store)
      s.brands << params.fetch(:brand)
      @stores = M.all
      haml :stores
    end

    patch '/:id' do |id|
      new_data = params.fetch(:store)
      @store = M.find(id).update(new_data)
      @store.brands << params.fetch(:brand)
      redirect_back
    end

    delete '/:id' do |id|
      M.find(id).destroy
      redirect '/'
    end
  end
end
