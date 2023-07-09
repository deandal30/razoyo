defmodule Razoyo.Cars.Car do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [
    :id,
    :year,
    :make,
    :model,
    :img_url,
    :price,
    :mpg,
    :seats
  ]}

  schema "cars" do
    field :img_url, :string
    field :make, :string
    field :model, :string
    field :mpg, :string
    field :price, :string
    field :seats, :string
    field :year, :string

    timestamps()
  end

  @doc false
  def changeset(car, attrs) do
    car
    |> cast(attrs, [:make, :year, :model, :img_url, :price, :mpg, :seats])
    |> validate_required([:make])
  end
end
