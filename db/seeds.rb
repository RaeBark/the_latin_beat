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


s = Song.create!([
    {title: 'Entre Dos Aguas', artist: 'Paco de Lucía', album: 'Entre Dos Aguas', user_id: 4, region_id: 9, genre_id: 14, favorited: false},
    {title: 'O Mar Serenou', artist: 'Clara Nunes', album: 'Conto de Areia', user_id: 4, region_id: 11, genre_id: 19, favorited: false},
    {title: 'Este Es el Rey', artist: "La Juan D'Arienzo", album: 'Cortando Clavos', user_id: 4, region_id: 15, genre_id: 20, favorited: false},
    {title: 'Acid', artist: 'Ray Barretto', album: 'Acid', user_id: 4, region_id: 10, genre_id: 24, favorited: false},
    {title: 'La Vida Es Un Carnaval', artist: 'Celia Cruz', album: 'Mi Vida Es Cantar', user_id: 4, region_id: 10, genre_id: 15, favorited: false},
    {title: 'Que Nadie Sepa Mi Sufrir', artist: 'La Sonora Dinamita', album: 'Margarita Y Sus Grandes Exitos', user_id: 4, region_id: 14, genre_id: 16, favorited: false}
])
