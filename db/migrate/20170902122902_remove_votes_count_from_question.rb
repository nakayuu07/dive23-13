class RemoveVotesCountFromQuestion < ActiveRecord::Migration
  def change
    remove_column :questions, :votes_count, :integer
  end
end
