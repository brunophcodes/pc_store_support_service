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
RepairRequest.destroy_all

p 'Creating seeds'

#UserS:
User.create!(email:'admin@gmail.com', password:'admin123')


#Stores:
Store.create!(name: 'Tienda Miraflores', address: 'Begonias Street 220')
Store.create!(name: 'Tienda Rimac', address: 'Felipe Arancibia Street 448')
Store.create!(name: 'Tienda Cuzco', address: 'Tahuantinsuyo Avenue 1441')

#Categories:
Category.create!(name: 'Laptop', store_ids: [1,2])
Category.create!(name: 'Smartphone', store_ids: [2])
Category.create!(name: 'Videogames Console', store_ids: [1,3])
Category.create!(name: 'TV', store_ids: [1,2,3])


#RepairRequests:

RepairRequest.create!(client_email: 'anitakat@gmail.com', product_name: 'PlayStation 4', product_category: 'Videogames Console', repair_description: 'Disc reader is not working', repair_price: 50, repair_status: 'Aproved', store_id: 1 )
RepairRequest.create!(client_email: 'martin2@gmail.com', product_name: 'Samsung 50" 4K OLED', product_category: 'TV', repair_description: 'The screen has some dead pixels', repair_price: 130, repair_status: 'Aproved', store_id: 1 )
RepairRequest.create!(client_email: 'valeria_a@gmail.com', product_name: 'iPhone 12 Pro', product_category: 'Smartphone', repair_description: 'Battery is not charging', repair_price: 80, repair_status: 'Aproved', store_id: 2 )
RepairRequest.create!(client_email: 'lucas44@gmail.com', product_name: 'Asus Tuf Gaming 15', product_category: 'Laptop', repair_description: "it's loud and heats up too fast", repair_price: 50 , repair_status: 'Aproved', store_id: 2 )
RepairRequest.create!(client_email: 'joelt15@gmail.com', product_name: 'Smart ThinQ LG 55" 4K', product_category: 'TV', repair_description: 'There are weird lines near the border', repair_price: 120, repair_status: 'Aproved', store_id: 2 )
RepairRequest.create!(client_email: 'emma29@gmail.com', product_name: 'Nitro Acer', product_category: 'Laptop', repair_description: 'the camera is not working', repair_price: 50 , repair_status: 'Aproved', store_id: 1 )
RepairRequest.create!(client_email: 'sofia19@gmail.com', product_name: 'Samsung Galaxy S22', product_category: 'Smartphone', repair_description: 'Touchpad does not detect my motions or typing', repair_price: 80 , repair_status: 'Aproved', store_id: 2 )
RepairRequest.create!(client_email: 'maria1980@gmail.com', product_name: 'Huawei Matebook D14', product_category: 'Laptop', repair_description: "the trackpad doesn't work", repair_price: 75 , repair_status: 'Aproved', store_id: 1 )
RepairRequest.create!(client_email: 'hugo5@outlook.com', product_name: 'Xbox Series X', product_category: 'Videogames Console', repair_description: 'Cannot connect to internet', repair_price: 70, repair_status: 'Aproved', store_id: 3 )
RepairRequest.create!(client_email: 'paula_lol@gmail.com', product_name: 'Samsung 65" Smart TV Crystal UHD', product_category: 'TV', repair_description: "it has no sound", repair_price: 0, repair_status: 'Denied', store_id: 1 )