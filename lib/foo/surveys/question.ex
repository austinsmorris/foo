defmodule Foo.Surveys.Question do
  use Ecto.Schema
  import Ecto.Changeset

  alias Foo.Surveys.Option
  alias Foo.Surveys.Survey

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "questions" do
    field :question, :string

    belongs_to(:survey, Survey)
    has_many(:options, Option)

    timestamps()
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [:question, :survey_id])
    |> validate_required([:question, :survey_id])
  end
end
