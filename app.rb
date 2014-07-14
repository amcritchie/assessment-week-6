require "sinatra"
require "active_record"
require "rack-flash"
require "./lib/database_connection"

class App < Sinatra::Application
  enable :sessions
  use Rack::Flash

  def initialize
    super
    @database_connection = DatabaseConnection.establish(ENV["RACK_ENV"])
  end

  get "/" do
    # @string = "SELECT username,id FROM users"
    # if session[:user_id]
    #   puts "We still have a session id #{session[:id]}"
    # end
    # if params[:order] == "asc"
    #   @string += " ORDER BY username ASC"
    # elsif params[:order] == "desc"
    #   @string += " ORDER BY username DESC"
    # end
    erb :root#, :locals => {:send => @string}
  end

  post "/search" do
    if set_of_parks == "two"

    end
  end

  post "/add" do
    @database_connection.sql("INSERT INTO parks (id, name, state, country) VALUES ('#{params[:id]}', '#{params[:name]}','#{params[:state]}', '#{params[:country]}')")
    redirect "/"
  end
end

