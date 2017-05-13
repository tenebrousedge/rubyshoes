class RubyshoesApp
  # AppController class
  # Hello again, MVC
  class AppController
    get '/' do
      haml :index
    end
  end
end
