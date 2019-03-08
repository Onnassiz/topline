class ApplicationController < ActionController::API
  def index
    render :json => { app: "Test GraphQL API" }
  end
end
