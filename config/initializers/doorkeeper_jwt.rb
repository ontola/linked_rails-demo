# frozen_string_literal: true

Doorkeeper::JWT.configure do
  # Set the payload for the JWT token. This should contain unique information
  # about the user.
  # Defaults to a randomly generated token in a hash
  # { token: "RANDOM-TOKEN" }
  token_payload do |opts|
    user =
      if opts[:scopes].include?('guest')
        LinkedRails.guest_user_class.new(id: opts[:resource_owner_id])
      elsif opts[:resource_owner_id]
        User.find(opts[:resource_owner_id])
      end

    user_opts = user && {
      type: user.guest? ? 'guest' : 'user',
      '@id': user.iri,
      id: user.id.to_s,
      language: I18n.locale
    }
    payload = {
      iat: Time.current.to_i,
      iss: LinkedRails.iri.to_s,
      application_id: opts[:application]&.uid,
      scopes: opts[:scopes].entries,
      user: user_opts
    }
    payload[:exp] = (opts[:created_at] + opts[:expires_in].seconds).to_i if opts[:expires_in].present?
    payload
  end

  # Use the application secret specified in the Access Grant token
  # Defaults to false
  # If you specify `use_application_secret true`, both secret_key and secret_key_path will be ignored
  # use_application_secret true

  # Set the encryption secret. This would be shared with any other applications
  # that should be able to read the payload of the token.
  # Defaults to "secret"
  secret_key Rails.application.secrets.jwt_encryption_token || Rails.application.credentials.jwt_encryption_token

  # If you want to use RS* encoding specify the path to the RSA key
  # to use for signing.
  # If you specify a secret_key_path it will be used instead of secret_key
  # secret_key_path 'path/to/file.pem'

  # Specify encryption type. Supports any algorithim in
  # https://github.com/progrium/ruby-jwt
  # defaults to nil
  encryption_method Rails.application.config.jwt_encryption_method
end
