# lib/roomrate/reviews.ex
defmodule Roomrate.Reviews do
  import Ecto.Query, warn: false
  alias Roomrate.Repo
  alias Roomrate.Reviews.Review

  def list_reviews do
    Repo.all(Review)
  end

  def create_review(attrs \\ %{}) do
    %Review{}
    |> Review.changeset(attrs)
    |> Repo.insert()
  end
end
