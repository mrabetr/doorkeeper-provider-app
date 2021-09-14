# frozen_string_literal: true

owner = User.create!(
  email: 'mrabetr@hotmail.com',
  password: '123456',
  password_confirmation: '123456'
)

project = Project.create!(
  name: 'Appibase',
  url: 'appibase.com',
  user: owner
)

app = Doorkeeper::Application.create!(
  name: 'Appibase App',
  redirect_uri: 'https://oauthdebugger.com/debug',
  owner: owner,
  project_id: project.id
)

customer = Customer.create!(
  email: 'customer@hotmail.com',
  password: '123456',
  password_confirmation: '123456',
  project: project
)

puts 'Application: '
puts "name: #{app.name}"
puts "redirect_uri: #{app.redirect_uri}"
puts "uid: #{app.uid}"
puts "secret: #{app.secret}"
