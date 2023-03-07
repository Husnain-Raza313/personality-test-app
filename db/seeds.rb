# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(email: "admin@admin.com", password: "test@123")

question1 = Question.create(content: "You’re really busy at work and a colleague is telling you their life story and personal woes.\r\nYou:" )
question1.options.create(content: "Don’t dare to interrupt them", option_type: 0)
question1.options.create(content: "Think it’s more important to give them some of your time", option_type: 1)
question1.options.create(content: "Listen, but with only with half an ear", option_type: 0)
question1.options.create(content: "Interrupt and explain that you are really busy at something", option_type: 1)

question2 = Question.create(content: "You’ve been sitting in the doctor’s waiting room for more than 25 minutes.\r\nYou:")
question2.options.create(content: "Look at your watch every two minutes", option_type: 0)
question2.options.create(content: "Bubble with inner anger, but keep quiet", option_type: 0)
question2.options.create(content: "Explain to other equally impatient people in the room how this doctor is always late", option_type: 1)
question2.options.create(content: "Complain in a loud voice, while tapping your foot on the floor", option_type: 1)

question3 = Question.create(content: "You’re having an animated discussion with a colleague regarding a project that you’re in charge of.\r\nYou:")
question3.options.create(content: "Don’t dare contradict them", option_type: 0)
question3.options.create(content: "Think that they are obviously right", option_type: 0)
question3.options.create(content: "Defend your own point of view, tooth and nail", option_type: 1)
question3.options.create(content: "Continuously interrupt your colleague", option_type: 1)

question4 = Question.create(content: "You are taking part in a guided tour of a museum.\r\nYou:" )
question4.options.create(content: "Are a bit too far towards the back so don’t really participate", option_type: 0)
question4.options.create(content: "Follow the group without question", option_type: 0)
question4.options.create(content: "Make sure that everyone is able to hear properly", option_type: 1)
question4.options.create(content: "Are right up the front, adding your own comments ", option_type: 1)
