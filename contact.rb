# Copy your entire Contact class from the old crm assignment here.
# Then, run the following at the command line:
#
#   ruby test/contact_test.rb
#
# If your implementation of the Contact class is 'right', then you should see that all tests pass!
class Contact

  attr_accessor :first_name, :last_name, :email, :note
  attr_reader :id

    @@contacts = []
    @@next_id = 1900


  def self.all
        return @@contacts
  end

  def self.display_all
    @@contacts.each do |contact|
      puts "ID:[#{contact.id}] #{contact.first_name} #{contact.last_name} #{contact.email} #{contact.note}"
    end
  end

  def self.display_one
    puts "ID:[#{contact.id}] #{contact.first_name} #{contact.last_name} #{contact.email} #{contact.note}"
  end

  def self.create(first_name, last_name, email, note)
    # 1. Initialize a new Contact with a unique ID
    new_contact = self.new(first_name, last_name, email, note)

    # 2. Add the new Contact to the list of all contacts
    @@contacts << new_contact

    # 3. Increment the next unique ID
    @@next_id += 1

    # 4. Return result
    new_contact
  end


  def initialize(first_name, last_name, email, note)
    @id = @@next_id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def update(to_update, update_info)
    case to_update
    when 'first_name'
        @first_name = update_info
      when 'last_name'
        @last_name = update_info
      when 'email'
        @email = update_info
      when 'note'
        @note = update_info
      puts "Updated details:"
      puts "#{@first_name} #{@last_name} #{@email} #{@note}"
    end
  end

  def self.find(info)
    @@contacts.each do |contact|
      if contact.id == info
          return contact
     end
    end
  end

  def self.find_by(att, value)

    result = []
    @@contacts.each do |contact|
      case value
        when contact.first_name
          result << contact
        when contact.last_name
          result << contact
        when contact.email
          result << contact
        when contact.note
          result << contact
      end
    end
    puts "Matching contacts:"
    result.each do |matches|
      puts "ID [#{matches.id}] #{matches.first_name} #{matches.last_name} #{matches.email} #{matches.note}"
      return matches
    end
  end

  def self.delete_all
    @@contacts = []
  end

  def delete
    @@contacts.delete(self)
  end

end

# test2 = Contact.create("Michelle","Manahan","Manahan.michelle@gmail.com","Hello!")
# test1 = Contact.create("Yuri","Manahan","Yuri.manahan@gmail.com","Hi!")
# test3 = Contact.create("Marshall", "Manahan", "Marshall.manahan@gmail.com","Howdy!")
# test4 = Contact.create("Benson", "Henderson", "Test@test.com","Bellator")
