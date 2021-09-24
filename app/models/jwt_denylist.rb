# frozen_string_literal: true

# Neccessary for jwt authentication
class JwtDenylist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Denylist

  self.table_name = 'jwt_denylist'
end
