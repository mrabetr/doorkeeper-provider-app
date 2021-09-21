# frozen_string_literal: true

Doorkeeper::OpenidConnect.configure do
  issuer do |resource_owner, application|
    # 'issuer string'
    'http://localhost:3000/oauth'
  end

  # https://kentakodashima.medium.com/generate-pem-keys-with-openssl-on-macos-ecac55791373
  signing_key File.read("jwtRS256.key")
  # signing_key File.read("private.pem")
  # signing_key ENV['openid_signing_key']
  # <<~KEY
  #   -----BEGIN RSA PRIVATE KEY-----
  #   ....
  #   -----END RSA PRIVATE KEY-----
  # KEY

  subject_types_supported [:public]

  resource_owner_from_access_token do |access_token|
    # Example implementation:
    # User.find_by(id: access_token.resource_owner_id)
    # Customer.find_by(id: access_token.resource_owner_id)
    access_token.resource_owner
  end

  auth_time_from_resource_owner do |resource_owner|
    # Example implementation:
    # resource_owner.current_sign_in_at
  end

  reauthenticate_resource_owner do |resource_owner, return_to|
    # Example implementation:
    # store_location_for resource_owner, return_to
    # sign_out resource_owner
    # redirect_to new_user_session_url
  end

  # Depending on your configuration, a DoubleRenderError could be raised
  # if render/redirect_to is called at some point before this callback is executed.
  # To avoid the DoubleRenderError, you could add these two lines at the beginning
  #  of this callback: (Reference: https://github.com/rails/rails/issues/25106)
  #   self.response_body = nil
  #   @_response_body = nil
  select_account_for_resource_owner do |resource_owner, return_to|
    # Example implementation:
    # store_location_for resource_owner, return_to
    # sign_out resource_owner
    # redirect_to account_select_url
    # redirect_to new_user_session_url
  end

  subject do |resource_owner, application|
    # Example implementation:
    resource_owner.id

    # or if you need pairwise subject identifier, implement like below:
    # Digest::SHA256.hexdigest("#{resource_owner.id}#{URI.parse(application.redirect_uri).host}#{'your_secret_salt'}")
    # hash the resource_owner's ID with the Rails secret_key_base to avoid revealing it
    # Digest::SHA256.hexdigest "#{resource_owner.id}-#{Rails.application.secrets.secret_key_base}"
  end

  # Protocol to use when generating URIs for the discovery endpoint,
  # for example if you also use HTTPS in development
  # protocol do
  #   :https
  # end

  # Expiration time on or after which the ID Token MUST NOT be accepted for processing. (default 120 seconds).
  # expiration 600

  # https://github.com/doorkeeper-gem/doorkeeper-openid_connect#claims
  # https://openid.net/specs/openid-connect-core-1_0.html#StandardClaims
  claims do
    # You can optionally pass a response: keyword with one or both of the symbols
    # :id_token or :user_info to specify where the claim should be returned.
    claim :email, response: [:id_token, :user_info] do |resource_owner|
      resource_owner.email
    end

  # Example claims:
  # claims do
  #   normal_claim :_foo_ do |resource_owner|
  #     resource_owner.foo
  #   end

  #   normal_claim :_bar_ do |resource_owner|
  #     resource_owner.bar
  #   end
  # end

    # claim :email do |resource_owner, scopes|
    #   scopes.exists?(:email) ? resource_owner.email : ''
    # end

    # claim :full_name do |resource_owner|
    #   "#{resource_owner.first_name} #{resource_owner.last_name}"
    # end

    # claim :preferred_username, scope: :openid do |resource_owner, scopes, access_token|
    #   # Pass the resource_owner's preferred_username if the application has
    #   # `profile` scope access. Otherwise, provide a more generic alternative.
    #   scopes.exists?(:profile) ? resource_owner.preferred_username : "summer-sun-9449"
    # end

    # claim :groups, response: [:id_token, :user_info] do |resource_owner|
    #   resource_owner.groups
    # end
  end
end
