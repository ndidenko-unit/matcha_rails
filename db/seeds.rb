# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

password = '5956861'
1.upto(5) do |i|
  @user = User.new(
      email: "user-#{i}@test.com",
      password: password,
      password_confirmation: password
  )
  @user.skip_confirmation!
  @user.save
end
  @user = User.new(
    email: "5773480@gmail.com",
    password: password,
    password_confirmation: password
)
  @user.skip_confirmation!
  @user.save