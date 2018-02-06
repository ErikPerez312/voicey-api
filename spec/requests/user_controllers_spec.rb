require 'rails_helper'

#ORIGINAL CODEEEE
# RSpec.describe "UserControllers", type: :request do
#   describe "GET /user_controllers" do
#     it "works! (now write some real specs)" do
#       get user_controllers_path
#       expect(response).to have_http_status(200)
#     end
#   end
# end

RSpec.describe "UserControllers", type: :request do
  describe "GET /user_controllers" do
    context "unauthorized" do
      before {
        get "/users"
      }

      it "fails when there is no authentication" do
        expect(response).to_not be_success
      end
    end

    context "authorized" do
      before {
        user = User.new(
          name: "Erik",
          email: "erik@test.com",
          password: "1234"
        )

        user.save

        # Compose token for request
        full_token = "Token token=#{user.token}"

        get "/users", headers: { 'Authorization' => full_token }
      }
      it "succeeds when there is authentication" do
        expect(response).to be_success
      end
    end
  end

  # Test signing up a user
  describe "POST /user_controllers" do
    context "valid params" do
      before {
        valid_params = {name: "Erik", email: "Erik@test.com", password: "testpassword"}
        post "/users", params: valid_params
      }

      it "creates and sends success of creating a user with valid params" do
        expect(response).to be_success
      end
    end

    context "invalid params" do
      before {
        invalid_params = {email: "erik@test.com", password: "testpassword"}
        post "/users", params: invalid_params
      }

      it "should fail and send 400" do
        expect(response).to_not be_success
      end
    end
  end
end
