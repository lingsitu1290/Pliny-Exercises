Sequel.migration do
  change do
    # Add completion_state column to the todos table
    alter_table(:todos) do
      add_column   :completion_state, Integer, :default=>0
    end
end
end


