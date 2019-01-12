class Client::TeamsController < ApplicationController
  def index
    client_params = {
                    search: params[:search],
                    sort_by: params[:sort_by],
                    sort_order: params[:sort_order],
                    category: params[:category]
                    }
    response = Unirest.get(
                          "http://localhost:3000/api/teams",
                          parameters: client_params
                          )
    @teams = response.body
    render 'index.html.erb'
      
  end

  def new
    @team = {}
    render 'new.html.erb'    
  end 

  def create
    client_params = {
                    name: params[:name],
                    points_allowed: params[:points_allowed],
                    points_scored: params[:points_scored],
                    avg_age: params[:avg_age]
                    }
    response = Unirest.post(
                            "http://localhost:3000/api/teams",
                            parameters: client_params
                            )
    if response code == 200
      session[:team_id] = response.body["id"]
      flash[:success] = "Successfully created team!"
      redirect to '/login'
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to 'client/signup'
    end
  end

  def show
    team_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/teams/#{team_id}")
    @team = response.body
    render 'show.html.erb'
  end

  def destroy
    team_id = params[:id]
    response = Unirest.delete("http://localhost:3000/api/teams/#{team_id}")
    redirect_to "/client/teams"
  end


end
