# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Razoyo.Repo.insert!(%Razoyo.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Razoyo.Cars.create_car(%{
  year: "2023",
  make: "Toyota",
  model: "Corolla Altis",
  img_url: "https://i.i-sgcm.com/new_cars/cars/12618/12618_g1_b.jpg",
  price: "₱ 1,317,000",
  mpg: "30",
  seats: "5"
})

Razoyo.Cars.create_car(%{
  year: "2023",
  make: "Ford",
  model: "Mustang GT",
  img_url: "https://www.tuningblog.eu/wp-content/uploads/2023/01/2023-Ford-Mustang-GT-Carroll-Shelby-Centennial-Edition-17.jpg?ezimgfmt=ng%3Awebp%2Fngcb2%2Frs%3Adevice%2Frscb2-1",
  price: "₱ 2,948,000",
  mpg: "20",
  seats: "4"
})
  
Razoyo.Cars.create_car(%{
  year: "2023",
  make: "Subaru",
  model: "BRZ",
  img_url: "https://d15yvjwjqalz4d.cloudfront.net/wp-content/uploads/2022/01/Subaru-BRZ.jpg",
  price: "₱ 2,619,000",
  mpg: "27",
  seats: "4"
})
  
Razoyo.Cars.create_car(%{
  year: "2023",
  make: "Honda",
  model: "Civic Type R",
  img_url: "https://hips.hearstapps.com/hmg-prod/images/2023-civic-typer-0006-2-1661978268.jpg?crop=0.808xw:0.604xh;0.0162xw,0.371xh&resize=1200:*",
  price: "₱ 3,880,000",
  mpg: "12",
  seats: "4"
})

Razoyo.Cars.create_car(%{
  year: "2023",
  make: "BMW",
  model: "M3",
  img_url: "https://media.ed.edmunds-media.com/bmw/m3/2022/oem/2022_bmw_m3_sedan_competition_fq_oem_1_815.jpg",
  price: "₱ 9,690,000",
  mpg: "19",
  seats: "5"
})

Razoyo.Cars.create_car(%{
  year: "2023",
  make: "Toyota",
  model: "Fortuner",
  img_url: "https://www.autopediame.com/storage/images/Toyota/Fortuner/fortuner1.jpg",
  price: "₱ 1,736,000",
  mpg: "14",
  seats: "7"
})
  