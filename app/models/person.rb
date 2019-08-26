class Person < ApplicationRecord

  belongs_to :organisation

  def self.search(search)
    if search
      joins(:organisation).where('people.first_name LIKE ? OR people.last_name LIKE ? OR organisations.title LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")

      # Organisation.where('title LIKE ?', "%#{search}%")
      # Person.where('first_name LIKE ? OR last_name LIKE ?', "%#{search}%", "%#{search}%")

    else
      all
    end
  end
end
