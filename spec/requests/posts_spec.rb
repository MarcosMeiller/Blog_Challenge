require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /index" do
    it 'get all' do
      get('/posts')
      expect(response.body).to eq("{\"post\":[],\"status\":\"ok\"}")
    end
  
 
end
#describe "Post" do
  #it 'post create' do
    #headers = { "ACCEPT" => "application\json" }
    #post '/posts', :params => {:title => "titulo",:content => "bla bla",:image =>"url",:date_creation => "fecha"}, :headers => headers 
    #expect(response.context_type).to eq("application\json")
   # expect(response).to have_http_status(:created)

 # end
end
