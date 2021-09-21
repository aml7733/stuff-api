require 'faker'
require 'factory_bot_rails'

module UserHelpers
  def create_user # creates user in db
    FactoryBot.create(:user,
      email: Faker::Internet.email,
      password: Faker::Internet.password
    )
  end

  def build_user # returns attributes, but does not create
    FactoryBot.build(:user,
      email: Faker::Internet.email,
      password: Faker::Internet.password
    )
  end
end
