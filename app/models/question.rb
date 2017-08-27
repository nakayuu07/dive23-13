class Question < ActiveRecord::Base
    validates :title, presence: true
    belongs_to :user
    has_many :answers, dependent: :destroy
    has_many :votes, dependent: :destroy
    has_many :favorites, dependent: :destroy
    default_scope -> { order(updated_at: :desc) }

    def favorite_by(user)
      favorites.find_by(user_id: user.id)
    end

    def vote_user(user_id)
      votes.find_by(user_id: user_id)
    end
end
