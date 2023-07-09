defmodule Razoyo.Repo.Migrations.CreateCars do
  use Ecto.Migration

  def change do
    create table(:cars) do
      add :make, :string
      add :year, :string
      add :model, :string
      add :img_url, :string
      add :price, :string
      add :mpg, :string
      add :seats, :string

      timestamps()
    end
  end
end
