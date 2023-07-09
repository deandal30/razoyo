defmodule Razoyo.CarsTest do
  use Razoyo.DataCase

  alias Razoyo.Cars

  describe "cars" do
    alias Razoyo.Cars.Car

    import Razoyo.CarsFixtures

    @invalid_attrs %{img_url: nil, make: nil, model: nil, mpg: nil, price: nil, seats: nil, year: nil}

    test "list_cars/0 returns all cars" do
      car = car_fixture()
      assert Cars.list_cars() == [car]
    end

    test "get_car!/1 returns the car with given id" do
      car = car_fixture()
      assert Cars.get_car!(car.id) == car
    end

    test "create_car/1 with valid data creates a car" do
      valid_attrs = %{img_url: "some img_url", make: "some make", model: "some model", mpg: "some mpg", price: "some price", seats: "some seats", year: "some year"}

      assert {:ok, %Car{} = car} = Cars.create_car(valid_attrs)
      assert car.img_url == "some img_url"
      assert car.make == "some make"
      assert car.model == "some model"
      assert car.mpg == "some mpg"
      assert car.price == "some price"
      assert car.seats == "some seats"
      assert car.year == "some year"
    end

    test "create_car/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cars.create_car(@invalid_attrs)
    end

    test "update_car/2 with valid data updates the car" do
      car = car_fixture()
      update_attrs = %{img_url: "some updated img_url", make: "some updated make", model: "some updated model", mpg: "some updated mpg", price: "some updated price", seats: "some updated seats", year: "some updated year"}

      assert {:ok, %Car{} = car} = Cars.update_car(car, update_attrs)
      assert car.img_url == "some updated img_url"
      assert car.make == "some updated make"
      assert car.model == "some updated model"
      assert car.mpg == "some updated mpg"
      assert car.price == "some updated price"
      assert car.seats == "some updated seats"
      assert car.year == "some updated year"
    end

    test "update_car/2 with invalid data returns error changeset" do
      car = car_fixture()
      assert {:error, %Ecto.Changeset{}} = Cars.update_car(car, @invalid_attrs)
      assert car == Cars.get_car!(car.id)
    end

    test "delete_car/1 deletes the car" do
      car = car_fixture()
      assert {:ok, %Car{}} = Cars.delete_car(car)
      assert_raise Ecto.NoResultsError, fn -> Cars.get_car!(car.id) end
    end

    test "change_car/1 returns a car changeset" do
      car = car_fixture()
      assert %Ecto.Changeset{} = Cars.change_car(car)
    end
  end
end
