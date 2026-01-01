namespace :dev do
  desc "Add fake data to the database"
  task setup: :environment do
    add_kinds && add_fake_data
  end

  def add_fake_data
    puts "Adding fake data to the database..."
    puts "Adding 30 contacts..."
    30.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.birthday(min_age: 18, max_age: 65),
        kind: Kind.all.sample
      )
    end
  end

  def add_kinds
    puts "Adding kinds..."
    Kind.create!(description: "Friend")
    Kind.create!(description: "Family")
    Kind.create!(description: "Work")
    Kind.create!(description: "Other")
  end
end
