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
end
