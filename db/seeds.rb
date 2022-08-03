# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Customer.create!(
    first_name: 'さん',
    last_name: 'ぷる',
    first_name_kana: 'サン',
    last_name_kana: 'プル',
    postal_code: '0000000',
    telephone_number: '0000000',
    address: 'aaa',
    email: 'aa@a',
    password: 'aaaaaa',
    )
    
    Admin.create!(
        email: 'admin@com',
        password: 'admin1',
        )