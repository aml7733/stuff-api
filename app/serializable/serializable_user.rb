# frozen_string_literal: true

# SerializableUser class uses jsonapi, only returns email for users
class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'

  attributes :email

  link :self do
    @url_helpers.api_user_url(@object.id)
  end
end
