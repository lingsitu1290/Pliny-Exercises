require "spec_helper"

RSpec.describe Endpoints::TodoGroups do
  include Committee::Test::Methods
  include Rack::Test::Methods

  def app
    Routes
  end

  def schema_path
    "./schema/schema.json"
  end

  before do
    @todo_group = TodoGroup.create

    # temporarily touch #updated_at until we can fix prmd
    @todo_group.updated_at
    @todo_group.save
  end

  describe 'GET /todo-groups' do
    it 'returns correct status code and conforms to schema' do
      get '/todo-groups'
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

=begin
  describe 'POST /todo-groups' do
    it 'returns correct status code and conforms to schema' do
      header "Content-Type", "application/json"
      post '/todo-groups', MultiJson.encode({})
      assert_equal 201, last_response.status
      assert_schema_conform
    end
  end
=end

  describe 'GET /todo-groups/:id' do
    it 'returns correct status code and conforms to schema' do
      get "/todo-groups/#{@todo_group.id}"
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'PATCH /todo-groups/:id' do
    it 'returns correct status code and conforms to schema' do
      header "Content-Type", "application/json"
      patch "/todo-groups/#{@todo_group.id}", MultiJson.encode({})
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'DELETE /todo-groups/:id' do
    it 'returns correct status code and conforms to schema' do
      delete "/todo-groups/#{@todo_group.id}"
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end
end
