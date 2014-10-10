class Ownership < ActiveRecord::Base
  belongs_to :link
  belongs_to :user
  belongs_to :organization
end