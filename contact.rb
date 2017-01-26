gem 'activerecord', '=4.2.7'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm-web.sqlite3')

class Contact < ActiveRecord::Base

  field :first_name, as: :string
  field :last_name,  as: :string
  field :email,      as: :string
  field :note,       as: :text

  def full_name
    "#{first_name} #{last_name}"
  end

  Contact.auto_upgrade!
end
# test2 = Contact.create("Michelle","Manahan","Manahan.michelle@gmail.com","Hello!")
# test1 = Contact.create("Yuri","Manahan","Yuri.manahan@gmail.com","Hi!")
# test3 = Contact.create("Marshall", "Manahan", "Marshall.manahan@gmail.com","Howdy!")
# test4 = Contact.create("Benson", "Henderson", "Test@test.com","Bellator")
