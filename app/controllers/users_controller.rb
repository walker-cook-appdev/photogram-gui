class UsersController < ApplicationController

  def index
    matching_users = User.all
    @list_of_users = matching_users.order({:username => :asc})
    render(:template => "user_templates/index.html.erb")
  end

  def show
  url_username = params.fetch("path_username")
  matching_usernames = User.where({:username => url_username})

  @the_user = matching_usernames.at(0)


  render(:template => "user_templates/show.html.erb")
  end

def insert_user
input_username = params.fetch("input_username")
new_user = User.new
new_user.username = input_username
new_user.save

redirect_to("/users/" + new_user.username)
end

def update_user

  user_id = params.fetch("path_id")
  matching_usernames = User.where({:id => user_id})

  user = matching_usernames.at(0)

  new_username = params.fetch("input_username")
  user.username = new_username
  user.save
  
  redirect_to("/users/" + user.username)
  end


end
