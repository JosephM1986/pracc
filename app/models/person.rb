class Person < ApplicationRecord
  
  belongs_to :organisation

  def self.search(search)
    if search
      where('first_name LIKE ? OR last_name LIKE ?', "%#{search}%", "%#{search}%")
    else
      all
    end
  end
end
