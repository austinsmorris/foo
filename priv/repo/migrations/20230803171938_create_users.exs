defmodule Foo.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: [name: :id, type: :binary_id]) do
      add(:first_name, :string)
      add(:last_name, :string)
      timestamps()
    end
  end
end
