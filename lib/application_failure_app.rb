# frozen_string_literal: true

# Custom failure app for custom responder
class ApplicationFailureApp < Devise::FailureApp
  def http_auth_body
    return super unless request_format == :json

    {
      success: false,
      message: i18n_message
    }.to_json
  end
end
