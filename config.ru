$:.unshift __dir__ + '/lib'
$:.unshift __dir__ + '/controllers'
require_relative './boot'

map('/') { run RubyshoesApp::AppController }
map('/stores') { run RubyshoesApp::StoreController }
map('/brands') { run RubyshoesApp::BrandController }
