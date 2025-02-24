# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'csv'

csv_file = Rails.root.join('db/seeds/wild_animals.csv')

puts "Seeding wild animals from CSV file..."

CSV.foreach(csv_file, headers: true) do |row|
  WildAnimal.create!(
    name: row['name'],
    scientific_name: row['scientific_name'],
    classification: row['classification'],
    habitat: row['habitat'],
    diet: row['diet'],
    conservation_status: row['conservation_status'],
    region: row['region']
  )
end

puts "Seeding complete! ✅"
