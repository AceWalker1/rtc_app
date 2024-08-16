defmodule RtcApp.Users do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user" do
    field :username, :string
    field :password,:string

    timestamps()
  end

  def changeset(user, params) do
    user
    |>cast(params, [:username, :password])
    |>validate_required([:username, :email])
    |>validate_format(:password, ~r/\d/)
    |>unique_constraint(:username)
  end
end
