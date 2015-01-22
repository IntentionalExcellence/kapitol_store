# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Spree::Core::Engine.load_seed if defined?(Spree::Core)
# Spree::Auth::Engine.load_seed if defined?(Spree::Auth)

mark = User.create_with(password: "password").find_or_create_by(email: "mark@kapitolreef.com")
unless mark.has_spree_role?("admin")
  mark.spree_roles << Spree::Role.where(name: "admin")
end
