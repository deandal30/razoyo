defmodule RazoyoWeb.CarController do
  use RazoyoWeb, :controller

  alias Razoyo.Cars
  alias Razoyo.Cars.Car

  def index(conn, _params) do
    cars = Cars.list_cars()
    render(conn, "index.html", cars: cars)
  end

  def new(conn, _params) do
    changeset = Cars.change_car(%Car{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"car" => car_params}) do
    case Cars.create_car(car_params) do
      {:ok, car} ->
        conn
        |> put_flash(:info, "Car created successfully.")
        |> redirect(to: Routes.car_path(conn, :show, car))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    car = Cars.get_car!(id)
    render(conn, "show.html", car: car)
  end

  def edit(conn, %{"id" => id}) do
    car = Cars.get_car!(id)
    changeset = Cars.change_car(car)
    render(conn, "edit.html", car: car, changeset: changeset)
  end

  def update(conn, %{"id" => id, "car" => car_params}) do
    car = Cars.get_car!(id)

    case Cars.update_car(car, car_params) do
      {:ok, car} ->
        conn
        |> put_flash(:info, "Car updated successfully.")
        |> redirect(to: Routes.car_path(conn, :show, car))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", car: car, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    car = Cars.get_car!(id)
    {:ok, _car} = Cars.delete_car(car)

    conn
    |> put_flash(:info, "Car deleted successfully.")
    |> redirect(to: Routes.car_path(conn, :index))
  end

  # API INTEGRATION
  def search(conn, _params) do
    cars = Cars.list_cars()
    json conn, cars
  end

  def show_data(conn, %{"id" => id}) do
    car = Cars.get_car!(id)
    json conn, car
  end

  def filter(conn, car_params) do
    car = Cars.filter_cars_by_make(car_params)
    json conn, car
  end
end
