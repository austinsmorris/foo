defmodule Foo.Repo.Migrations.CreateQuestions do
  use Ecto.Migration

  def change do
    create table(:questions, primary_key: [name: :id, type: :binary_id]) do
      add(:question, :string)
      add(:survey_id, references(:surveys, type: :binary_id))

      timestamps()
    end
  end
end
