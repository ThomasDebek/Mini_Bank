class Client < ActiveRecord::Base
  validates :name, :surname, length: { minimum: 2 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
  validates :phone, format: { with: /\d{3}-\d{3}-\d{3}/, message: "bad format" }


  def to_s
    "#{name} #{surname} (#{id})"
  end






end
