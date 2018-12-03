class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :messages
  has_many :conversations, foreign_key: :sender_id

  has_many :friendships
  has_many :friends, :through => :friendships

  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  def friendship_status(user)
    if self.inverse_friendships.find_by(user_id: user.id).present? &&
        self.inverse_friendships.find_by(user_id: user.id).blocked_by_user_id > 0
      'his block'
    elsif self.friendships.find_by(friend_id: user.id).present? &&
        self.friendships.find_by(friend_id: user.id).blocked_by_user_id > 0
      'your block'
    elsif self.friendships.find_by(friend_id: user.id).present? &&
        self.inverse_friendships.find_by(user_id: user.id).present?
      'friends'
    elsif self.friendships.find_by(friend_id: user.id).present? &&
          !self.inverse_friendships.find_by(user_id: user.id).present?
      'your request'
    elsif !self.friendships.find_by(friend_id: user.id).present? &&
        self.inverse_friendships.find_by(user_id: user.id).present?
      'his request'
    else
      'no requests'
    end
  end

  def friendship_with(user)
    # friendship =
        self.friendships.find_by(friend_id: user.id)
    # if friendship.nil?
    #     #   self.inverse_friendships.find_by(user_id: user.id)
    #     # end
  end
end
