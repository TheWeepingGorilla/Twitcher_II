class CreateTables < ActiveRecord::Migration
  def change
    create_table :twitches do |t|
      t.string   :content
      t.integer  :user_id
    end
    create_table :followers do |t|
      t.integer  :user_id
      t.integer  :follower_id
    end
  end
end
