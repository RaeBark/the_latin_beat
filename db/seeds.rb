# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genre.destroy_all 
Region.destroy_all
Song.destroy_all


g = Genre.create!([{name: 'Flamenco'}, {name: 'Salsa'}, {name: 'Cumbia'}, {name: 'Reggaeton'}, {name: 'Bachata'}, {name: 'Samba'}, {name: 'Tango'}, {name: 'Merengue'}, {name: 'Son'}, {name: 'Mambo'}, {name: 'Guajira'}, {name: 'Rumba'}])


r = Region.create!([
    {name: 'Spain', countries: 'Spain'}, 
    {name: 'Caribbean', countries: 'Cuba, Puerto Rico, Jamaica, Bahamas, Dominican Republic'}, 
    {name: 'Brazil', countries: 'Brazil'}, 
    {name: 'North America', countries: 'Mexico, U.S.A'}, 
    {name: 'Central America', countries: 'Costa Rica, El Salavador, Guatemala, Honduras, Nicaragua, Panama'},
    {name: 'Andean States', countries: 'Bolivia, Colombia, Ecudador, Paraguay, Peru, Venezuela'},
    {name: 'Southern Cone', countries: 'Argentina, Chile, Uruguay'}])

spain = Region.find_by(name: 'Spain')
caribbean = Region.find_by(name: 'Caribbean')
brazil = Region.find_by(name: 'Brazil')
north_america = Region.find_by(name: 'North America')
central_america = Region.find_by(name: 'Central America')
andean_states = Region.find_by(name: 'Andean States')
southern_cone = Region.find_by(name: 'Southern Cone')


flamenco = Genre.find_by( name: 'Flamenco')
salsa = Genre.find_by( name: 'Salsa')
cumbia = Genre.find_by( name: 'Cumbia')
reggaeton = Genre.find_by( name: 'Reggaeton')
bachata = Genre.find_by( name: 'Bachata')
samba = Genre.find_by( name: 'Samba')
tango = Genre.find_by( name: 'Tango')
merengue = Genre.find_by( name: 'Merengue')
son = Genre.find_by( name: 'Son')
mambo = Genre.find_by( name: 'Mambo')
guajira = Genre.find_by( name: 'Guajira')
rumba = Genre.find_by( name: 'Rumba')

user1 = User.fourth.id




s = Song.create!([
    {title: 'Entre Dos Aguas', artist: 'Paco de Lucía', album: 'Entre Dos Aguas', user_id: user1 , region_id: spain.id, genre_id: flamenco.id, favorited: false},
    {title: 'O Mar Serenou', artist: 'Clara Nunes', album: 'Conto de Areia', user_id: user1, region_id: brazil.id, genre_id: samba.id, favorited: false},
    {title: 'Este Es el Rey', artist: "La Juan D'Arienzo", album: 'Cortando Clavos', user_id: user1, region_id: southern_cone.id, genre_id: tango.id, favorited: false},
    {title: 'Acid', artist: 'Ray Barretto', album: 'Acid', user_id: user1, region_id: caribbean.id, genre_id: guajira.id, favorited: false},
    {title: 'La Vida Es Un Carnaval', artist: 'Celia Cruz', album: 'Mi Vida Es Cantar', user_id: user1, region_id: caribbean.id, genre_id: salsa.id, favorited: false},
    {title: 'Que Nadie Sepa Mi Sufrir', artist: 'La Sonora Dinamita', album: 'Margarita Y Sus Grandes Exitos', user_id: user1, region_id: andean_states.id, genre_id: cumbia.id, favorited: false}
])

