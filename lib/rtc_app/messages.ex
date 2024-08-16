defmodule RtcApp.Messages do
  use Ecto.Schema
  import Ecto.Changeset

  schema "message" do
    field :body, :string

    timestamps()
  end

  def changeset(message, params) do
    message
    |>cast(params, [:body])
    |>validate_required([:body])
  end
end
