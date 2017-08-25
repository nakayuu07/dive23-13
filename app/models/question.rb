class Question < ActiveRecord::Base
    validates :title, presence: true
    belongs_to :user
    has_many :answers, dependent: :destroy
    has_many :votes, dependent: :destroy
    default_scope -> { order(updated_at: :desc) }
end
