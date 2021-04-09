# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

rubyBooks = Channel.create({ name: 'Ruby', object_type: 'book', description: 'Best resources for learning Ruby'})
jsBooks = Channel.create({ name: 'JS', object_type: 'book', description: 'Best resources for learning JavaScript'})

songs = Channel.create({ name: 'Love', object_type: 'song', description: 'Best love songs'})

Item.create([
  {name: 'Ruby on Rails guides', url: 'https://guides.rubyonrails.org', channel_id: rubyBooks.id},
  {name: 'Ruby Science', url: 'https://books.thoughtbot.com/assets/ruby-science.pdf', channel_id: rubyBooks.id},
  {name: 'JS Allonge', url: 'https://leanpub.com/javascriptallongesix/read', channel_id: jsBooks.id},
  {name: 'If you go away by Emiliana Torrini', url: 'https://www.youtube.com/watch?v=lrj3YPTCbtA', channel_id: songs.id}
])


