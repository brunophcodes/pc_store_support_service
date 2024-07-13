# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

p 'Deleting seeds'

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

User.destroy_all
Category.destroy_all
Store.destroy_all
#RepairRequest.destroy_all

p 'Creating seeds'

#UserS:
User.create!(email:'admin@gmail.com', password:'123456')


#Stores:
Store.create!(name: 'Tienda Miraflores', address: 'Begonias Street 220')
Store.create!(name: 'Tienda Rimac', address: 'Felipe Arancibia Street 448')
Store.create!(name: 'Tienda Cuzco', address: 'Tahuantinsuyo Avenue 1441')

#Categories:
Category.create!(name: 'Laptop', store_ids: [1,2])
Category.create!(name: 'Smartphone', store_ids: [2])
Category.create!(name: 'Videogames Console', store_ids: [1,3])
Category.create!(name: 'TV', store_ids: [1,2,3])


