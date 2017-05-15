$LOAD_PATH.unshift __dir__ + '/lib'
$LOAD_PATH.unshift __dir__ + '/controllers'
require_relative './boot'

map('/') { run RubyshoesApp::AppController }
map('/stores') { run RubyshoesApp::StoreController }
map('/brands') { run RubyshoesApp::BrandController }
