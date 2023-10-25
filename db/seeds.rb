# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'a@1',
  password: '1'
)

Tag.create([
  { name: '家トレ' },
  { name: '筋トレ器具' },
  { name: '私を褒めて' },
  { name: '続けていこう' },
])