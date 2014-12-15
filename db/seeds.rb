# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin_user = CreateAdminService.new.call
technician_user = CreateTechnicianService.new.call
line_manager_user = CreateManagerService.new.call
puts 'CREATED ADMIN USER: ' << admin_user.email
puts 'CREATED TECHNICIAN USER: ' << technician_user.email
puts 'CREATED LINE MANAGER USER: ' << line_manager_user.email


