defmodule Foo.Surveys.Option do
  use Ecto.Schema
  import Ecto.Changeset

  alias Foo.Surveys.Question

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "options" do
    field :option, :string

    belongs_to(:question, Question)

    timestamps()
  end

  @doc false
  def changeset(option, attrs) do
    option
    |> cast(attrs, [:option, :question_id])
    |> validate_required([:option, :question_id])
  end
end
