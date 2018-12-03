class FriendshipsController < ApplicationController

  def index
    @users = (current_user.friends + current_user.inverse_friends).uniq
    @his_block = []
    @your_block = []
    @friends = []
    @your_request = []
    @his_request = []
    @users.each do |user|
      status = current_user.friendship_status(user)
      if status == 'his block'
        @his_block << user
      elsif status == 'your block'
        @your_block << user
      elsif status == 'friends'
        @friends << user
      elsif status == 'your request'
        @your_request << user
      elsif status == 'his request'
        @his_request << user
      end
    end
  end

  def create

    begin
      @friendship = current_user.friendships.build(friend_id: params[:friend_id])
      if @friendship.save
        flash[:notice] = "Added friend."
      else
        flash[:notice] = "Unable to add friend."
      end
      redirect_back(fallback_location: friendships_path)
    rescue ActiveRecord::RecordNotUnique
      flash[:notice] = "This user has already been added."
      redirect_back(fallback_location: friendships_path)
    end
  end

  def destroy
    # begin
      @friendship = current_user.friendships.find(params[:id])
    # rescue
    #   @friendship = current_user.inverse_friendships.find(params[:id])
    # end
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_back(fallback_location: friendships_path)
  end

  def block
    friendship = current_user.friendships.find_by(friend_id: params[:block_user])
    friendship = current_user.friendships.build(friend_id: params[:block_user]) if friendship.nil?
    friendship.update_attribute(:blocked_by_user_id, current_user.id)
    flash[:notice] = "Friendship was blocked."
    redirect_back(fallback_location: friendships_path)
  end

  def unblock
    friendship = current_user.friendships.find_by(friend_id: params[:unblock_user])
    friendship.update_attribute(:blocked_by_user_id, 0)
    flash[:notice] = "Friendship was unblocked."
    redirect_back(fallback_location: friendships_path)
  end
end
