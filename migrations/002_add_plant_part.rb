Sequel.migration do
  up do
    add_column(:herb, :part, String)
  end

  down do
    drop_column(:herb, :part)
  end
end