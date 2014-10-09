# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Organization.destroy_all
organizations = Organization.create([
  { name: "wdidc2", user_id: 1 },
  { name: "todd", user_id: 1 }
])

Membership.destroy_all
Membership.create([
  { user_id: 1, organization: organizations[0] },
  { user_id: 1, organization: organizations[1] }
])
