defmodule Foo.Surveys.Survey do
  use Ecto.Schema
  import Ecto.Changeset

  alias Foo.Surveys.Question

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "surveys" do
    field :name, :string

    has_many(:questions, Question)

    timestamps()
  end

  @doc false
  def changeset(survey, attrs) do
    survey
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
