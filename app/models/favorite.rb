class Favorite < ActiveRecord::Base
  belongs_to :question, counter_cache: :favorites_count
  belongs_to :user
end
