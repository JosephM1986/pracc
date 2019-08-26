class Organisation < ApplicationRecord
    has_many :person
    def self.search(search)
        if search
          where('title LIKE ?', "%#{search}%")
        else
          all
        end
    end
end
