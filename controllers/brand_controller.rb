class RubyshoesApp
  # Controller class for Brands
  class BrandController
    M = Rubyshoes::Brand


    get '/new' do
      haml :new_brand
    end

    get '/:id' do |id|
      @brand = M.find(id)
      haml :brand
    end

    get '/' do
      @brands = M.all
      haml :brands
    end

    post '/' do
      new_brand = params.fetch(:brand)
      M.create(new_brand)
      @brands = M.all
      haml :brands
    end

    patch '/:id' do |id|
      new_data = params.fetch(:brand)
      @brand = M.find(id).update(new_data)
      redirect back
    end

    delete '/:id' do |id|
      M.find(id).destroy
      redirect '/'
    end
  end
end
