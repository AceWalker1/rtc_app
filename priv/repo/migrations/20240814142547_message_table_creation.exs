defmodule RtcApp.Repo.Migrations.MessageTableCreation do
  use Ecto.Migration

  def change do
    create table("message") do
      add :body, :string

      timestamps()
    end
  end
end
