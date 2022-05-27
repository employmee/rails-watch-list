# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Movie.destroy_all
List.destroy_all


puts "Creating movies"
10.times do
  @list = List.create(name: Faker::Book.genre)
  puts @list.name

  @movie = Movie.create(
    title: Faker::Movie.title,
    overview: Faker::Quote.famous_last_words,
    poster_url: "https://source.unsplash.com/random",
    rating: rand(0.0..9.9).round(1)
  )
  puts @movie.title

  @bookmark = Bookmark.new(
    comment: Faker::Quote.yoda
  )
  @bookmark.list = @list
  @bookmark.movie = @movie
  @bookmark.save
  puts @bookmark.comment
end

puts "Finished creating movie seeds"
