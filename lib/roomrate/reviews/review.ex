# lib/roomrate/reviews/review.ex
defmodule Roomrate.Reviews.Review do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reviews" do
    field :user_id, :integer
    field :block, :string
    field :rating, :integer
    field :comment, :string

    timestamps()
  end

  @doc false
  def changeset(review, attrs) do
    review
    |> cast(attrs, [:user_id, :block, :rating, :comment])
    |> validate_required([:block, :rating, :comment])
    |> validate_inclusion(:block, ["MH1", "MH2", "MH3", "MH4", "MH5", "MH6", "LH1", "LH2", "LH3"])
    |> validate_inclusion(:rating, 1..5)
  end
end
