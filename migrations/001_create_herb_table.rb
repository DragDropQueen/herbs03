Sequel.migration do
  up do
    create_table(:herb) do
      primary_key :id
      String :name, :null=>false
    end
  end

  down do
    drop_table(:herb)
  end
end