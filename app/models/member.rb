class Member < ApplicationRecord
    has_many :friendships
    has_many :friends, through: :friendships
    has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
    has_many :inverse_friends, through: :inverse_friendships, source: :member

    validates :first_name, :last_name, :url, presence: true

    attribute :my_friends

    def my_friends
        friends
    end

end
