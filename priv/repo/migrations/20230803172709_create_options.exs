defmodule Foo.Repo.Migrations.CreateOptions do
  use Ecto.Migration

  def change do
    create table(:options, primary_key: [name: :id, type: :binary_id]) do
      add(:option, :string)
      add(:question_id, references(:questions, type: :binary_id))

      timestamps()
    end
  end
end
