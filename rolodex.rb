class Rolodex
	attr_reader :contacts
	@@index = 1000
	def initialize
		@contacts = [] # each Contact object is being stored in the contacts array.
					   # each Contact object is an element in the array
	end

	def add_contact(contact) #Adds a new contact
		contact.id = @@index
		@@index += 1
		@contacts << contact
	end

	def find(contact_id) #Find a user by their ID
	    @contacts.find {|contact| contact.id == contact_id }
	end

	def remove_contact(contact)
    	@contacts.delete(contact)
  	end
end