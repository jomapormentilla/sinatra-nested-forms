require './environment'
require 'pry'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get '/' do
      "Welcome to the Nested Forms Lab!"
    end

    get '/new' do
      erb :'/pirates/new'
    end

    post '/pirates' do
      @pirate = Pirate.new(params[:pirate])

      params[:pirate][:ships].each do |ship|
        Ship.new(ship)
      end

      @ships = Ship.all

      erb :'/pirates/show'
    end
  end
end

# params =  {
#     "pirate"=>  {
#         "name"=>"Joma", 
#         "weight"=>"150", 
#         "booty"=>"60", 
#         "ships"=> [
#             {
#                 "name"=>"ShipOne", 
#                 "type"=>"Big", 
#                 "booty"=>"Long"
#             }, 
#             {
#                 "name"=>"ShipTo", 
#                 "type"=>"Medium", 
#                 "booty"=>"Short"
#             }
#         ]
#     }
# }
