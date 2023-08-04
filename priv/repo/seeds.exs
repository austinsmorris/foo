# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Foo.Repo.insert!(%Foo.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`a
# and so on) as they will fail if something goes wrong.

survey = Foo.Surveys.create_survey("Basic Math")
Foo.Surveys.create_question("What is 2 +2?", survey, ["3", "4", "5"])
