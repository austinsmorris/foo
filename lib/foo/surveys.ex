defmodule Foo.Surveys do

  import Ecto.Query

  alias Foo.Repo
  alias Foo.Surveys.Option
  alias Foo.Surveys.Question
  alias Foo.Surveys.Survey

  def create_survey(name) when is_binary(name) do
    %Survey{}
    |> Survey.changeset(%{name: name})
    |> Repo.insert!()
  end

  def create_question(question, %Survey{} = survey, options \\ []) when is_binary(question) do
    question =
      %Question{}
      |> Question.changeset(%{question: question, survey_id: survey.id})
      |> Repo.insert!()

    Enum.each(options, fn option ->
      create_option(option, question)
    end)

    Repo.preload question, :options
  end

  def create_option(option, %Question{} = question) do
    %Option{}
    |> Option.changeset(%{option: option, question_id: question.id})
    |> Repo.insert!()
  end

  def get_surveys() do
    Repo.all from s in Survey, preload: [questions: [:options]]
  end
end
