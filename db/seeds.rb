require 'faker'

10.times do
  User.create(
    name: Faker::Name.unique.name,
    email: Faker::Internet.unique.email,
    phone: Faker::PhoneNumber.phone_number
  )
end

10.times do
  Developer.create(
    name: Faker::Name.unique.name,
    email: Faker::Internet.unique.email,
    phone: Faker::PhoneNumber.phone_number,
    category: %w[bug feature].sample
  )
end

10.times do
  Project.create(
    name: Faker::Lorem.words(number: 2).join(' '),
    description: Faker::Lorem.paragraph,
    due_date: Faker::Date.forward(days: 30),
    user: User.all.sample
  )
end

20.times do
  Task.create(
    name: Faker::Lorem.sentence(word_count: 4),
    description: Faker::Lorem.paragraph,
    due_date: Faker::Date.forward(days: 30),
    project: Project.all.sample,
    developer: Developer.all.sample
  )
end
