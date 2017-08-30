class Answer < ActiveRecord::Base
  validates :content, presence: true

  belongs_to :user
  belongs_to :question
  has_many :votes, dependent: :destroy

  def vote_user(user)
    votes.find_by(user_id: user.id)
  end
end
