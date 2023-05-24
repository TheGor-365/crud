10.times do |index|
  number = index + 1

  Article.create(
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraphs.join("\n"),
    author: Faker::Name.unique.name
  )
end
