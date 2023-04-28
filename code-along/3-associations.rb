# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Contact.destroy_all
# **************************

# - Insert and read contact data for companies in the database

# 1. insert new rows in the contacts table with relationship to a company

apple = Company.find_by({"name"=>"apple"})
new_contact = Contact.new

new_contact ["first name"] = "Tim" #PUSE MAL EL NOMBRE FIRST NAME (sin guion bajo)
new_contact ["last_name"] = "Cook"
new_contact ["email"] = "tim@apple.com"
new_contact ["company_id"] = apple ["id"]
new_contact.save

new_contact_2 = Contact.new
new_contact_2 ["first name"] = "Juan" #PUSE MAL EL NOMBRE FIRST NAME (sin guion bajo)
new_contact_2 ["last_name"] = "C"
new_contact_2 ["email"] = "jc@apple.com"
new_contact_2 ["company_id"] = apple ["id"]
new_contact_2.save

# 2. How many contacts work at Apple?
apple_contacts = Contact.where({ "company_id" => apple["id"] })
#puts apple_contacts.inspect

puts "Contacts at Apple: #{apple_contacts.count}"

# 3. What is the full name of each contact who works at Apple?

contacts = Contact.all

for contact in apple_contacts
    first_name = contact ["first name"]
    last_name = contact ["last_name"]
    puts "#{first_name} #{last_name}"
end

