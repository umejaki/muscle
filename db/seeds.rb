# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'a@1',
  password: '111111'
)

Tag.create([
  { name: '上半身トレーニング' },
  { name: '腹筋' },
  { name: '下半身トレーニング' },
  { name: '器具トレーニング' },
])