class Organization < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships
  has_many :ownerships
  has_many :links, through: :ownerships
  belongs_to :user
end