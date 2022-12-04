# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Book.destroy_all
Author.destroy_all

muir = Author.create!(name: 'Tamsyn Muir', alive: true, hometown: 'Howick, New Zealand', age_published: 34)

king = Author.create!(name: 'Stephen King', alive: true, hometown: 'Portland, Maine, USA', age_published: 26)

chupeco = Author.create!(name: 'Rin Chupeco', alive: true, hometown: 'Manila, Philippines', age_published: 30)

muir.books.create!(title: 'Gideon the Ninth', publish_date: '2019-09-10', pages: 448, in_series: true)
muir.books.create!(title: 'Harrow the Ninth', publish_date: '2020-08-04', pages: 552, in_series: true)
muir.books.create!(title: 'Nona the Ninth', publish_date: '2022-09-13', pages: 480, in_series: true)
muir.books.create!(title: 'Princess Floralinda and the Forty-Flight Tower', publish_date: '2020-11-30', pages: 146, in_series: false)

king.books.create!(title: 'Carrie', publish_date: '1974-04-05', pages: 199, in_series: false)
king.books.create!(title: 'Pet Sematary', publish_date: '1983-11-14', pages: 374, in_series: false)
king.books.create!(title: 'It', publish_date: '1986-09-15', pages: 1138, in_series: false)
king.books.create!(title: 'Fairy Tale', publish_date: '2022-09-06', pages: 608, in_series: false)

chupeco.books.create!(title: 'The Bone Witch', publish_date: '2017-03-07', pages: 411, in_series: true)
chupeco.books.create!(title: 'The Heart Forger', publish_date: '2018-03-20', pages: 503, in_series: true)
chupeco.books.create!(title: 'The Shadowglass', publish_date: '2019-03-05', pages: 449, in_series: true)
chupeco.books.create!(title: 'The Sacrifice', publish_date: '2022-09-27', pages: 332, in_series: false)


# rails g migration CreateAuthors name:string alive:boolean hometown:string age_published:integer

# rails g migration CreateBooks name:string publish_date:string pages:integer in_series:boolean
