class CreateOwnerships < ActiveRecord::Migration
  def change
    create_table :ownerships do |t|
      t.references :link, index: true
      t.references :user, index: true
      t.references :organization, index: true
    end
  end
end
