class Mock
require 'faker'

def create_payload_default
  {
    "name": Faker::Name.name,
    "username": Faker::Superhero.name,
    "email": Faker::Internet.email,
    "address": {
      "street": Faker::Address.street_address,
      "suite": Faker::Address.building_number,
      "city": Faker::Address.city,
      "zipcode": Faker::Address.zip_code,
      "geo": {
        "lat": Faker::Address.latitude,
        "lng": Faker::Address.longitude
      }
    },
    "phone": Faker::PhoneNumber.phone_number_with_country_code,
    "website": Faker::Internet.domain_name ,
    "company": {
      "name": Faker::Company.name,
      "catchPhrase": Faker::Lorem.sentence,
      "bs": Faker::Lorem.sentence
    }
  }
end
def put_payload_default
  {
    "name": Faker::Name.last_name
  }
end
end
