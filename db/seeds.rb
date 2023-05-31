10.times do |author_number|
  puts "Creating author number: #{author_number + 1}"

  author = Author.create(
    name: Faker::Name.unique.name
  )

  Article.create(
    title:     Faker::Lorem.sentence,
    body:      Faker::Lorem.paragraphs.join("\n"),
    author_id: author.id,
    published: true
  )
end
