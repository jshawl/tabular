class CreateMembership < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :organization, index: true
      t.references :user, index: true
    end
  end
end
