class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :pin, index: true
      t.references :user, inex: true
      t.text :body
      t.timestamps
    end
  end
end
