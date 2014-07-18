class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :pin_id

      t.timestamps
    end
  end
end
