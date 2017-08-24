class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
        t.references :user, index: true, foreign_key: true
        t.references :question, index: true, foreign_key: true
        t.references :answer, index: true, foreign_key: true
        t.integer  :plus_or_minus, default: 0, null: false
      t.timestamps null: false
    end
  end
end
