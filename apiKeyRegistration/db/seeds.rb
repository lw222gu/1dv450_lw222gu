# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create
admin.username = 'admin'
admin.password = 'pass123'
admin.password_confirmation = 'pass123'
admin.admin = true
admin.save

u = User.create
u.username = 'user'
u.password = '123'
u.password_confirmation = '123'
u.save

c = Client.create
c.name = 'En applikation'
c.description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
c.url = 'www.test.se'

charset = Array('A'..'Z') + Array('a'..'z')
random = Array.new(10) { charset.sample }.join
c.key = DateTime.now.strftime('%s') + random

c.user_id = 2
c.save
