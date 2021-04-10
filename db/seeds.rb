# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create({email:'hipsterhacker@pm.me', password:'Fidelio'})
user2 = User.create({email:'odette@pm.me', password:'Fidelio'})
user3= User.create({email:'lisa@pm.me', password:'Fidelio'})

rubyBooks = Channel.create({ name: 'Ruby', object_type: 'book', description: 'Best resources for learning Ruby', user_id: user1.id})
jsBooks = Channel.create({ name: 'JS', object_type: 'book', description: 'Best resources for learning JavaScript', user_id: user1.id})
songs = Channel.create({ name: 'Love', object_type: 'song', description: 'Best love songs', user_id: user2.id})

items = Item.create([
  {votes_count: 2, name: 'Ruby on Rails guides', url: 'https://guides.rubyonrails.org', channel_id: rubyBooks.id},
  {votes_count: 1, name: 'Ruby Science', url: 'https://books.thoughtbot.com/assets/ruby-science.pdf', channel_id: rubyBooks.id},
  {votes_count: 1, name: 'JS Allonge', url: 'https://leanpub.com/javascriptallongesix/read', channel_id: jsBooks.id},
  {votes_count: 1, name: 'If you go away by Emiliana Torrini', url: 'https://www.youtube.com/watch?v=lrj3YPTCbtA', channel_id: songs.id}
])

Vote.create([
  {item_id: items[0].id, user_id: user1.id, new_item: true},
  {item_id: items[0].id, user_id: user3.id, new_item: false},
  {item_id: items[1].id, user_id: user1.id, new_item: true},
  {item_id: items[2].id, user_id: user1.id, new_item: true},
  {item_id: items[3].id, user_id: user2.id, new_item: true},
  {item_id: items[3].id, user_id: user3.id, new_item: false}
])


