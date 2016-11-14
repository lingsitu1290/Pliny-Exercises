module Endpoints
  class TodoGroups < Base
    namespace "/todo-groups" do
      serializer Serializers::TodoGroup

      get do
        encode serialize(TodoGroup.all)
      end

      post do
        # warning: not safe
        todo_group = TodoGroup.new(body_params)
        todo_group.save
        status 201
        encode serialize(todo_group)
      end

      get "/:id" do |id|
        todo_group = TodoGroup.first(id: id) || halt(404)
        encode serialize(todo_group)
      end

      patch "/:id" do |id|
        todo_group = TodoGroup.first(id: id) || halt(404)
        # warning: not safe
        #todo_group.update(body_params)
        encode serialize(todo_group)
      end

      delete "/:id" do |id|
        todo_group = TodoGroup.first(id: id) || halt(404)
        todo_group.destroy
        encode serialize(todo_group)
      end
    end
  end
end
