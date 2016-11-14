require "spec_helper"

RSpec.describe Endpoints::TodoGroups do
  include Rack::Test::Methods

  describe "GET /todo-groups" do
    it "succeeds" do
      get "/todo-groups"
      assert_equal 200, last_response.status
    end
  end
end
