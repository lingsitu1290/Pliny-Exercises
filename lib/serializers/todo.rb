class Serializers::Todo < Serializers::Base
  structure(:default) do |arg|
    {
      created_at: arg.created_at.try(:iso8601),
      id:         arg.id,
      updated_at: arg.updated_at.try(:iso8601),
      body: arg.body
    }
  end
end
