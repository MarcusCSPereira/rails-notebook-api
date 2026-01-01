namespace :dev do
  desc "Add fake data to the database"
  task setup: :environment do
    execute_method(:add_kinds, :add_fake_data, :add_phones, :add_addresses)
  end

  def execute_method(*method_names)
    puts "Resetting and migrating database..."
    system("rails db:reset")
    system("rails db:migrate")
    method_names.each do |method_name|
      puts "Executing #{method_name}..."
      send(method_name)
    end
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

  def add_phones
    Contact.all.each do |contact|
      Random.rand(1..5).times do |i|
        contact.phones.create!(number: Faker::PhoneNumber.cell_phone)
      end
    end
  end

  def add_addresses
    Contact.all.each do |contact|
      contact.create_address!(street: Faker::Address.street_address, city: Faker::Address.city)
    end
  end
end
