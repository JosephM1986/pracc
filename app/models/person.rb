# frozen_string_literal: true

class Person < ApplicationRecord
  include HTTParty

  belongs_to :organisation
  validates :first_name, :last_name, presence: true

  def self.search(search)
    if search
      # whave to join a query between people and organisation to be able to access both in the search function
      joins(:organisation).where('people.first_name LIKE :s OR people.last_name LIKE :s OR organisations.title LIKE :s', s: "%#{search}%")

    else
      all
    end
  end

  def get_people
    # response = HTTParty.get
  end
end
