class Vote < ActiveRecord::Base
  belongs_to :question, counter_cache: :votes_count
  belongs_to :user
  belongs_to :answer
end
