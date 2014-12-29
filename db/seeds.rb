# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.delete_all

# ...
Product.create!(title: 'Programming Ruby 1.9 & 2.0',
	description:
	%{<p>
		Ruby is the fastest growing and most exciting dynamic language out 
		there. If you need to get working programs delivered fast, 
		you should add Ruby to your toolvox
		<p>},
		image_url: 'ruby.jpg',
		price: 49.95)

Product.create!(title: 'Concepts of Physics',
	description:
	%{<p>
		Concepts of Physics has always been the preferred choice of book by Elementary Physics student,
		for it provides a great base to catch further students.
		<p>},
		image_url: 'concepts.jpg',
		price: 99.95)

Product.create!(title: 'Organic Chemistry',
	description:
	%{<p>
		Primer on Organic Chemistry for the students of 11 & 12 ,
		specifically those preparing for their Competitive Exams.
		<p>},
		image_url: 'organic.jpg',
		price: 99.95)

# ...