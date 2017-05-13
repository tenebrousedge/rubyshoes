# Controller class for Brands
class BrandsController < Sinatra::Base
  def params
    super.symbolize
  end

  M = Rubyshoes::Brand

  get '/brands' do
    @brands = M.all
    haml :brands
  end

  get '/brands/new' do
    haml :new_brand
  end

  get '/brands/:id' do |id|
    @brand = M.find(id)
    haml :brand
  end

  post '/brands' do
    new_brand = params.fetch(:brand)
    M.create(new_brand)
    @brands = M.all
    haml :brands
  end

  patch '/brands/:id' do |id|
    new_data = params.fetch(:brand)
    @brand = M.find(id).update(new_data)
    redirect_back
  end

  delete '/brands/:id' do |id|
    M.find(id).destroy
    redirect '/brands'
  end
end
