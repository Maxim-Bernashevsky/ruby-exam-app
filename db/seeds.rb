Image.delete_all
# Image.reset_pk_sequence
Image.create([
{name: 'Auto parking', file: 'auto_parking.jpg', theme_id: 2},
{name: 'Fire', file: 'fire.jpg', theme_id: 4},
{name: 'Cone', file: 'cone.jpg', theme_id: 1},
{name: 'Eagle', file: 'eagle.jpg', theme_id: 1},
{name: 'Fondue', file: 'fondue.jpg', theme_id: 3},
{name: 'Graffiti', file: 'graffiti.jpg', theme_id: 2},
{name: 'Drops dew', file: 'drops_dew.jpg', theme_id: 1},
{name: 'Mandarins', file: 'mandarins.jpg', theme_id: 3},
{name: 'River', file: 'river.jpg', theme_id: 1},
{name: 'Mountains sunset', file: 'mountains_sunset.jpg', theme_id: 1},
{name: 'Pizza', file: 'pizza.jpg', theme_id: 3},
{name: 'River bends', file: 'river_bends.jpg', theme_id: 1},
{name: 'Beach', file: 'Beach.jpg', theme_id: 2},
{name: 'Rose', file: 'rose.jpg', theme_id: 4},
{name: 'Abstract', file: 'abstract.jpg', theme_id: 2}
])

Value.delete_all
# Value.reset_pk_sequence

Theme.delete_all
# Theme.reset_pk_sequence
Theme.create([
                 {name: 'Nature'},
                 {name: 'City'},
                 {name: 'Foods'},
                 {name: 'Other'}
])


User.delete_all
# User.reset_pk_sequence
User.create([
                 {name: '1', email: 'mail@gmail.com'},
                 {name: 'test', email: 'test@gmail.com'},
                 {name: 'Maxim', email: '123@mail.ru', password: '123123'}
])


