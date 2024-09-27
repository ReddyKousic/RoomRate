defmodule Roomrate.Review do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reviews" do
    field :block, :string
    field :comment, :string
    field :rating, :integer
    field :user_id, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(review, attrs) do
    review
    |> cast(attrs, [:user_id, :block, :rating, :comment])
    |> validate_required([:user_id, :block, :rating, :comment])
  end
end
