defmodule Foo.SurveysTest do
  use Foo.DataCase

  alias Foo.Repo
  alias Foo.Surveys
  alias Foo.Surveys.Option
  alias Foo.Surveys.Question
  alias Foo.Surveys.Survey

  describe "create_survey/1" do
    test "a new survey is created" do
      survey = Surveys.create_survey("test")

      assert survey.name === "test"
      refute is_nil(survey.id)
    end
  end

  describe "create_question/3" do
    test "a new question is created associated with a survey" do
      survey = Surveys.create_survey("foo")
      question = Surveys.create_question("bar", survey)

      assert question.question === "bar"
      refute is_nil(question.id)

      assert question.survey_id === survey.id
    end

    test "creates a question with provided options" do
      survey = Surveys.create_survey("foo")
      %{options: [opt1, opt2]} = question = Surveys.create_question("bar", survey, ["baz", "bat"])

      assert question.question === "bar"
      refute is_nil(opt1.id)
      refute is_nil(opt2.id)

      assert opt1.option === "baz"
      assert opt1.question_id === question.id
      assert opt2.option === "bat"
      assert opt2.question_id === question.id
    end
  end

  describe "create_option/2" do
    test "a new option is created" do
      survey = Surveys.create_survey("foo")
      question = Surveys.create_question("bar", survey)
      option = Surveys.create_option("baz", question)

      assert option.option === "baz"
      refute is_nil(option.id)
    end
  end

  describe "get_surveys/0" do
    test "returns all surveys" do
      Repo.delete_all(Option)
      Repo.delete_all(Question)
      Repo.delete_all(Survey)
      survey = Surveys.create_survey("foo")
      Surveys.create_question("bar", survey, ["baz", "bat"])

      surveys = Surveys.get_surveys()

      assert length(surveys) === 1
    end
  end
end
