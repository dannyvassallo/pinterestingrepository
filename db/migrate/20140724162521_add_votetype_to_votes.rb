class AddVotetypeToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :votetype, :string
  end
end
