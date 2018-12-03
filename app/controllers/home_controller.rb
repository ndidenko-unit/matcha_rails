class HomeController < ApplicationController
  def index
    session[:conversations] ||= []
    @users = current_user.friends.select { |user| user.friendship_status(current_user) == 'friends' }
    @conversations = Conversation.includes(:recipient, :messages)
                         .find(session[:conversations])
  end
end
