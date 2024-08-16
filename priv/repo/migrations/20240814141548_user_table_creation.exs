defmodule RtcApp.Repo.Migrations.UserTableCreation do
  use Ecto.Migration

  def change do
    create table("user") do
      add :username, :string
      add :password, :string

      timestamps()
    end
  end
end
