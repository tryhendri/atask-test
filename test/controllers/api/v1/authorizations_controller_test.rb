class Api::V1::AuthorizationsControllerTest < ActionDispatch::IntegrationTest
  test "should create a session with valid credentials" do
    post api_v1_authorizations_url, params: { authorization: { email: 'test1@example.com', password: 'password1' } }
    assert_response :success
  end

  test "should return unauthorized with invalid credentials" do
    post api_v1_authorizations_url, params: { authorization: { email: "invalid@example.com", password: "wrong_password" }}
    assert_response :unauthorized
  end
end