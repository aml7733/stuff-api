# frozen_string_literal: true

require 'faker'
require 'factory_bot_rails'

module UserHelpers
  # creates user in db
  def create_user
    FactoryBot.create(:user,
                      email: Faker::Internet.email,
                      password: Faker::Internet.password)
  end

  # returns attributes, but does not create
  def build_user
    FactoryBot.build(:user,
                     email: Faker::Internet.email,
                     password: Faker::Internet.password)
  end
end
