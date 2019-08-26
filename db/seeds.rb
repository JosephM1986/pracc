# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Person.destroy_all
Organisation.destroy_all

organisation1 = Organisation.create(title: 'ABC Company', location: 'Sydney')
organisation2 = Organisation.create(title: 'XYZ Company', location: 'Brisbane')
organisation3 = Organisation.create(title: 'Company ABC XYZ', location: 'Melbourne')

Person.create(first_name: 'Paul', last_name: 'Smith', organisation:organisation1, assessment_count: 5)
Person.create(first_name: 'Andrew', last_name: 'Baker', organisation:organisation2, assessment_count: 0)
Person.create(first_name: 'Michael', last_name: 'Clarke', organisation:organisation3, assessment_count: 14)
Person.create(first_name: 'David', last_name: 'Cline', organisation:organisation1, assessment_count: 3)
Person.create(first_name: 'Adam', last_name: 'Broadbent', organisation:organisation2, assessment_count: 0)
