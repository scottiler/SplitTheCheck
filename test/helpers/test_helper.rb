module SignInHelper
  def sign_in_as(user)
    post sign_in_url(id: user.id, email: user.email, password: user.password)
  end
end

class ActionDispatch::IntegrationTest
  include SignInHelper
end
