# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Order.destroy_all
User.destroy_all
Product.destroy_all

User.create(email: 'test@mail.com', password: 123456)

products  = [
  {
    name: "Accoutic Guitar",
    price: "86300",
    image: "/img/guitar.jpg"
  },
  {
    name: "Mechanical pencil",
    price: "3400",
    image: "/img/pencil.jpg"
  },
  {
    name: "Nordic Chair with Bag",
    price: "35800",
    image: "/img/chair.jpg"
  },
  {
    name: "Thermic Bottle",
    price: "25500",
    image: "/img/bottle.jpg"
  },
  {
    name: "Joypad v4",
    price: "580",
    image: "/img/control.jpg"
  },
  {
    name: "Invisible Headphones",
    price: "1200",
    image: "/img/headphones.jpg"
  },
  {
    name: "3D printed glass",
    price: "12550",
    image: "/img/cup.jpg"
  },
  {
    name: "Organic leaves extract",
    price: "65300",
    image: "/img/tinture.jpg"
  },
  {
    name: "Wireless Over-ear Headset",
    price: "88700",
    image: "/img/headset.jpg"
  },
  {
    name: "Alexa sleeve - gray",
    price: "7600",
    image: "/img/alexa.jpg"
  },
  {
    name: "Floating Backpack",
    price: "240000",
    image: "/img/backpack.jpg"
  },
  {
    name: "Indonesian Coffee - 250 grams",
    price: "3500",
    image: "/img/coffee.jpg"
  },
  {
    name: "Collectible Car",
    price: "24000",
    image: "/img/car.jpg"
  },
  {
    name: "Ray-Ban-Sun",
    price: "54500",
    image: "/img/lens.jpg"
  },
  {
    name: "Headphones",
    price: "33300",
    image: "/img/headset-yellow.jpg"
  },
  {
    name: "Digital Watch V2",
    price: "69999",
    image: "/img/watch.jpg"
  },
  {
    name: "Polaroid One Step",
    price: "180000",
    image: "/img/camera.jpg"
  }
]
Product.create! products
