# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Box, type: :model do
  describe 'box validations' do
    let(:test_box) { Box.new(name: 'Test Box', box_type: 'Room', description: 'test description') }

    it 'is valid with valid attributes' do
      expect(test_box).to be_valid
    end

    it 'is invalid with no name' do
      test_box.name = nil

      expect(test_box).to_not be_valid
    end

    it 'is invalid with no description' do
      test_box.description = nil

      expect(test_box).to_not be_valid
    end

    it 'is invalid with invalid box_type' do
      test_box.box_type = nil

      expect(test_box).to_not be_valid
    end
  end

  describe 'box associations' do
    it { should belong_to(:parent).without_validating_presence }

    it { should have_many(:children).without_validating_presence }
  end
end
