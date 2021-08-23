Group.destroy_all
Contact.destroy_all
User.destroy_all

user = User.create!(email: "demo@site.com", password: "demo123")

group_ids = Group.create([
  {name: 'Family'},
  {name: 'Friend'},
  {name: 'Colleagues'}
]).pluck(:id)


15.times do |i|
	contact = user.contacts.create!({
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		email: Faker::Internet.email,
		company: Faker::Company.name,
		group_id: group_ids[Random.rand(0..2)]
	})
    
    contact.phones << Phone.new(number: Faker::PhoneNumber.phone_number)
    contact.phones << Phone.new(number:  Faker::PhoneNumber.cell_phone)


	
    contact.addresses << Address.new({
		street: Faker::Address.street_name,
		zip_code: Faker::Address.zip,
		city: Faker::Address.city,
		state: Faker::Address.state
	})
end