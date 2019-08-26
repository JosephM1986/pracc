class Person < ApplicationRecord

  belongs_to :organisation

  def self.search(search)
    if search
      # whave to join a query between people and organisation to be able to access both in the search function
      joins(:organisation).where('people.first_name LIKE :s OR people.last_name LIKE :s OR organisations.title LIKE :s', s: "%#{search}%")

      # Organisation.where('title LIKE ?', "%#{search}%")
      # Person.where('first_name LIKE ? OR last_name LIKE ?', "%#{search}%", "%#{search}%")

    else
      all
    end
  end
end
