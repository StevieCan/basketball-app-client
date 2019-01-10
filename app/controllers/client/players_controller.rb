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

  def create
    client_params = {
                    name: params[:name],
                    position: params[:position],
                    age: params[:age],
                    points: params[:points],
                    team: params[:team]
                    }
    response = Unirest.post(
                            "http://localhost:3000/api/players",
                            parameters: client_params
                            )
    if response code == 200
      session[:player_id] = response.body["id"]
      flash[:success] = 'Successfully created player!'
      redirect to '/login'
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to 'client/signup'
    end
  end

  def show
    player_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/players/#{player_id}")
    @player = resonse.body
    render 'show.html.erb'
  end

  def destroy
    player_id = params[:id]
    response = Unirest.delete("http://localhost:3000/api/players/#{player_id}")
    redirect_to "/client/players"
  end


end
