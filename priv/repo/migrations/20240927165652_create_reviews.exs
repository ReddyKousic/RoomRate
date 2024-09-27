defmodule Roomrate.Repo.Migrations.CreateReviews do
  use Ecto.Migration

  def change do
    create table(:reviews) do
      add :user_id, :integer
      add :block, :string
      add :rating, :integer
      add :comment, :string

      timestamps(type: :utc_datetime)
    end
  end
end
