require './environment'

module FormsLab
  class App < Sinatra::Base
    # code other routes/actions here
    get '/' do
      erb :root
    end

    get '/new' do
      erb :'pirates/new'
    end

    post '/pirates' do
      @captain = Pirate.new(params[:pirate])
        params[:pirate][:ships].each do |x|
          Ship.new(x)
        end

      @boat1 = Ship.all.first
      @boat2 = Ship.all.last
      erb :'pirates/show'
    end

  end
end
