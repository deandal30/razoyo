defmodule Razoyo.CarsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Razoyo.Cars` context.
  """

  @doc """
  Generate a car.
  """
  def car_fixture(attrs \\ %{}) do
    {:ok, car} =
      attrs
      |> Enum.into(%{
        img_url: "some img_url",
        make: "some make",
        model: "some model",
        mpg: "some mpg",
        price: "some price",
        seats: "some seats",
        year: "some year"
      })
      |> Razoyo.Cars.create_car()

    car
  end
end
