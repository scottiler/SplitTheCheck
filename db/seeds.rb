# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
Restaurant.delete_all
csv_text = File.read(Rails.root.join('lib', 'seeds', 'restaurants.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Restaurant.new
  t.name = row['name']
  t.location = row['location']
  t.willSplit = row['willSplit']
  t.wontSplit = row['wontSplit']

  t.save
  puts "#{t.name} saved"
end

puts "There are now #{Restaurant.count} rows in the Restaurant table"
