Doorkeeper.configure do
  api_only
  grant_flows %w[password]
  skip_client_authentication_for_password_grant

  resource_owner_from_credentials do |routes|
    user = User.find_by(email: params[:email])
    user if user&.valid_password?(params[:password])
  end
  
end
