class Client::PlayersController < ApplicationController

  def index
    client_params = {
                    search: params[:search],
                    sort_by: params[:sort_by],
                    sort_order: params[:sort_order],
                    category: params[:category]
                    }
    response = Unirest.get(
                          "http://localhost:3000/api/players",
                          parameters: client_params
                          )
    @players = response.body
    render 'index.html.erb'
        
  end

  def new
    @player = {}
    render 'new.html.erb'
  end

end
