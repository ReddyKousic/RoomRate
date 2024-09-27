defmodule RoomrateWeb.ReviewLive do
  use RoomrateWeb, :live_view
  alias Roomrate.Reviews
  alias Roomrate.Reviews.Review

  def mount(_params, _session, socket) do
    if connected?(socket), do: Phoenix.PubSub.subscribe(Roomrate.PubSub, "reviews")
    reviews = Reviews.list_reviews() |> Enum.reverse()
    {:ok, assign(socket, reviews: reviews, changeset: Review.changeset(%Review{}, %{}))}
  end

  def handle_event("submit_review", %{"review" => review_params}, socket) do
    case Reviews.create_review(review_params) do
      {:ok, review} ->
        Phoenix.PubSub.broadcast(Roomrate.PubSub, "reviews", {:new_review, review})
        {:noreply, assign(socket, changeset: Review.changeset(%Review{}, %{}))}

      {:error, changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  def handle_info({:new_review, review}, socket) do
    {:noreply, assign(socket, reviews: [review | socket.assigns.reviews])}
  end
end
