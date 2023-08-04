defmodule Foo.Repo.Migrations.CreateSurveys do
  use Ecto.Migration

  def change do
    create table(:surveys, primary_key: [name: :id, type: :binary_id]) do
      add(:name, :string)

      timestamps()
    end
  end
end
