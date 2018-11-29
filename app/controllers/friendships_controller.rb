class FriendshipsController < ApplicationController

  def index
    @users = User.all.where.not(id: current_user)
  end

  def create
    begin
      @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
      if @friendship.save
        flash[:notice] = "Added friend."
      else
        flash[:notice] = "Unable to add friend."
      end
      redirect_to friendships_path
    rescue ActiveRecord::RecordNotUnique
      flash[:notice] = "This user has already been added."
      redirect_to friendships_path
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to friendships_path
  end
end
