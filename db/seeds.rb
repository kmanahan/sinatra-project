#create farmers
john = Farmer.create(name: "John", farm_name: "Cozy Meadows", username: "johnnyboi", password: "password")
sally = Farmer.create(name: "Sally", farm_name: "Wild Stallions", username: "saltysally", password: "password")

#create animals 
Animal.create(name: "Bella", species: "cow", sex: "F", farmer_id: john.id)
Animal.create(name: "Billy", species: "goat", sex: "M", farmer_id: john.id)
Animal.create(name: "Charles", species: "horse", sex: "M", farmer_id: sally.id)
Animal.create(name: "Bebe", species: "horse", sex: "F", farmer_id: sally.id)

