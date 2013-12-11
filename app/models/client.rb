class Client < ActiveRecord::Base
  validates :name, :surname, length: { minimum: 2 }
end
