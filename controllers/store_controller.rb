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
      s.brands << Rubyshoes::Brand.find(params.dig(:brand, :id))
      @stores = M.all
      haml :stores
    end

    patch '/:id' do |id|
      new_data = params.fetch(:store)
      @store = M.find(id)
      @store.update(new_data)
      @store.brands << Rubyshoes::Brand.find(params.dig(:brand, :id))
      redirect back
    end

    delete '/:id' do |id|
      M.find(id).destroy
      redirect '/'
    end
  end
end
