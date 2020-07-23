# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1=User.create(name: 'Chaya', username: 'chaya', password: '123', email: '123@321.to', image_url: '')
r1=Room.create(user_id: user1.id, name: 'kitchen', description: 'nice', img_url:'', private: true)