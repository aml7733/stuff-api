# frozen_string_literal: true

# ApplicationRecord basic out-of-the-box rails record, parent for other models
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
