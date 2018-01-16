# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
question1 = Question.find_by(title: "How do you computer???")
if question1.nil?
  Question.create!(title: "How do you computer???", description: "I don know how to computer sombody please help me to comuter I don't know")
end

question2 = Question.find_by(title: "What is love? How to tell what love is")
if question2.nil?
  Question.create!(title: "What is love? How to tell what love is", description: "help I am a robot and do not understand this uniquely hman thing love")
end

question3 = Question.find_by(title: "Is this thing on? It is a computer")
if question3.nil?
  Question.create!(title: "Is this thing on? It is a computer", description: "I can't tell if my computer is on or not can anyone help me")
end
